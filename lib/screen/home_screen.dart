import 'package:bloc_cubit/screen/colors_screen.dart';
import 'package:bloc_cubit/screen/counter_screen.dart';
import 'package:bloc_cubit/screen/user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                color: Colors.blueGrey,
                child: const Text(
                  "Colors",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Colorscreen();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 43, vertical: 10),
                color: Colors.blueGrey,
                child: const Text(
                  "Counter",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Counterscreen();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                color: Colors.blueGrey,
                child: const Text(
                  "User Data",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserScreen();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
