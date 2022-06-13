import 'package:flutter/cupertino.dart';
import 'package:testdapurrumahsejahtera/models/posts.dart';
import 'package:testdapurrumahsejahtera/page/product/cubit/product_cubit.dart';
import 'package:testdapurrumahsejahtera/services/api_services.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiServices apiService;
  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    // emit(ProductLoaded(postList: postList ?? {}));
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => Post.fromMap(singlePost)).toList();
    }
  }
}
