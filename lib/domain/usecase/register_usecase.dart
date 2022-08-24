import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import '../../domain/models/user.dart';
import '../../domain/repository.dart';
import '../../domain/usecase/base_usecase.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInupt, Authentication> {
  Repository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInupt input) async {
    return await _repository.register(RegisterRequest(
      input.countryMobileCode,
      input.userName,
      input.email,
      input.password,
      input.mobile_number,
      input.profilePicture,
    ));
  }
}

class RegisterUseCaseInupt {
  String mobile_number;
  String countryMobileCode;
  String userName;
  String email;
  String password;
  String profilePicture;
  RegisterUseCaseInupt(this.mobile_number, this.countryMobileCode,
      this.userName, this.email, this.password, this.profilePicture);
}
