import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:woudy_customers_app/core/api/dio_client.dart';
import 'package:woudy_customers_app/core/network/network_info.dart';
import 'package:woudy_customers_app/core/services/hive/hive.dart';
import 'package:woudy_customers_app/core/services/router/router.dart';
import 'package:woudy_customers_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:woudy_customers_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:woudy_customers_app/features/auth/data/repositories/auth/auth_repository_impl.dart';
import 'package:woudy_customers_app/features/auth/data/repositories/auth/forgot_password_repository_impl.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/forget_password_bloc/forgot_password_bloc.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:woudy_customers_app/features/auth/presentation/blocs/register_cubit/register_cubit.dart';

part 'injection_container.main.dart';
