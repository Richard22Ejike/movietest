
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapptest/common/bottombar.dart';
import 'package:movieapptest/features/Auth/Screens/SignIn.dart';
import 'package:movieapptest/models/model.dart';
import 'package:movieapptest/features/Home/services/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const appTitle = 'Isolate Demo';

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Checking if the snapshot has any data or not
            if (snapshot.hasData) {
              // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
              return const bottomBar();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const SignIn();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ScrollController();
  int _count = 50;


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    controller.addListener(() {
if (controller.position.maxScrollExtent == controller.offset){
  setState(() {});
}
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Welcome>(
                  future: fetchPhotos(),
                  builder:(context, snapshot){

                    if(snapshot.hasData){
                      final controller = ScrollController();
                      controller.addListener(() {
                        final position =
                            controller.offset / controller.position.maxScrollExtent;
                        if (position >= 0.8) {
                          setState(() {
                            _count += 50;
                          });
                        }
                      });
                      return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                      controller: controller,
                        itemCount:snapshot.data!.items.length + 1,
                        itemBuilder:(context, index){
                          if(index < snapshot.data!.items.length){
                          return Column(
                            children: [
                               Container(
                                        height: MediaQuery.of(context).size.height * 0.25,
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                            image:DecorationImage(
                                                image: NetworkImage(
                                                  snapshot.data!.items[index].image,
                                                )
                                            )
                                        ),


                              ),
                              Text(index.toString())
                            ],
                          );
                        }
                        else{
                          return  Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Center(child: CircularProgressIndicator(),),
                          );
                        }
                        });
  }else{
  return Center(child: Text('Loading...'));
  }

}
)

          )
        ],
      )
    );
  }
}

