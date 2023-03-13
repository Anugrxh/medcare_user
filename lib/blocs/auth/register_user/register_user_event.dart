part of 'register_user_bloc.dart';

class RegisterUserEvent {
  final String name, phone, dob, sex, password;
  RegisterUserEvent(
      {required this.name,
      required this.phone,
      required this.dob,
      required this.sex,
      required this.password});
}
