import 'package:flutter/material.dart';


showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
final List<String> sliderImages = [
  "https://media.npr.org/assets/img/2022/07/25/moviestill2_custom-717caa5dc12a74098925c048754fa2e19aff431e.jpg",
  "https://tafttoday.com/wp-content/uploads/2019/05/MV5BZTliNWJhM2YtNDc1MC00YTk1LWE2MGYtZmE4M2Y5ODdlNzQzXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_-1-568x900.jpg",
  "https://flxt.tmsimg.com/assets/p25765_p_v12_aj.jpg",
  'https://lumiere-a.akamaihd.net/v1/images/p_blackwidow_21043_v2_6d1b73b8.jpeg'

];
class Globalvariables{
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 216, 216, 216);
  static var selectedNavBarColor = Color.fromARGB(255, 100, 100, 100);
  static const unselectedNavBarColor = Colors.black87;
  static const primaryColor = Color.fromARGB(255, 100, 100, 100);
  static const secondaryColor = Color.fromARGB(255, 205, 201, 200);
  static const backgroundColor = Color.fromARGB(255, 232, 232, 232);

}
