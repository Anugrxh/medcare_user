import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc() : super(TokenInitialState()) {
    on<TokenEvent>((event, emit) {
      emit(TokenLoadingState());
      try {




      } catch (e, s) 
      
      
      
      {}
    });
  }
}
