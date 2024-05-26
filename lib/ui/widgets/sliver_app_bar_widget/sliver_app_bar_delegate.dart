import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget child;
  final Color? backgroundColor;

  SliverAppBarDelegate({
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: backgroundColor,
      height: child.preferredSize.height,
      width: child.preferredSize.width,
      child: child,
    );
  }

  @override
  double get minExtent => child.preferredSize.height;
  @override
  double get maxExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
