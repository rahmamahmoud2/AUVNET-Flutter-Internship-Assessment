import 'package:dartz/dartz.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/Features/home/domain/repository/services_repository.dart';
import 'package:nawel_application/core/errors/failure.dart';

class FetchServicesUseCase {
  final ServicesRepo repository;

  FetchServicesUseCase(this.repository);

  Future<Either<Failure, List<MainService>>> call() async {
    return await repository.getServices();
  }
}
