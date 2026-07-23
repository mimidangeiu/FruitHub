import 'package:ex2/module/user/cubit/userstate.dart' show UserState;
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState(name: ""));

  void updatedName(String name) {
    emit(state.copyWith(name: name));
  }
}
