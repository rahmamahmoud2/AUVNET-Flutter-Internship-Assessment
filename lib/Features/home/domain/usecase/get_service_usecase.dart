import 'package:dartz/dartz.dart';
import 'package:nawel_application/core/errors/failure.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/Features/home/domain/repository/services_repository.dart';

class GetServicesUseCase {
  final ServicesRepo repository;

  GetServicesUseCase(this.repository);

  Future<Either<Failure, List<MainService>>> call() async {
    return await repository.getServices();
  }
}
