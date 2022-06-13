part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Post> postList;

  const ProductLoaded({required this.postList});
  @override
  List<Object> get props => [postList];
}

class ProductError extends ProductState {
  final Failure failure;

  const ProductError({required this.failure});
  @override
  List<Object> get props => [failure];
}
