import 'package:flutter/material.dart';
import 'package:store_app_postman/UiPart/screens/HomeScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String welcomeScreenRoute = 'WelcomeScreenId';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1),(){
      Navigator.pushReplacementNamed(context, HomeScreen.homeScreenRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 200,
              child: Image.asset('assets/img.png',width: 300,),
            ),
            const SizedBox(height: 50,),
            const Text('Store App',style: TextStyle(fontSize: 50,color: Colors.red),),
          ],
        )
      ),
    );
  }
}
