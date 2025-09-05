import 'package:flutter/material.dart';

class terms_and_conditions extends StatelessWidget {
  const terms_and_conditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30,
              width: 20,
              child: Checkbox(value: true, onChanged: (value) {}),
            ),
          ],
        ),
        SizedBox(width: 2),
        Expanded(
          child: Text.rich(
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: '${'i agree to the '}',
                  style: TextStyle(fontSize: 9),
                ),

                TextSpan(
                  text: '${'Terms & Conditions '}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 4, 113, 48),
                  ),
                ),
                TextSpan(text: '${'and '}', style: TextStyle(fontSize: 9)),
                TextSpan(
                  text: '${'Privay Policy'}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 4, 113, 48),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
