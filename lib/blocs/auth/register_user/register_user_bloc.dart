import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(RegisterUserInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterUserInitialState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        AuthResponse res = await supabaseClient.auth.signUp(
          email: event.name,
          password: event.password,
        );

        await supabaseClient.from('profiles').insert(
          {
            'name': event.name,
            'phone': event.phone,
            'dob': event.dob,
            'sex': event.sex,
            'user_id': res.user!.id,
          },
        );

        emit(RegisterUserSuccessState());
      } catch (e, s) {
        log("$e\n$s");
        emit(RegisterUserFailureState());
      }
    });
  }
}
