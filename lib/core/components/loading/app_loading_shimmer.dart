import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingShimmer extends StatelessWidget {
  const AppLoadingShimmer({
    Key? key,
    this.padding = const EdgeInsets.all(10.0),
    this.itemCount = 20,
  }) : super(key: key);

  final EdgeInsets padding;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: itemCount,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}