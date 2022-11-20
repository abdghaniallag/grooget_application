import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';  

class ShimmerWidget extends StatelessWidget {
    ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.shapeBorder,
  });
  final double height;
  final double width;
  final ShapeBorder shapeBorder;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(period:const Duration(seconds: 3) ,
      baseColor:  Colors.grey[300]! ,
      highlightColor:  Colors.grey[100]!  ,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color:  Colors.grey[200]! ,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
