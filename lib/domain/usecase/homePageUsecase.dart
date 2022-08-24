import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/user.dart';
import '../repository.dart';
import 'base_usecase.dart';

class HomeUseCase extends BaseUseCase<void, AcountInformation> {
  Repository _repository;
  HomeUseCase(this._repository);
  @override
  Future<Either<Failure, AcountInformation>> execute(void inputF) async {
    return await _repository.getAcountInformation();
  }
}
