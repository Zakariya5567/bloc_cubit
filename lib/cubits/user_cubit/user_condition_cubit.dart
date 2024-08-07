import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubits/user_cubit/user_state.dart';
import 'package:bloc_cubit/data/repo/user_repo.dart';

import '../../data/models/user_model.dart';

class UserConditionCubit extends Cubit<UserCondition> {
  UserConditionCubit() : super(UserCondition.newCondition);

  getUserCondition(UserCondition condition) async {
    emit(condition);
  }
}

enum UserCondition { newCondition, oldCondition }
