import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/product.dart';
import '../repository.dart';
import 'base_usecase.dart';

class ProductUseCase extends BaseUseCase<String, ProductInformation> {
  Repository _repository;
  ProductUseCase(this._repository);

  @override
  Future<Either<Failure, ProductInformation>> execute(String id) {
    // TODO: implement execute
    //   return await _repository.getProductInformation(id);
    throw UnimplementedError();
  }
}
