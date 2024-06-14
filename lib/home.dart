import 'package:flutter/material.dart';
import 'package:flutter_animation/animation1.dart';
import 'package:flutter_animation/animation2.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> animationList = ["Animation Builder and transform" , "Chained Animations, Curves and Clippers"];

  navigatorFunc(context , int index){
    switch (index) {
      case 0:
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Animation1()));
        break;
      case 1:
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Animation2()));
        break;  
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Animation List",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: animationList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                       navigatorFunc(context, index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            animationList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
