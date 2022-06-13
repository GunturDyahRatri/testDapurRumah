import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdapurrumahsejahtera/models/posts.dart';
import 'package:testdapurrumahsejahtera/page/product/cubit/product_cubit.dart';
import 'package:testdapurrumahsejahtera/page/product/product_ux.dart';

class ProductPaeg extends StatefulWidget {
  const ProductPaeg({Key? key}) : super(key: key);

  @override
  State<ProductPaeg> createState() => _ProductPaegState();
}

class _ProductPaegState extends State<ProductPaeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
          if (state is ProductLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProductError) {
            return Text(state.failure.message);
          } else if (state is ProductLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const ProductPageUX()
                : ListView.builder(itemBuilder: (context, index) {
                    final Post singlePost = postList[index];
                    return ListTile(
                      title: Text(singlePost.title),
                    );
                  });
          }
          return const SizedBox.shrink();
        })),
      ),
    );
  }
}
