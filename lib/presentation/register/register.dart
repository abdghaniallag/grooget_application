import 'dart:developer'; 
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; 
import '../../presentation/register/registerViewModel.dart';

import '../../app/app_preferences.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel _viewModel = instance<RegisterViewModel>(); 
  AppPreferences _appPreferences = instance<AppPreferences>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailontroller = TextEditingController();
  TextEditingController _lastNameController = TextEditingController(); 

  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _firstNameController
        .addListener(() => _viewModel.setfirstName(_firstNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _emailontroller
        .addListener(() => _viewModel.setEmail(_emailontroller.text));
    _lastNameController.addListener(
        () => _viewModel.setlastName(_lastNameController.text)); 
    _viewModel.isUserLoggedInSuccessfullyController.stream
        .listen((isSuccessFullyLoge) { 
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _appPreferences.setUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: ColorManager.white,
      ),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshut) {
            return Center(
              child: snapshut.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.register();
                  }) ??
                  _getContentWidget(),
            );
          }),
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: AppPadding.p8),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                      height: AppSize.s100,
                      child: Image.asset(ImageAssets.splashLogo)),
                  const SizedBox(height: AppSize.s20), 
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<String?>(
                      stream: _viewModel.outputErrorUserNameValid,
                      builder: (context, snapshut) {
                        return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              hintText: AppStrings.firstName,
                              label: const Text(AppStrings.firstName),
                              errorText: snapshut.data,
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.s18),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<String?>(
                      stream: _viewModel.outputErrorLastNameValid,
                      builder: (context, snapshut) {
                        return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              hintText: AppStrings.lastName,
                              label: const Text(AppStrings.lastName),
                              errorText: snapshut.data,
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.s20), 
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<String?>(
                      stream: _viewModel.outputErrorEmailValid,
                      builder: (context, snapshut) {
                        return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailontroller,
                            decoration: InputDecoration(
                              hintText: AppStrings.emailHint,
                              label: const Text(AppStrings.emailHint),
                              errorText: (snapshut.data),
                            ));
                      },
                    ), 
                  ),
                  const SizedBox(height: AppSize.s20),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<String?>(
                      stream: _viewModel.outputErrorPasswordValid,
                      builder: (context, snapshut) {
                        return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: AppStrings.password,
                              label: const Text(AppStrings.password),
                              errorText: (snapshut.data),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.s16),
                
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child:  SizedBox(
                              width: double.infinity,
                              height: AppSize.s40,
                              child: ElevatedButton(
                                onPressed:  (){
                                  log(_viewModel.registerObject.email,name: 'email: ');
                                  log(_viewModel.registerObject.password,name: 'password: ');
                                  log(_viewModel.registerObject.firstName,name: 'firstName: ');
                                  log(_viewModel.registerObject.lastName,name: 'lastName: ');
                                  _viewModel.register();
                                },
                                child: const Text(AppStrings.register),
                              )) 
                         ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.loginRoute);
                        },
                        child: Text(
                          AppStrings.haveAnAccount,
                          style: Theme.of(context).textTheme.subtitle2,
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  } 
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
