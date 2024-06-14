import 'package:flutter/material.dart';

//create a circleSide
enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        //first the pen should move to the point (100 , 0)
        path.moveTo(size.width, 0);
        //offset is the end of the path (100 , 100)
        offset = Offset(size.width, size.height);
        //the path will be not clockwise
        clockwise = false;
        break;
      case CircleSide.right:
        //in the right side the pen will start from (0 , 0)
        //so we don't need to move the path we just need the offset (0 , 100)
        offset = Offset(0, size.height);
        //the path will be clockwise
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}

//because customClipper is not a widget
class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  ///this func is simple if you went to recreate the path everytime a change happen
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation1State();
}

class _Animation1State extends State<Animation2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: const HalfCircleClipper(side: CircleSide.left),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
        ClipPath(
          clipper: const HalfCircleClipper(side: CircleSide.right),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        )
      ],
    ));
  }
}
