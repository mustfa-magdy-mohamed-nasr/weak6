import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/hemaB.jpg"), fit: BoxFit.fill)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 420,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Ebrahhime Elgitany',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Text(
                    //   'Member',
                    //   style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                    DetalisMember(
                      contanerColora: Color(0xffEAF2FF),
                      title: 'Phone Namber ',
                      fanction: '01093301415',
                      icon: Icons.phone,
                      iconColore: Color(0xff5699ff),
                    ),
                    Divider(
                      endIndent: 15,
                      indent: 15,
                    ),
                    DetalisMember(
                      contanerColora: Color(0xffFFEEEF),
                      title: 'Email ',
                      fanction: 'ebrahhimeElgitany@gmail.com',
                      icon: Icons.email_outlined,
                      iconColore: Color(0xffFF5969),
                    ),
                    Divider(
                      endIndent: 15,
                      indent: 15,
                    ),

                    DetalisMember(
                      contanerColora: Color(0xffE9FAEF),
                      title: 'Fanction ',
                      fanction: 'Member',
                      icon: Icons.wordpress,
                      iconColore: Color(0xff29c763),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalisMember extends StatelessWidget {
  const DetalisMember({
    required this.contanerColora,
    required this.title,
    required this.fanction,
    required this.icon,
    required this.iconColore,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String fanction;
  final Color contanerColora;
  final Color iconColore;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: contanerColora),
        child: Icon(
          icon,
          color: iconColore,
        ),
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      subtitle: Text(
        fanction,
        style: const TextStyle(color: Colors.grey, inherit: false),
      ),
    );
  }
}
