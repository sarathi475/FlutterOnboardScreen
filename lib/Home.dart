import 'package:flutter/material.dart';
import 'package:flutter_onboard/onboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample onboard Screen"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sample onboard Screen without library",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text("Home Screen"),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OnBaordScreen()));
                },
                child: Text("Test Again"))
          ],
        )),
      ),
    );
  }
}
