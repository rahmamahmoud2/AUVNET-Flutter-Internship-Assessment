part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchServicesEvent extends ServicesEvent {}
