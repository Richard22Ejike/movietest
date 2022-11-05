import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapptest/contants/globalvaribles.dart';

class DetailScreen extends StatefulWidget {
  final String id,
  title,
  fullTitle,
  year,
  releaseState,
  image,
  genres,
  genreList,
  directorList,
  stars;
  const DetailScreen({Key? key, required this.id, required this.title, required this.fullTitle, required this.year, required this.releaseState, required this.image, required this.genres, required this.genreList, required this.directorList, required this.stars, }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < sliderImages.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<String> sliderImages = [
      widget.image,
      widget.image,
      widget.image,
      widget.image,
    ];
    return Scaffold(
       resizeToAvoidBottomInset: false,

      body: ListView(children: [
        SizedBox(
          height: 300.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: sliderImages.length,
            itemBuilder: (context, index) {
              return Image.network(
                sliderImages[index],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            sliderImages.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 8.0,
              width: currentIndex == index ? 8.0 : 8.0,
              margin: const EdgeInsets.only(right: 4.0),
              decoration: BoxDecoration(
                color: currentIndex == index
                    ?  Globalvariables.primaryColor
                    : Globalvariables.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),
        Container(
           width: 50,
            padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20,right: 100),
            child: Text(  softWrap: true,  style: const TextStyle(
              fontSize: 18, color: Globalvariables.primaryColor,
              fontWeight: FontWeight.bold,
            ),
           '${widget.fullTitle},\n'
               '${widget.genres} ', )),
        Container(
            padding: const EdgeInsets.only(left: 20),
            child:
            Text(
                'by ${widget.releaseState} ' ,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),)),
        Padding(
          padding: const EdgeInsets.only(left: 40.0,top: 20),
          child: Row(
            children: [
         ElevatedButton(
           style: ElevatedButton.styleFrom(
             side: const BorderSide(width: 2,color: Colors.black26 ),
             backgroundColor: Colors.white,
           ),
             onPressed: (){},
             child: Row(
               children: [
                 Icon(Icons.thumb_up,color: Colors.grey[600]),
                 const SizedBox(
                   width: 8,
                 ),
                 Text('Like',style: TextStyle(
                   color: Colors.grey[600]
                 ),),
               ],
             ),),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2,color: Colors.black26 ),
                  backgroundColor: Colors.white,
                ),
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.messenger,color: Colors.grey[600]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('Comment',style: TextStyle(
                        color: Colors.grey[600]
                    ),),
                  ],
                ),),

            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20),
          child: Text('The movie  ${widget.title} was released in the year ${widget.year} '
              'It spans across genres such as ${widget.genres}. The movie starred the following actors  ${widget.stars}  '
              'Its perimer date was  ${widget.releaseState} ',
         style: TextStyle(
         fontSize: 18, color: Colors.grey[700],
         ),
         ) )
      ]),
    );
  }
}
