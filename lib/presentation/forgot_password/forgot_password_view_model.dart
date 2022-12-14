import 'dart:async';

import '../../domain/usecase/forgot_password_usecase.dart';
import '../../presentation/base/base.dart';
import '../../presentation/state_renderer/state_renderer.dart';
import '../../presentation/state_renderer/state_renderer_implimenter.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  StreamController _isAllInputValidStreamController =
      StreamController<bool>.broadcast();
  ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);
  var email = "";
  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));
  bool isEmailValid(String email) {
    return email.isNotEmpty;
  }

  @override
  setEmail(String email) {
    this.email = email;
    _validate();
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _forgotPasswordUseCase.execute(email)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (supportMessage) {
      inputState.add(SuccessState(supportMessage));
    });
  }

  @override
  Sink get InputIsAllInputValid => _isAllInputValidStreamController.sink;

  _validate() {
    InputIsAllInputValid.add(null);
  }

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  _isAllInputValid() {
    return isEmailValid(email);
  }

  @override
  // TODO: implement inputIsAllInputValid
  Sink get inputIsAllInputValid => throw UnimplementedError();
}

abstract class ForgotPasswordViewModelInputs {
  setEmail(String email);
  forgotPassword();

  Sink get inputEmail;
  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsAllInputValid;
}
