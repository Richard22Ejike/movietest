import 'package:flutter/material.dart';

import '../contants/globalvaribles.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Globalvariables.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),

        minimumSize: const Size(double.infinity, 40),
        backgroundColor: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Align(
            widthFactor: 2.3,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
            ),
          ),



           Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,),

        ],
      ),
    );
  }
}