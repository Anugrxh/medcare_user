part of 'register_user_bloc.dart';

@immutable
abstract class RegisterUserState {}

class RegisterUserInitialState extends RegisterUserState {}

class RegisterUserLoadingState extends RegisterUserState {}

class RegisterUserSuccessState extends RegisterUserState {}

class RegisterUserFailureState extends RegisterUserState {}
