part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<MainService> services;

  ServicesLoaded({required this.services});

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  final String message;

  ServicesError({required this.message});

  @override
  List<Object> get props => [message];
}
