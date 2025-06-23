import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_models.dart';
import '../models/user_repository.dart';

// State base class
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  UserLoaded({required this.users, required this.hasReachedMax});
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}

// Event base class


abstract class UserEvent {}

class FetchUsers extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;

  SearchUsers(this.query);
}

class LoadMoreUsers extends UserEvent {}




class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUsers);
    on<LoadMoreUsers>(_onLoadMoreUsers);
  }

  int _currentPage = 1;
  bool _isFetching = false;
  String _query = '';

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      _currentPage = 1;
      final users = await repository.fetchUsers(page: _currentPage);
      emit(UserLoaded(users: users, hasReachedMax: users.length < 10));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  void _onSearchUsers(SearchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      _query = event.query;
      _currentPage = 1;
      final users = await repository.fetchUsers(page: _currentPage, query: _query);
      emit(UserLoaded(users: users, hasReachedMax: users.length < 10));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  void _onLoadMoreUsers(LoadMoreUsers event, Emitter<UserState> emit) async {
    if (_isFetching || state is! UserLoaded) return;

    final currentState = state as UserLoaded;
    _isFetching = true;

    try {
      _currentPage++;
      final users = await repository.fetchUsers(page: _currentPage, query: _query);
      final allUsers = List<User>.from(currentState.users)..addAll(users);
      emit(UserLoaded(users: allUsers, hasReachedMax: users.length < 10));
    } catch (e) {
      emit(UserError(message: e.toString()));
    } finally {
      _isFetching = false;
    }
  }
}
