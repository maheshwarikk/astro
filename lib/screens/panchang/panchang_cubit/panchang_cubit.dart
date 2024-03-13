import 'package:bloc/bloc.dart';
import 'package:india_today/model/panchang_response.dart';
import 'package:india_today/repo/repository.dart';
import 'package:meta/meta.dart';

part 'panchang_state.dart';

class PanchangCubit extends Cubit<PanchangState> {
  Repository repository = Repository();
  PanchangCubit() : super(PanchangInitial());

  void getPanchang() {
    emit(AstroLoading());

    var request = {
      "day": 2,
      "month": 7,
      "year": 2021,
      "placeId": "ChIJL_P_CXMEDTkRw0ZdG-0GVvw",
    };
    repository.getAllPanchangs(request).then((response) {
      if (response.success == true) {
        emit(PanchangLoaded(response));
      } else {
        emit(PanchangError());
      }
    });
  }
}
