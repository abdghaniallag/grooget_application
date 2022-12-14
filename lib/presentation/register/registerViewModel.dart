import 'dart:async'; 
import '../../app/functions.dart';
import '../../presentation/base/base.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../domain/usecase/register_usecase.dart';
import '../common/freezed_data.dart';
import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  StreamController _firstNameStreamController =
      StreamController<String>.broadcast();
  StreamController _emailStreamController =
      StreamController<String>.broadcast();
  StreamController _lastNameController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidController =
      StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyController =
      StreamController<bool>();

  var registerObject = RegisterObject("", "", "", "");
  RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);
  @override
  void dispose() {
    _firstNameStreamController.close();
    _passwordStreamController.close();
    _emailStreamController.close();
    _lastNameController.close();
    _isAllInputsValidController.close();
  }

  @override
  Sink get inputAllInputs => _isAllInputsValidController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputfirstName => _firstNameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputlastName => _lastNameController.sink;

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputIsfirstNameValid => _firstNameStreamController.stream
      .map((firstName) => _isfirstNameValid(firstName));
  @override
  Stream<bool> get outputIslastNameValid =>
      _lastNameController.stream.map((lastName) => _isfirstNameValid(lastName));
 
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
    } else {
      registerObject = registerObject.copyWith(email: "");
    }
    _validate();
  }

  @override
  setlastName(String userName) {
    inputlastName.add(userName);
    if (_isfirstNameValid(userName)) {
      registerObject = registerObject.copyWith(lastName: userName);
    } else {
      registerObject = registerObject.copyWith(lastName: "");
    }
    _validate();
  }

  @override
  setfirstName(String userName) {
    inputfirstName.add(userName);
    if (_isfirstNameValid(userName)) {
      registerObject = registerObject.copyWith(firstName: userName);
    } else {
      registerObject = registerObject.copyWith(firstName: "");
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
    } else {
      registerObject = registerObject.copyWith(password: "");
    }
    _validate();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _registerUseCase.execute(RegisterUseCaseInupt(
      registerObject.email,
      registerObject.password,
      registerObject.firstName,
      registerObject.lastName,
    )))
        .fold(
            (failure) => {
                  //left failure
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                }, (data) {
      {
        //right success
        inputState.add(ContentState());
        isUserLoggedInSuccessfullyController.add(true);
      }
    });
  }

  bool _isfirstNameValid(String userName) {
    return userName.length >= 2;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 2;
  }

  bool _isAllInputsValid() {
    return registerObject.password.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.firstName.isNotEmpty &&
        registerObject.lastName.isNotEmpty;
  }

  _validate() {
    inputAllInputs.add(null);
  }

  @override
  Stream<String?> get outputErrorUserNameValid => outputIsfirstNameValid.map(
      (isUserNameValid) => isUserNameValid ? null : AppStrings.invalidUserName);

  @override
  Stream<String?> get outputErrorLastNameValid => outputIslastNameValid.map(
      (isLastNameValid) => isLastNameValid ? null : AppStrings.invalidUserName);

  @override
  Stream<String?> get outputErrorEmailValid => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.invalidEmail);

  @override
  Stream<String?> get outputErrorPasswordValid => outputIsPasswordValid.map(
      (isPasswordValid) => isPasswordValid ? null : AppStrings.invalidpassword);
}

abstract class RegisterViewModelInputs {
  setEmail(String email);
  setPassword(String password);
  setlastName(String userName);
  setfirstName(String userName);
  register();

  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputfirstName;
  Sink get inputlastName;
  Sink get inputAllInputs;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsfirstNameValid;
  Stream<bool> get outputIslastNameValid;
  Stream<String?> get outputErrorUserNameValid;
  Stream<String?> get outputErrorLastNameValid;
  Stream<bool> get outputIsEmailValid;
  Stream<String?> get outputErrorEmailValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<String?> get outputErrorPasswordValid; 
  Stream<bool> get outputIsAllInputsValid;
}
