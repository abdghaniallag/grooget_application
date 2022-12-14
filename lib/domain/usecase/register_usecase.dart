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
      input.email,
      input.password,
      input.firstName ,
      input.lastName,
    ));
  }
}

class RegisterUseCaseInupt { 
  String email;
  String password;
  String firstName;
  String lastName;
  RegisterUseCaseInupt(   this.email, this.password, this.  firstName, this.   lastName);
}
