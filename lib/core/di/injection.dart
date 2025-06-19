import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel_application/Features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nawel_application/Features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:nawel_application/Features/auth/data/repository/auth_repository_impl.dart';
import 'package:nawel_application/Features/auth/domain/repository/auth_repository.dart';
import 'package:nawel_application/Features/auth/domain/usecase/login_usecase.dart';
import 'package:nawel_application/Features/auth/domain/usecase/signup_usecase.dart';
import 'package:nawel_application/Features/home/data/datasources/services_remote_datasource.dart';
import 'package:nawel_application/Features/home/data/datasources/services_remote_datasource_impl.dart';
import 'package:nawel_application/Features/home/data/repository/banner_repo_impl.dart';
import 'package:nawel_application/Features/home/data/repository/services_repo_impl.dart';
import 'package:nawel_application/Features/home/domain/repository/banner_repo.dart';
import 'package:nawel_application/Features/home/domain/repository/services_repository.dart';
import 'package:nawel_application/Features/home/domain/usecase/banner_usecase.dart';
import 'package:nawel_application/Features/home/domain/usecase/get_service_usecase.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Auth Feature
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Home Feature
  sl.registerLazySingleton<ServicesRemoteDataSource>(
    () => ServicesRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<ServicesRepo>(() => ServicesRepoImpl(sl()));
  sl.registerLazySingleton(() => GetServicesUseCase(sl()));

  sl.registerLazySingleton<BannersRemoteDataSource>(
    () => BannersRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<BannerRepository>(() => BannerRepoImpl(sl()));
  sl.registerLazySingleton(() => GetBannersUseCase(sl()));
}
