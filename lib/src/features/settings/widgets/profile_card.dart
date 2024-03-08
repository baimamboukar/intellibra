import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.children,
    this.width,
    super.key,
  });
  final List<Widget> children;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.scheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          /*  boxShadow: [
            BoxShadow(
              color: context.scheme.primary.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ], */
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width:width ?? MediaQuery.of(context).size.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
