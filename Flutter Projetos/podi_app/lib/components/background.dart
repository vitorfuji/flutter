import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provide the total height and width of our screen
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            top: -70,
            left: 0,
            bottom: 350,
            child: Image.asset(
              'assets/images/podi.png',
              width: size.width * 1.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Entrar",
            ),

          ),
        ],

      ),

    );
  }
}
