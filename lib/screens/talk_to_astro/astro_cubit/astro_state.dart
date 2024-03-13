part of 'astro_cubit.dart';

@immutable
abstract class AstroState {}

class AstroInitial extends AstroState {}

class AstroLoading extends AstroState {}

class AstroLoaded extends AstroState {
  final Astro astros;

  AstroLoaded(this.astros);
}

class AstroError extends AstroState {}
