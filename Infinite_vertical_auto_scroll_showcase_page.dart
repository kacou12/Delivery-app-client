import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';

class InfiniteVerticalAutoScrollShowcase extends StatefulWidget {
  const InfiniteVerticalAutoScrollShowcase({super.key});

  @override
  State<InfiniteVerticalAutoScrollShowcase> createState() =>
      _InfiniteVerticalAutoScrollShowcaseState();
}

class _InfiniteVerticalAutoScrollShowcaseState
    extends State<InfiniteVerticalAutoScrollShowcase>
    with TickerProviderStateMixin {
  late List<Ticker> _tickers;
  late List<ScrollController> _scrollControllers;
  late List<bool> _scrollDirections;
  Timer? _invertTimer;
  DateTime _lastInvertTime = DateTime.now();
  Timer? _speedCheckTimer;

  // Configuration des timings
  static const int invertIntervalSeconds = 10;
  static const double slowdownDuration = 3.0; // Augmenté pour plus de douceur
  static const double invertTransitionDuration =
      2.0; // Augmenté pour transition plus douce

  // Vitesse de base
  double baseSpeed = 1.5;

  // Velocités actuelles
  late List<double> _velocities;
  late List<double> _targetVelocities; // Nouvelles vélocités cibles

  // État de transition
  bool _isInTransition = false;

  // URLs Picsum
  final List<String> col1Images = [
    'https://picsum.photos/seed/burger/200/300',
    'https://picsum.photos/seed/chocolate/200/300',
    'https://picsum.photos/seed/headphones/200/300',
    'https://picsum.photos/seed/fries/200/300',
  ];

  final List<String> col2Images = [
    'https://picsum.photos/seed/chocolate/200/300',
    'https://picsum.photos/seed/headphones/200/300',
    'https://picsum.photos/seed/burger/200/300',
    'https://picsum.photos/seed/fries/200/300',
  ];

  final List<String> col3Images = [
    'https://picsum.photos/seed/headphones/200/300',
    'https://picsum.photos/seed/fries/200/300',
    'https://picsum.photos/seed/burger/200/300',
    'https://picsum.photos/seed/chocolate/200/300',
  ];

  @override
  void initState() {
    super.initState();
    _scrollControllers = List.generate(3, (_) => ScrollController());
    _scrollDirections = [true, false, true];
    _velocities = [baseSpeed, -baseSpeed, baseSpeed];
    _targetVelocities = [baseSpeed, -baseSpeed, baseSpeed];

    _tickers = List.generate(
      3,
      (index) => Ticker((elapsed) {
        if (!_scrollControllers[index].hasClients) return;

        final double maxScroll =
            _scrollControllers[index].position.maxScrollExtent;
        if (maxScroll <= 0) return;

        double position = _scrollControllers[index].offset + _velocities[index];

        // Boucle infinie
        if (position > maxScroll) position -= maxScroll;
        if (position < 0) position += maxScroll;

        _scrollControllers[index].jumpTo(position);
      }),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var ticker in _tickers) {
        ticker.start();
      }

      _invertTimer = Timer.periodic(
        const Duration(seconds: invertIntervalSeconds),
        (_) {
          _lastInvertTime = DateTime.now();
          _invertDirectionsWithTransition();
        },
      );

      _speedCheckTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
        _updateVelocities();
      });
    });
  }

  // Courbe d'accélération ease-in-out pour une transition plus naturelle
  double _easeInOutCubic(double t) {
    return t < 0.5 ? 4 * t * t * t : 1 - math.pow(-2 * t + 2, 3) / 2;
  }

  // Courbe pour le ralentissement (ease-out)
  double _easeOutQuad(double t) {
    return 1 - (1 - t) * (1 - t);
  }

  void _updateVelocities() {
    final timeSinceLastInvert =
        DateTime.now().difference(_lastInvertTime).inMilliseconds / 1000.0;
    final remainingTime = invertIntervalSeconds - timeSinceLastInvert;

    // Phase de ralentissement avant inversion
    if (!_isInTransition && remainingTime <= slowdownDuration) {
      final slowdownProgress = remainingTime / slowdownDuration;
      final slowdownFactor = math.max(0.15, _easeOutQuad(slowdownProgress));

      for (int i = 0; i < 3; i++) {
        final baseVel = _scrollDirections[i] ? baseSpeed : -baseSpeed;
        _velocities[i] = baseVel * slowdownFactor;
      }
    }
  }

  void _invertDirectionsWithTransition() {
    if (_isInTransition) return;

    _isInTransition = true;
    final startTime = DateTime.now();

    // Stocke les vélocités de départ
    final List<double> startVelocities = List.from(_velocities);

    // Calcule les vélocités cibles (inversées)
    for (int i = 0; i < 3; i++) {
      _targetVelocities[i] = -startVelocities[i];
    }

    // Animation fluide avec courbe ease-in-out
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      final elapsed =
          DateTime.now().difference(startTime).inMilliseconds / 1000.0;
      final rawProgress = math.min(1.0, elapsed / invertTransitionDuration);

      // Applique la courbe d'accélération
      final progress = _easeInOutCubic(rawProgress);

      for (int i = 0; i < 3; i++) {
        // Interpolation douce entre vélocité de départ et cible
        _velocities[i] =
            startVelocities[i] +
            (_targetVelocities[i] - startVelocities[i]) * progress;
      }

      if (rawProgress >= 1.0) {
        timer.cancel();
        _isInTransition = false;

        // Met à jour les directions après transition complète
        setState(() {
          for (int i = 0; i < 3; i++) {
            _scrollDirections[i] = !_scrollDirections[i];
            _velocities[i] = _targetVelocities[i];
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _invertTimer?.cancel();
    _speedCheckTimer?.cancel();
    for (var ticker in _tickers) ticker.stop();
    for (var ticker in _tickers) ticker.dispose();
    for (var c in _scrollControllers) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 420,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (colIndex) {
          final List<String> images = colIndex == 0
              ? col1Images
              : colIndex == 1
              ? col2Images
              : col3Images;
          final Color bgColor = colIndex == 0
              ? const Color(0xFFFFF9C4)
              : colIndex == 1
              ? const Color(0xFFE3F2FD)
              : const Color(0xFFFFE4E1);

          return Expanded(
            child: ListView.builder(
              controller: _scrollControllers[colIndex],
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length * 2,
              itemBuilder: (context, index) {
                final realIndex = index % images.length;
                return Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Image.network(
                      images[realIndex],
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
