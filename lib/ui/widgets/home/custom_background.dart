import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class customBackground extends StatelessWidget {
  const customBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 74, 74, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          height: 220,
          width: double.infinity,
        ),
        Positioned(
          left: 90,
          top: 90,
          child: Transform(
            transform: Matrix4.rotationZ(-0.1),
            child: Image.asset(
              itemProfile01,
              height: 100,
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
            child: Image.asset(
              background_profile,
              height: 220,
            ),
          ),
        ),
        Positioned(
          right: -40,
          child: Image.asset(
            itemProfile02,
            height: 220,
          ),
        ),
        Positioned(
          left: 90,
          top: 90,
          child: Transform(
            transform: Matrix4.rotationZ(-0.1),
            child: Image.asset(
              itemProfile01,
              height: 100,
            ),
          ),
        ),
        Positioned(
          right: -60,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
            child: Image.asset(
              itemProfile03,
              height: 220,
            ),
          ),
        ),
      
      ],
    );
  }
}

