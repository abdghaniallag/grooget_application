// ignore_for_file: prefer_final_fields

import 'dart:async';
import '../../presentation/base/base.dart';
import '../../domain/usecase/login_usecase.dart';
import '../common/freezed_data.dart';
import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  StreamController _isAllInputsValidController =
      StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyController =
      StreamController<void>();

  var loginObject = LoginObject("", "");
  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);
  //inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidController.close();
    isUserLoggedInSuccessfullyController.close();
  }

  @override
  void start() {
    inputState.add(
        ContentState()); // view tells the state renderere, show the content of the screen
    // inputState.add(ErrorState(stateRendererType, message)); view tells the state renderere, show error state
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validat();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validat();
  }

  _validat() {
    inputAllInputs.add(null);
  }

  @override
  Sink get inputAllInputs => _isAllInputsValidController.sink;

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _loginUseCase.execute(
            LoginUseCaseInupt(loginObject.userName, loginObject.password)))
        .fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      {
        inputState.add(ContentState());

        isUserLoggedInSuccessfullyController.add(true);
      }
    });
  }

//outpputs
  @override
  Stream<bool> get outputIsUserUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserUserNameValid(userName));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return (_isPasswordValid(loginObject.password) &&
        _isUserUserNameValid(loginObject.userName));
  }

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidController.stream.map((_) => _isAllInputsValid());
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAllInputs;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
