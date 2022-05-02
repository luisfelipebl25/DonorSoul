import 'package:donor_soul/helpers/masks.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-black1.png',
          width: 250,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/edit_profile',
                  arguments: context.read<UserInstitutionManager>().user);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<UserInstitutionManager>(
          builder: (_, userInst, __) {
            return ListView(
              shrinkWrap: true,
              children: [
                if (userInst.user!.images.isNotEmpty)
                  Container(
                    height: 350,
                    color: Theme.of(context).backgroundColor,
                    child: CarouselSlider.builder(
                      slideBuilder: (index) {
                        return Image.network(
                          userInst.user!.images[index],
                          fit: BoxFit.cover,
                        );
                      },
                      slideTransform: const TabletTransform(),
                      slideIndicator: CircularSlideIndicator(
                          padding: const EdgeInsets.only(bottom: 15),
                          currentIndicatorColor: Theme.of(context).primaryColor,
                          itemSpacing: 15,
                          indicatorRadius: 4),
                      itemCount: userInst.user!.images.length,
                    ),
                  )
                else
                  Container(
                    height: 350,
                    color: Theme.of(context).backgroundColor,
                    child: Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: primaryColor,
                        size: 40,
                      ),
                    ),
                  ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        userInst.user!.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (userInst.user!.description.isNotEmpty)
                        Text(
                          userInst.user!.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.justify,
                        )
                      else
                        Text(
                          'Descrição',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                            color: Colors.grey[500],
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Localização',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OverflowBar(
                        children: [
                          Icon(
                            Icons.roofing_outlined,
                            color: Colors.grey[700],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            userInst.user!.address,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      OverflowBar(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: Colors.grey[700],
                                size: 22,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                userInst.user!.city,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ' - ${userInst.user!.stateCountry}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      OverflowBar(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: Colors.grey[700],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            // '${userInst.user!.cep.substring(0, 5)}-${userInst.user!.cep.substring(5)}',
                            maskCEP.maskText(userInst.user!.cep),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contato',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OverflowBar(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey[700],
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            maskPhone.maskText(userInst.user!.phone),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      if (userInst.user!.emailContact.isNotEmpty)
                        OverflowBar(
                          children: [
                            Icon(
                              Icons.alternate_email,
                              color: Colors.grey[700],
                              size: 22,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              userInst.user!.emailContact,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            Icon(
                              Icons.alternate_email,
                              color: Colors.grey[500],
                              size: 22,
                            ),
                            Text(
                              'E-mail para contato',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                  fontFamily: 'Montserrat'),
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Como nos ajudar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OverflowBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Itens que estamos precisando: ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: (userInst.user!.items.map((item) {
                          return Text(
                            '- $item',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          );
                        })).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
