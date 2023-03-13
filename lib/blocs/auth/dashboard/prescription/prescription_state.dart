part of 'prescription_bloc.dart';

@immutable
abstract class PrescriptionState {}

class PrescriptionInitialState extends PrescriptionState {}

class PrescriptionLoadingState extends PrescriptionState {}

class PrescriptionsuccessState extends PrescriptionState {}

class PrescriptionFailureState extends PrescriptionState {}
