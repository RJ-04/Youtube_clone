import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.grey,
          ),
        ),

        //--------------------------------------------------------------------

        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'RJ',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),

        //--------------------------------------------------------------------

        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.blueGrey),
              children: [
                TextSpan(text: 'RJ'),
                TextSpan(text: 'No Sub'),
                TextSpan(text: 'Videps'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
