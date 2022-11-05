import 'package:flutter/material.dart';
import 'package:movieapptest/common/TextFormField.dart';
import 'package:movieapptest/contants/globalvaribles.dart';

import '../../../common/Button.dart';
import '../../../common/bottombar.dart';
import '../services/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {

   Animation ? animation, delayedAnimation,muchDelayAnimation;
 AnimationController ? animationController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {

    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 3),vsync: this);

    animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.5, 1,curve: Curves.fastOutSlowIn)));

    muchDelayAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.8, 1,curve: Curves.fastOutSlowIn)));
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
     );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const bottomBar(),
        ),
      );
    } else {
      setState(() {
      });
      // show the error
      showSnackBar(context, res);

    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    animationController!.forward();
    return AnimatedBuilder(animation: animationController!, builder: (context, child){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Globalvariables.backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: height * 0.1,horizontal: width * 0.13),
          child:   Center(
            child: Column(

              children: [

                Transform(
                  transform: Matrix4.translationValues(animation!.value * width, 0, 0),
                  child: Padding(

                    padding: EdgeInsets.symmetric(vertical: height * 0.05,),

                    child: Container(

                      height: 200,

                      width: 200,

                      decoration: BoxDecoration(

                        color: Globalvariables.greyBackgroundCOlor,

                        borderRadius: BorderRadius.circular(200),

                      ),
                      child:const Center(
                        child: Text('LOGO APP',
                          style: TextStyle(
                            color: Globalvariables.primaryColor,
                            fontSize: 30,
                          ),
                        ),
                      ) ,
                    ),

                  ),
                ),

                Transform(
                  transform: Matrix4.translationValues(delayedAnimation!.value * width, 0, 0),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _emailController,
                          hintText: 'USERNAME'),
                      const SizedBox(
                        height: 25,
                      ),

                      CustomTextField(
                          controller: _passwordController,
                          hintText: 'PASSWORD'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'FORGOT PASSWORD',
                          style: TextStyle(
                              color: Globalvariables.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(muchDelayAnimation!.value * width, 0, 0),
                  child: CustomButton(
                    text: 'SIGN IN',
                    color: Globalvariables.secondaryColor,
                    onTap: signUpUser,


                  ),
                ),
              ],

            ),
          ),
        ),
      );
    }
);
  }
}
