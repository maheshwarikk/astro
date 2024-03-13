import 'package:bloc/bloc.dart';
import 'package:india_today/model/astro_response.dart';
import 'package:india_today/repo/repository.dart';
import 'package:meta/meta.dart';

part 'astro_state.dart';

class AstroCubit extends Cubit<AstroState> {
  Repository repository = Repository();
  AstroCubit() : super(AstroInitial());

  void getAstro() {
    emit(AstroLoading());
    repository.getAllAgents().then((response) {
      if (response.success == true) {
        emit(AstroLoaded(response));
      } else {
        emit(AstroError());
      }
    });
  }
}
