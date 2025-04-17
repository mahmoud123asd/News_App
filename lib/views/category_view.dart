import 'package:flutter/material.dart';
import 'package:news_app/widgets/new_list_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewListBuilder(
            category: category,
          )
        ],
      ),
    );
  }
}
