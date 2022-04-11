import 'package:donor_soul/common/gradient.dart';
import 'package:flutter/material.dart';

class ChooseAccountType extends StatelessWidget {
  const ChooseAccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Escolha o tipo de conta',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      body: Stack(
        children: [
          const GradientContainer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register_user_common');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey[400]!,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Image(
                          image: AssetImage('assets/images/doador.png'),
                          height: 150,
                          width: 150,
                        ),
                        Text(
                          'Doador',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register_user_institution');
                  },
                  splashColor: primaryColor,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey[400]!,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Image(
                          image: AssetImage('assets/images/ong.png'),
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          'Instituição',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
