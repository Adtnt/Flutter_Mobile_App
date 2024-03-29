import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/common/constants/size_constants.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/common/extensions/string_extensions.dart';

import 'package:flutter_project/data/core/api_constants.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget(
      {super.key,
      required this.movieId,
      required this.title,
      required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            ),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, Sizes.dimen_10.h , 0, Sizes.dimen_10.h ),
            child: Text(
              title.intelliTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            ),
          )
        ],
      ),
    );
  }
}
