import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testdapurrumahsejahtera/models/failure.dart';
import 'package:testdapurrumahsejahtera/models/posts.dart';
import 'package:testdapurrumahsejahtera/repository/api_repositor.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiRepository apiRepository;
  ProductCubit({required this.apiRepository}) : super(ProductInitial());

  Future<void> fetchProductApi() async {
    emit(ProductLoading());
    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(ProductLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(ProductError(failure: err));
    } catch (err) {
      print("Error : $err");
    }
  }
}
