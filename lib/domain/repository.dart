import 'package:dartz/dartz.dart';

import '../data/network/failure.dart';
import '../data/request/request.dart';
import 'models/product.dart';
import 'models/user.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AcountInformation>> getAcountInformation();
  Future<Either<Failure, ProductInformation>> getProductInformation(String id);
  Future<Either<Failure, ProductSearchList>> getProductSearchList(String s,
      {String resultsPerPage = "10"});
  Future<Either<Failure, CategoryList>> getCategoryList(String productId,
      {int page = 0, int resultsPerPage = 1, bool with_category_tree = false});
}
