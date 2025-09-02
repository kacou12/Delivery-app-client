import 'package:dartz/dartz.dart';
import 'package:my/core/errors/failures.dart';
import 'package:my/core/network/network_info.dart';
import 'package:my/core/utils/typedefs.dart';
import 'package:my/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:my/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my/features/auth/data/models/user_model.dart';
import 'package:my/features/auth/data/payload/requests/request_auth.dart';
import 'package:my/features/auth/data/repositories/auth/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final AuthLocalDataSource store;
  bool isInitialize = false;

  AuthRepositoryImpl(this.remoteDataSource, this.networkInfo, this.store);

  @override
  FutureResult<UserModel> login(RequestParamsLogin params) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.login(
        requests: RequestLogin(email: params.email, password: params.password),
      );

      return response.fold((failure) => Left(failure), (response) async {
        await store.saveData(response);
        return Right(response);
      });
    } else {
      return const Left(CacheFailure());
    }
  }

  @override
  FutureResult<UserModel> myProfile() async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.myProfile();

      return response.fold((failure) => Left(failure), (response) async {
        await store.saveData(response);
        return Right(response);
      });
    } else {
      return const Left(CacheFailure());
    }
  }

  @override
  FutureResult<UserModel?> get currentUser async {
    try {
      // await store.deleteData();
      final user = await store.loadData();

      if (user == null) {
        return const Right(null);
      }
      return Right(user);
    } catch (e) {
      return const Left(
        CacheFailure(
          message: "Connexion implicite à echouer, veuillez vous connectez.",
        ),
      );
    }
  }

  @override
  FutureResult<void> loggout() async {
    final response = await remoteDataSource.logout();
    return response.fold((failure) => Left(failure), (response) async {
      return Right(await store.deleteData());
    });
  }

  @override
  FutureResult<UserModel> register(RequestParamsRegister request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(
          requests: RequestRegister(
            firstName: request.firstName,
            lastName: request.lastName,
            email: request.email,
            password: request.password,
            phone: request.phone,
          ),
        );

        return response.fold((failure) => Left(failure), (response) async {
          await store.saveData(response);
          return Right(response);
        });

        // if (response is Success<UserModel>) {
        //   await store.saveData(response.data);
        //   return Right(response.data);
        // } else {
        //   final errorMessage =
        //       response.asOrNull<Failed<dynamic>>()?.errors.error ??
        //           'Erreur inconnue';
        //   return Left(ServerFailure(message: errorMessage));
        // }
      } catch (e) {
        return Left(CacheFailure(message: "$e"));
      }
    } else {
      return const Left(
        CacheFailure(message: "Veuillez verifier votre connection internet"),
      );
    }
  }

  FutureResult<UserModel> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    if (!isInitialize) {
      await googleSignIn.initialize(
        serverClientId:
            // "31201217117-tnejjrhsakmmjn4ohias2jj7b3q9eacf.apps.googleusercontent.com",
            "31201217117-fhhn0kqf88b1d53a43gr7eneug9cgp3l.apps.googleusercontent.com",
      );
      isInitialize = true;
    }

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate(
      scopeHint: ['email', 'profile'],
    );

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final googlAuthResult = await _authenticateWithGoogle(
      googleUser: googleUser,
      idToken: googleAuth.idToken!,
    );

    return googlAuthResult.fold((failure) => Left(failure), (response) async {
      await store.saveData(response);
      return Right(response);
    });
  }

  FutureResult<UserModel> signInWithApple() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    if (!isInitialize) {
      await googleSignIn.initialize(
        serverClientId:
            // "31201217117-tnejjrhsakmmjn4ohias2jj7b3q9eacf.apps.googleusercontent.com",
            "31201217117-fhhn0kqf88b1d53a43gr7eneug9cgp3l.apps.googleusercontent.com",
      );
      isInitialize = true;
    }

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final googlAuthResult = await _authenticateWithApple(appleUser: credential);

    return googlAuthResult.fold((failure) => Left(failure), (response) async {
      await store.saveData(response);
      return Right(response);
    });
  }

  FutureResult<UserModel> _authenticateWithGoogle({
    required GoogleSignInAccount googleUser,
    required String idToken,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.authenticateByGoogle(
          requests: RequestGoogleOrAppleAuth(
            email: googleUser.email,
            idToken: idToken,
          ),
        );

        return response.fold((failure) => Left(failure), (user) async {
          //  have no account
          if (user == null) {
            final newUserReponse = await register(
              RequestParamsRegister(
                firstName: googleUser.displayName!.split(" ")[0],
                lastName: googleUser.displayName!.split(" ")[1],
                email: googleUser.email,
                password: "",
                phone: "",
              ),
            );
            // final tets = newUserReponse.getOrElse(() => UserModel.emptyData());
            return Right(newUserReponse.getOrElse(() => UserModel.emptyData()));
          }

          return Right(user);
        });
      } catch (e) {
        return Left(CacheFailure(message: "$e"));
      }
    } else {
      return const Left(
        CacheFailure(message: "Veuillez verifier votre connection internet"),
      );
    }
  }

  FutureResult<UserModel> _authenticateWithApple({
    required AuthorizationCredentialAppleID appleUser,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.authenticateByGoogle(
          requests: RequestGoogleOrAppleAuth(
            email: appleUser.email!,
            idToken: appleUser.identityToken!,
          ),
        );

        return response.fold((failure) => Left(failure), (user) async {
          //  have no account
          if (user == null) {
            final newUserReponse = await register(
              RequestParamsRegister(
                firstName: appleUser.familyName!,
                lastName: appleUser.givenName!,
                email: appleUser.email!,
                password: "",
                phone: "",
              ),
            );
            // final tets = newUserReponse.getOrElse(() => UserModel.emptyData());
            return Right(newUserReponse.getOrElse(() => UserModel.emptyData()));
          }

          return Right(user);
        });
      } catch (e) {
        return Left(CacheFailure(message: "$e"));
      }
    } else {
      return const Left(
        CacheFailure(message: "Veuillez verifier votre connection internet"),
      );
    }
  }
}
