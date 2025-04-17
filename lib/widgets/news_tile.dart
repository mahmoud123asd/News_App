import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:sizer/sizer.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;
  const NewsTile({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.78.w, vertical: .8.h),
      width: double.infinity,
      height: 46.8.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: article.image ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fill,
              height: 31.25.h,
              width: double.infinity,
            ),
          ),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 4.17.w,
                fontWeight: FontWeight.bold),
          ),
          Text(
            article.subTitle ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 3.33.w),
          ),
        ],
      ),
    );
  }
}
