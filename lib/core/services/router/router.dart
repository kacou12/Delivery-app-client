import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woudy_customers_app/core/layout/screen_layout.dart';
import 'package:woudy_customers_app/core/services/hive/hive.dart';
import 'package:woudy_customers_app/core/services/injection_container.dart';
import 'package:woudy_customers_app/core/services/router/page_routes.enum.dart';
import 'package:woudy_customers_app/core/services/router/router_observer.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/forget_password_bloc/forgot_password_bloc.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/forget_password_bloc/forgot_password_state.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/forget_password/password_success_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/forget_password/reset_password_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/forget_password/forgot_password_code_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/forget_password/forgot_password_email_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/login_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:woudy_customers_app/features/auth/presentation/pages/register_screen.dart';
import 'package:woudy_customers_app/features/chat/chat_screen.dart';
import 'package:woudy_customers_app/features/general/pages/splash_screen.dart';
import 'package:woudy_customers_app/features/products/products_order/order_confirmation_screen.dart';
import 'package:woudy_customers_app/features/products/products_order/product_detail_screen.dart';
import 'package:woudy_customers_app/features/products/products_order/product_payment_screen.dart';
import 'package:woudy_customers_app/features/products/products_order/product_shipping_info_screen.dart';
import 'package:woudy_customers_app/features/products/products_screen.dart';
import 'package:woudy_customers_app/features/settings/settings_screen.dart';
import 'package:woudy_customers_app/features/users/users_profil_screen.dart';
import 'package:woudy_customers_app/features/users/users_screen.dart';

part 'router.main.dart';
part 'user_routes/user_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _forgotPasswordNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'sectionANav',
);

final _userNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: PageRoutes.userHome.name,
);
final _chatNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: PageRoutes.chat.name,
);
final _settingsNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: PageRoutes.settings.name,
);
final _productsNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: PageRoutes.products.name,
);
