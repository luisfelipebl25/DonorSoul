import 'package:flutter/material.dart';

void main(){
  runApp(DonorSoul());
}

class DonorSoul extends StatelessWidget {
  const DonorSoul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor:
      ),
      home: Container(
        color: Colors.red,
        // width: 300,
      ),
    );
  }
}
