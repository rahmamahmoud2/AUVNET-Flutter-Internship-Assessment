import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/core/errors/failure.dart';

abstract class ServicesRepo {
  Future<Either<Failure, List<MainService>>> getServices();
}
