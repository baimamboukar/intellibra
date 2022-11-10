import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intellibra/src/utils/box_shadow.dart';
import 'package:intellibra/src/utils/palette.dart';
import 'package:intellibra/src/utils/text_styles.dart';

class CategoryCard extends StatelessWidget {
  final bool selected;
  final String content;
  const CategoryCard(
      {super.key, required this.selected, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
          color: selected ? Palette.secondary : Palette.light,
          borderRadius: BorderRadius.circular(20.r),
          
          boxShadow: [
            boxShadow
          ]),
      padding: EdgeInsets.all(6.w),
      child: Text(
        content,
        style: selected
            ? TextStyles.selectedCategory
            : TextStyles.unSelectedCategory,
      ),
    );
  }
}
