part of 'account_cubit.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {} // optional

class ProfileLoading extends ProfileState {} // just loading, no user yet

class ProfileLoaded extends ProfileState {
  final UserProfile user;
  ProfileLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);

  @override
  List<Object> get props => [message];
}
