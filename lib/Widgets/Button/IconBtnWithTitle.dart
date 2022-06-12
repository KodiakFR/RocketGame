import 'package:flutter/material.dart';

class IconBtnWithTitle extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final String linkImage;
  final Function() onChangedLink;
  const IconBtnWithTitle({
    Key? key,
    required this.height,
    required this.width,
    required this.name,
    required this.linkImage,
    required this.onChangedLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            onChangedLink();
          },
          child: Image(
            height: height,
            width: width,
            image: AssetImage(linkImage),
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              primary: Colors.red.withOpacity(0),
              elevation: 0),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          margin: const EdgeInsets.only(top: 75),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child:  Text(
            name,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
