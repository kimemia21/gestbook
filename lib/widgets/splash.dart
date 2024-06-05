// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'dart:ui';

import 'package:application/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      popups().displayFormDialog(context: context);
    });
    Future.delayed(Duration(seconds: 1), () {
      popups().successINFO(context: context);
    });
  }

  Widget splashDetails({required icon, required title, required sub}) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          sub,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://img.pikbest.com/wp/202348/advertising-display-stand-illustrated-for-interactive-kiosks-promotions_9779247.jpg!bw700",
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Gnovation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        splashDetails(
                            icon: Icon(
                              Icons.pin_drop,
                              color: Colors.black54,
                              size: 35,
                            ),
                            title: "Pay Us a Visit",
                            sub: "ROAD C, Enterprise Rd, Nairobi"),
                        VerticalDivider(),
                        splashDetails(
                            icon: Icon(
                              Icons.wifi_calling_3,
                              color: Colors.black54,
                              size: 35,
                            ),
                            title: "Give Us a call",
                            sub: "0781033073"),
                        VerticalDivider(),
                        splashDetails(
                            icon: Icon(
                              Icons.mail_outline_outlined,
                              color: Colors.black54,
                              size: 35,
                            ),
                            title: "Send Us a Message",
                            sub: "box@gnovation.xyz"),
                        VerticalDivider()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
