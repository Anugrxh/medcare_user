part of 'patient_appointments_bloc.dart';

class PatientAppointmentsEvent {
  final int patientId;
  final bool forCurrentDay;

  PatientAppointmentsEvent({
    required this.patientId,
    this.forCurrentDay = false,
  });
}
