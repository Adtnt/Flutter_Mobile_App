import 'package:flutter/material.dart';
import 'package:flutter_project/common/constants/size_constants.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/presentation/themes/theme_color.dart';
import 'package:flutter_project/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function() onTab;
  final bool isSelected;

  const TabTitleWidget(
      {Key? key,
      required this.title,
      required this.onTab,
      this.isSelected = false})
      : assert(title != null, 'title should not be null'),
        assert(onTab != null, 'onTab should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTab,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColor.royalBlue : Colors.transparent,
                width: Sizes.dimen_1.h,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 1.0),
            child: Text(
              title,
              style: isSelected
                  ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColor.royalBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white.withOpacity(0.35),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
