import 'package:flutter/material.dart';




class SocialItem extends StatelessWidget {

final String image;
final Function onTap;

SocialItem(this.image, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        minRadius: 20.0,
        maxRadius: 20.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}