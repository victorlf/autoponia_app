import 'package:autoponia_app/src/modules/app/views/widgets/home_buton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeButton(
                color: Colors.blue,
                width: width * 0.8,
                height: height * 0.4,
                title: 'Irrigador',
                titleColor: Colors.white,
                navigationPath: '/sprinkler/',
              ),
              HomeButton(
                color: Colors.green,
                width: width * 0.8,
                height: height * 0.4,
                title: 'Plantas',
                titleColor: Colors.white,
                navigationPath: '/plants/',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
