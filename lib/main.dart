import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdapurrumahsejahtera/page/home.dart';
import 'package:testdapurrumahsejahtera/page/product/cubit/product_cubit.dart';
import 'package:testdapurrumahsejahtera/repository/api_repositor.dart';
import 'package:testdapurrumahsejahtera/services/api_services.dart';

void main() {
  runApp(MyApp(
    apiServices: ApiServices(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiServices}) : super(key: key);

  final ApiServices apiServices;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
              apiRepository: ApiRepository(
                apiService: apiServices,
              ),
            )..fetchProductApi(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(child: HomePage())));
  }
}
