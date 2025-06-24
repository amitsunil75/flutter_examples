import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc_from_api/bloc/user_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh,color: Colors.white,),
            onPressed: () => bloc.add(FetchUsers()),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search users',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                bloc.add(SearchUsers(value));
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                          !state.hasReachedMax) {
                        bloc.add(LoadMoreUsers());
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: state.users.length + (state.hasReachedMax ? 0 : 1),
                      itemBuilder: (context, index) {
                        if (index < state.users.length) {
                          final user = state.users[index];
                          return ListTile(
                            leading: CircleAvatar(child: Text(user.id.toString())),
                            title: Text(user.name,style:GoogleFonts.lato()),
                            subtitle: Text(user.email),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  );
                } else if (state is UserError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
