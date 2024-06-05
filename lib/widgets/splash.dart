// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

Widget splashDetails({required icon, required title, required sub}) {
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(2),
    child: ListTile(
      leading: icon,
      title: Text(title,style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.bold,fontSize:14),),
      subtitle:  Text(sub,style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:11),),
    ),
  );
}

class _SplashPageState extends State<SplashPage> {
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
                  "https://mir-s3-cdn-cf.behance.net/project_modules/1400/aa8625109287767.5fd08439c7676.jpg",
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
                    padding: EdgeInsets.all(16.0),
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
                        splashDetails(icon: Icon(Icons.pin_drop,color: Colors.black54,size: 35,), title: "Pay Us a Visit", sub:"ROAD C, Enterprise Rd, Nairobi"),
                        VerticalDivider(),
                         splashDetails(icon: Icon(Icons.wifi_calling_3,color: Colors.black54,size: 35,) , title: "Give Us a call", sub: "0781033073"),
                        VerticalDivider(),
                       splashDetails(icon: Icon(Icons.mail_outline_outlined,color: Colors.black54,size: 35,) , title: "Send Us a Message", sub: "box@gnovation.xyz"),
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
