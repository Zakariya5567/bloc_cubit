import 'package:bloc_cubit/cubits/user_cubit/user_cubit.dart';
import 'package:bloc_cubit/cubits/user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Users",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.teal,
        child: const Text(
          'Fetch\nUsers',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          context.read<UserCubit>().getUserData();
        },
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            return const Center(child: Text('Press the button to fetch users'));
          } else if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users?.length,
              itemBuilder: (context, index) {
                User user = state.users![index];
                return Card(
                    color: user.isSelected
                        ? Colors.blueGrey.shade100
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        context
                            .read<UserCubit>()
                            .updateUserSelected(user.id, !user.isSelected);
                      },
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              user.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: user.isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              context.read<UserCubit>().updateUserFavorite(
                                  user.id, !user.isFavorite);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              user.isReported ? Icons.report : Icons.report_off,
                              color:
                                  user.isReported ? Colors.orange : Colors.grey,
                            ),
                            onPressed: () {
                              context.read<UserCubit>().updateUserReported(
                                  user.id, !user.isReported);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              context.read<UserCubit>().deleteUser(user.id);
                            },
                          ),
                        ],
                      ),
                    ));
              },
            );
          } else if (state is UserErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
