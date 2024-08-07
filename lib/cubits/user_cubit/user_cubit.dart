import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubits/user_cubit/user_state.dart';
import 'package:bloc_cubit/data/repo/user_repo.dart';

import '../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserRepository userRepository = UserRepository();

  getUserData() async {
    try {
      emit(UserLoadingState());
      final user = await userRepository.fetchUsers();
      emit(UserLoadedState(users: user));
    } catch (e) {
      emit(UserErrorState("Failed to fetch users"));
    }
  }

  deleteUser(int id) {
    if (state is UserLoadedState) {
      final currentState = state as UserLoadedState;
      final updatedUsers =
          currentState.users?.where((user) => user.id != id).toList();
      emit(UserLoadedState(users: updatedUsers));
    }
  }

  updateUserFavorite(int id, bool isFavorite) {
    if (state is UserLoadedState) {
      final currentState = state as UserLoadedState;
      final updatedUsers = currentState.users?.map((user) {
        if (user.id == id) {
          return user.copyWith(isFavorite: isFavorite);
        }
        return user;
      }).toList();
      emit(UserLoadedState(users: updatedUsers));
    }
  }

  updateUserReported(int id, bool isReported) {
    if (state is UserLoadedState) {
      final currentState = state as UserLoadedState;
      final updatedUsers = currentState.users?.map((user) {
        if (user.id == id) {
          return user.copyWith(isReported: isReported);
        }
        return user;
      }).toList();
      emit(UserLoadedState(users: updatedUsers));
    }
  }

  updateUserSelected(int id, bool isSelected) {
    if (state is UserLoadedState) {
      final currentState = state as UserLoadedState;
      final updatedUsers = currentState.users?.map((user) {
        if (user.id == id) {
          return user.copyWith(isSelected: isSelected);
        }
        return user;
      }).toList();
      emit(UserLoadedState(users: updatedUsers));
    }
  }
}
