part of 'panchang_cubit.dart';

@immutable
abstract class PanchangState {}

class PanchangInitial extends PanchangState {}

class AstroLoading extends PanchangState {}

class PanchangLoaded extends PanchangState {
  final Panchang panchang;

  PanchangLoaded(this.panchang);
}

class PanchangError extends PanchangState {}
