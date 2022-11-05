import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movieapptest/contants/globalvaribles.dart';
import 'package:movieapptest/features/details/screens/detailsScreen.dart';
import 'package:movieapptest/models/model.dart';

import '../services/services.dart';
import '../widget/skelton.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 Future<Welcome> ? futurePhotos;
 Icon _searchIcon = const Icon(Icons.search);
 Widget _appBarTitle =  const Text('Explore',
   style: TextStyle(
       color: Globalvariables.primaryColor,
       fontSize: 16,
       fontWeight: FontWeight.w600
   ),
 );
 void _searchPressed() {
   setState(() {
     if (_searchIcon.icon == Icons.search) {
       _searchIcon = const Icon(Icons.close);
       _appBarTitle = TextField(
         controller: _filter,

         decoration: const InputDecoration(
           hintStyle: TextStyle(
             color: Colors.black,
           ),
             hintText: 'Search...'),
       );
     } else {
       _searchIcon = const Icon(Icons.search);
       _appBarTitle = const Text('       Explore                               filter',
         style: TextStyle(
             color: Globalvariables.primaryColor,
             fontSize: 16,
             fontWeight: FontWeight.w600
         ),
       );
       _filter.clear();
     }
   });
 }

 _homeState() {
   _filter.addListener(() {
     if (_filter.text.isEmpty) {
       setState(() {
         _searchText = "";

       });
     } else {
       setState(() {
         _searchText = _filter.text;
       });
     }
   });
 }
 final TextEditingController _filter =  TextEditingController();
 final dio = Dio(); // for http requests
 String _searchText = "";
 List names =  []; // names we get from API
 List filteredNames = []; // names filtered by search text



  @override
  void initState() {


    super.initState();
    futurePhotos = fetchPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
        title: _appBarTitle,

        backgroundColor:  Globalvariables.backgroundColor,
        automaticallyImplyLeading: false,


      ),
      body: FutureBuilder<Welcome>(
          future: futurePhotos,
          builder: (context,snapshot){
         if(snapshot.hasData ){

          List<Item> items = <Item>[];
          for (int i = 0; i < snapshot.data!.items.length; i++){
            if (snapshot.data!.items[i].title
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
              items.add(Item(id: snapshot.data!.items[i].id,
              title: snapshot.data!.items[i].title,
              fullTitle: snapshot.data!.items[i].fullTitle,
              year: snapshot.data!.items[i].year,
              releaseState: snapshot.data!.items[i].releaseState,
              image: snapshot.data!.items[i].image,
              genres: snapshot.data!.items[i].genres,
              genreList: snapshot.data!.items[i].genreList,
              directorList: snapshot.data!.items[i].directorList,
              stars: snapshot.data!.items[i].stars,
              starList: [], ));
            }
          }
          return buildListView(items, context);
         }else if(snapshot.hasError){
           return const Text('error');
         }else{
           return buildShimmer();
         }
      }),
    );
  }

  ListView buildListView(List<Item> items, BuildContext context) {
    return ListView(
          children: items.map((e) => Column(children: [

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.push(context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 3),
                              pageBuilder: (_,__,___)=>  DetailScreen(
                                id: e.id,
                                title: e.title,
                                fullTitle: e.fullTitle,
                                year: e.year,
                                releaseState: e.releaseState,
                                image: e.image,
                                genres: e.genres,
                                genreList: e.genreList.toString(),
                                directorList: e.directorList.toString(),
                                stars: e.stars,)));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      color: Colors.white,
                      child: Image.network(
                 e.image,
                 fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      SizedBox(
                        width:140,
                        child: Text(e.title,
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.fade,),
                      ),
                      SizedBox(
                        width:140,
                        child: Text('by ${e.releaseState}',
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.fade,),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(e.year,
                            style: const TextStyle(
                              color: Colors.white60,
                            ),),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.message),
                          SizedBox(
                            width: 20,
                          ),
                          Text('0 Comments'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
            )
          ],)).toList(),
        );
  }

 ListView buildShimmer( ) {
   return ListView.builder(
     itemCount: 6,
     itemBuilder: (BuildContext context, int index) {
      return Column(children: [

         Padding(
           padding: const EdgeInsets.all(18.0),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Skelton(
                 height: 130,
                 width: 150,


               ),
               const SizedBox(
                 width: 20,
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,


                 children: const [
                   Skelton(
                     width:140,
                     height: 10,
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Skelton(
                     width:140,
                     height: 10,

                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Skelton(
                     height: 20,
                     width: 70,


                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Skelton(
                     height: 20,
                     width: 70,
                   ),
                 ],
               ),
             ],
           ),
         ),
         const Divider(
           thickness: 3,
         )
       ],);
     },
  


   );
 }
}
