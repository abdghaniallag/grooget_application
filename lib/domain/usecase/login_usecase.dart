import '../../data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/request.dart';
import '../models/user.dart';
import '../repository.dart';
import '../usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInupt, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInupt input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInupt {
  String email;
  String password;
  LoginUseCaseInupt(this.email, this.password);
}
