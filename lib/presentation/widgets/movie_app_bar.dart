import 'package:flutter/material.dart';
import 'package:flutter_project/common/constants/size_constants.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/common/screenutil/screenutil.dart';
import 'package:flutter_project/presentation/widgets/logo.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_12.h,
              )),
          Expanded(
            child: Logo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              )),
        ],
      ),
    );
  }
}