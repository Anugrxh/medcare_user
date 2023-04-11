import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'patients_and_appointments_event.dart';
part 'patients_and_appointments_state.dart';

class PatientsAndAppointmentsBloc
    extends Bloc<PatientsAndAppointmentsEvent, PatientsAndAppointmentsState> {
  PatientsAndAppointmentsBloc() : super(PatientsAndAppointmentsInitialState()) {
    on<PatientsAndAppointmentsEvent>((event, emit) async {
      emit(PatientsAndAppointmentsLoadingState());

      try {
        List<dynamic> temp = await Supabase.instance.client.rpc(
          'users_patients_and_appointments',
          params: {
            'search_user_id': Supabase.instance.client.auth.currentUser!.id,
            'search_date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
          },
        );

        List<Map<String, dynamic>> appointments =
            temp.map((e) => e as Map<String, dynamic>).toList();

        Logger().w(appointments);

        emit(PatientsAndAppointmentsSuccessState(appointments: appointments));
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(PatientsAndAppointmentsFailureState(message: e.toString()));
      }
    });
  }
}
