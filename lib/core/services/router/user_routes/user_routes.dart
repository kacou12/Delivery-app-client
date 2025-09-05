part of '../router.dart';

final userRoutes = [
  GoRoute(
    path: PageRoutes.userHome.path,
    name: PageRoutes.userHome.name,

    builder: (context, state) => const UsersScreen(),
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: PageRoutes.userProfil.path,
        name: PageRoutes.userProfil.name,
        builder: (context, state) => const UsersProfilScreen(),
      ),
      // PAYMENT PROCESS
      GoRoute(
        path: PageRoutes.productDetails.path,
        name: PageRoutes.productDetails.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ProductDetailScreen(),
        routes: [
          GoRoute(
            path: PageRoutes.productShippingInfo.path,
            name: PageRoutes.productShippingInfo.name,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const ProductShippingInfoScreen(),
          ),
          GoRoute(
            path: PageRoutes.productPayment.path,
            name: PageRoutes.productPayment.name,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const ProductPaymentScreen(),
          ),
          GoRoute(
            path: PageRoutes.productOrderConfirmation.path,
            name: PageRoutes.productOrderConfirmation.name,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const ProductOrderConfirmationScreen(),
          ),
        ],
      ),
    ],
  ),
];
