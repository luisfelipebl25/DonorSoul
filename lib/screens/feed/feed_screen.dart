import 'package:donor_soul/screens/feed/components/tag_widget.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset('assets/images/logo1.png'),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            shadowColor: Theme.of(context).primaryColor,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Image.network(
                    'https://vidasrecicladas.org/wp-content/uploads/2020/01/logo-teste.jpg.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ONG Vidas Recicladas',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            shadowColor: Theme.of(context).primaryColor,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Image.network(
                    'https://vidasrecicladas.org/wp-content/uploads/2020/01/logo-teste.jpg.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ONG Vidas Recicladas',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            shadowColor: Theme.of(context).primaryColor,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Image.network(
                    'https://vidasrecicladas.org/wp-content/uploads/2020/01/logo-teste.jpg.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ONG Vidas Recicladas',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                      TagWidget(),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
