import 'package:flutter/material.dart';
import 'package:viaja_plus/screens/home/appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset("assets/background.jpeg").image,
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional.bottomCenter),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  )
                ],
              ));
        },
      ),
    );
  }
}
