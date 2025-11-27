
import 'package:flutter_bloc/flutter_bloc.dart';


class PasswordState {
  final bool isCurrentVisible;
  final bool isNewVisible;
  final bool isConfirmVisible;

  PasswordState({
    this.isCurrentVisible = false,
    this.isNewVisible = false,
    this.isConfirmVisible = false,
  });

  PasswordState copyWith({
    bool? isCurrentVisible,
    bool? isNewVisible,
    bool? isConfirmVisible,
  }) {
    return PasswordState(
      isCurrentVisible: isCurrentVisible ?? this.isCurrentVisible,
      isNewVisible: isNewVisible ?? this.isNewVisible,
      isConfirmVisible: isConfirmVisible ?? this.isConfirmVisible,
    );
  }
}

class ChangePasswordCubit extends Cubit<PasswordState> {
  ChangePasswordCubit() : super(PasswordState());

  void toggleCurrentVisibility() => emit(state.copyWith(isCurrentVisible: !state.isCurrentVisible));
  void toggleNewVisibility() => emit(state.copyWith(isNewVisible: !state.isNewVisible));
  void toggleConfirmVisibility() => emit(state.copyWith(isConfirmVisible: !state.isConfirmVisible));
}
