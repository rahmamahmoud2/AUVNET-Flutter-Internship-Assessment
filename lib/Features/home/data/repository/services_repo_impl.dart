import 'package:dartz/dartz.dart';
import 'package:nawel_application/Features/home/data/datasources/services_remote_datasource.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/Features/home/domain/repository/services_repository.dart';
import 'package:nawel_application/core/errors/failure.dart';

class ServicesRepoImpl implements ServicesRepo {
  final ServicesRemoteDataSource remoteDataSource;

  ServicesRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MainService>>> getServices() async {
    try {
      final serviceModels = await remoteDataSource.fetchServices();
      return Right(serviceModels);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
