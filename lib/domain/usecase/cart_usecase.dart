import '../../data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/request.dart';
import '../models/cart.dart';
import '../repository.dart';
import '../usecase/base_usecase.dart';

class CartUseCase implements BaseUseCase<CartUseCaseInupt, UserCart> {
  Repository _repository;
  CartUseCase(this._repository);
  @override
  Future<Either<Failure, UserCart>> execute(CartUseCaseInupt input) async {
    return await _repository.updatCart(UpdateCartRequest(
      update: input.update,
      id_product: input.id_product,
      id_product_attribute: input.id_product_attribute,
      op: input.op,
      action: input.action,
      qty: input.qty,
      delete: input.delete,
    ));
  }
}

class CartUseCaseInupt {
  String? update;
  int? id_product;
  int? id_product_attribute;
  String? op;
  String? action;
  int? qty;
  int? delete;

  CartUseCaseInupt({
    this.update,
    this.id_product,
    this.id_product_attribute,
    this.op,
    this.action,
    this.qty,
    this.delete,
  });
}
