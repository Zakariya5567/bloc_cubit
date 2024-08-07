import 'package:bloc_cubit/cubits/user_cubit/user_condition_cubit.dart';
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
      body: BlocBuilder<UserConditionCubit, UserCondition>(
          builder: (context, condition) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueGrey.shade300),
                height: 50,
                width: 300,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<UserConditionCubit>()
                            .getUserCondition(UserCondition.newCondition);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: condition == UserCondition.newCondition
                                ? Colors.blueGrey
                                : Colors.blueGrey.shade300),
                        child: const Center(
                          child: Text(
                            "New",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<UserConditionCubit>()
                            .getUserCondition(UserCondition.oldCondition);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: condition == UserCondition.oldCondition
                                ? Colors.blueGrey
                                : Colors.blueGrey.shade300),
                        child: const Center(
                          child: Text(
                            "Old",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserInitialState) {
                    return const Center(
                        child: Text('Press the button to fetch users'));
                  } else if (state is UserLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoadedState) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: condition == UserCondition.newCondition
                          ? ListView.builder(
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
                                            .updateUserSelected(
                                                user.id, !user.isSelected);
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
                                              color: user.isFavorite
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<UserCubit>()
                                                  .updateUserFavorite(user.id,
                                                      !user.isFavorite);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              user.isReported
                                                  ? Icons.report
                                                  : Icons.report_off,
                                              color: user.isReported
                                                  ? Colors.orange
                                                  : Colors.grey,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<UserCubit>()
                                                  .updateUserReported(user.id,
                                                      !user.isReported);
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<UserCubit>()
                                                  .deleteUser(user.id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 180,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemCount: state.users?.length,
                              itemBuilder: (context, index) {
                                User user = state.users![index];
                                return Card(
                                    color: user.isSelected
                                        ? Colors.blueGrey.shade100
                                        : Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<UserCubit>()
                                            .updateUserSelected(
                                                user.id, !user.isSelected);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user.name,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Text(user.email),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    user.isFavorite
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: user.isFavorite
                                                        ? Colors.red
                                                        : Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<UserCubit>()
                                                        .updateUserFavorite(
                                                            user.id,
                                                            !user.isFavorite);
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    user.isReported
                                                        ? Icons.report
                                                        : Icons.report_off,
                                                    color: user.isReported
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<UserCubit>()
                                                        .updateUserReported(
                                                            user.id,
                                                            !user.isReported);
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<UserCubit>()
                                                        .deleteUser(user.id);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                    );
                  } else if (state is UserErrorState) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
