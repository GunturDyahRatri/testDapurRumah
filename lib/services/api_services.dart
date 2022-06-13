import 'package:dio/dio.dart';
import 'package:testdapurrumahsejahtera/constants/api_constants.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response? response = await dio.get('$baseUrl');
      return response;
    } catch (err) {
      print("Error : $err");
    }
  }
}
