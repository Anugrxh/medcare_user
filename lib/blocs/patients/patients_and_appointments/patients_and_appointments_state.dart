part of 'patients_and_appointments_bloc.dart';

@immutable
abstract class PatientsAndAppointmentsState {}

class PatientsAndAppointmentsInitialState
    extends PatientsAndAppointmentsState {}

class PatientsAndAppointmentsLoadingState
    extends PatientsAndAppointmentsState {}

class PatientsAndAppointmentsSuccessState extends PatientsAndAppointmentsState {
  final List<Map<String, dynamic>> appointments;

  PatientsAndAppointmentsSuccessState({required this.appointments});
}

class PatientsAndAppointmentsFailureState extends PatientsAndAppointmentsState {
  final String message;

  PatientsAndAppointmentsFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
