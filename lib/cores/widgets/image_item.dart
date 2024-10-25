import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String itemText;
  final VoidCallback itemClicked;
  final String imageName;
  final bool? haveColor;

  const ImageItem({
    required this.itemText,
    required this.itemClicked,
    required this.imageName,
    super.key,
    this.haveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey,
        borderRadius: BorderRadius.circular(25),
        onTap: itemClicked,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: haveColor! ? const Color(0xffF2F2F2) : null,
                ),
                child: Image.asset('assets/icons/$imageName'),
              ),

              //--------------------------------------------------------------------

              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  itemText,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
