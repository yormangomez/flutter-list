import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CicleAvatar extends StatelessWidget {
  const CicleAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        radius: 20,
        child: SvgPicture.network(
            'https://avatars.dicebear.com/api/male/john.svg?mood[]=happy'),
      ),
    );
  }
}
