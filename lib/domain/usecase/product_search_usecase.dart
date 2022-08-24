import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/product.dart';
import '../repository.dart';
import 'base_usecase.dart';

class ProductSearchUseCase extends BaseUseCase<String, ProductSearchList> {
  Repository _repository;
  ProductSearchUseCase(this._repository);
  @override
  Future<Either<Failure, ProductSearchList>> execute(String s,
      {String resultsPerPage = "10"}) async {
    return await _repository.getProductSearchList(s, resultsPerPage: "10");
  }
}
