import 'package:e_commerce/Home/HomeTab_ViewModel/Response/CategoryResponse.dart';
import 'package:e_commerce/data/CategoryOrBrandsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandSection extends StatelessWidget {
  //todo: List<Category & brand>
  List<CategoryOrBrand> list;

  CategoryOrBrandSection({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(
              categoryOrBrand: list[index],
            );
          }),
    );
  }
}
