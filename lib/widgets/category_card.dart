import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel content;
  const CategoryCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CategoryView(category: content.categoryName)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.94.w, vertical: 3.125.h),
        width: 55.56.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: AssetImage(content.image), fit: BoxFit.fill)),
        child: Center(
            child: Text(
          content.categoryName,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
