import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  PrescriptionBloc() : super(PrescriptionInitialState()) {
    on<PrescriptionEvent>((event, emit) async {
      emit(PrescriptionLoadingState());
      try {} catch (e, s) {}
    });
  }
}
