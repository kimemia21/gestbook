// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'dart:ui';
import 'package:application/widgets/AuthServices.dart';
import 'package:application/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String _barcode = '';
  String? k;

  @override
  void initState() {
    super.initState();
    final url = html.window.location.href;
    final uri = Uri.parse(url);

    k = uri.queryParameters['k'];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (k != null) {
        AuthServices().getGuestInfo(qrCode: k, context: context);
      } else {
        popups().userNotAvailable(context: context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _handleKeyEvent(event) {
  //   print(event);
  //   final key = event.key;

  //   if (key == 'Enter') {
  //     AuthServices().getGuestInfo(qrCode: _barcode, context: context);
  //     _barcode = '';
  //   } else {
  //     _barcode += key;
  //   }
  // }
  Widget splashDetails({
  required Icon icon,
  required String title,
  required String sub,
  required double fontSize,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      // Determine if the screen width is less than 600 pixels (indicating mobile view)
      final isMobile = constraints.maxWidth < 600;

      // Set font size based on the device type
      final double adjustedFontSize = isMobile ? fontSize * 0.8 : fontSize;

      // Determine the height of the container based on the device type
      final double? containerHeight = isMobile ? null : 100.0;

      return Container(
        height: containerHeight,
        width: MediaQuery.of(context).size.width*0.5,
        padding: EdgeInsets.all(isMobile ?2 : 2),
        margin: EdgeInsets.all(isMobile ? 2 : 2),
        child: isMobile // Check if width is on mobile view
            ? Column( // If on mobile view, return a Column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container( // Wrap icon in Container with margin
                          margin: EdgeInsets.symmetric(vertical: 5), // Add vertical margin
                          child: icon,
                        ),
                      ), // Wrap icon in Expanded widget
                      SizedBox(width: 8), // Add some space between icon and text
                      Expanded( // Wrap title and subtitle in Expanded widget
                        flex: 2, // Set flex for title
                        child: Column( // Create a Column for title and subtitle
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container( // Wrap title in Container with margin
                              margin: EdgeInsets.only(top: 5, bottom: 2), // Add top and bottom margin
                              child: Text(
                                title,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: adjustedFontSize,
                                ),
                              ),
                            ),
                            Container( // Wrap sub in Container with margin
                              margin: EdgeInsets.only(top: 2, bottom: 5), // Add top and bottom margin
                              child: Text(
                                sub,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: adjustedFontSize * 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  child: ListTile( // If not on mobile view, return a ListTile
                      leading: icon,
                      title: Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: adjustedFontSize,
                        ),
                      ),
                      subtitle: Text(
                        sub,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: adjustedFontSize * 0.8,
                        ),
                      ),
                    ),
                ),
              ],
            ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double containerWidth = screenSize.width * 0.8;
    
    final double fontSize = screenSize.width < 600 ? 12 : 14;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://cdn.dribbble.com/users/1020613/screenshots/12538203/media/3fb0d356bc3d98d455443f3ad5a83f5e.gif",
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: containerWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.2),
                    padding: EdgeInsets.all(10.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 600) {
                          // Mobile view (Row)
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: splashDetails(
                                    icon: Icon(
                                      Icons.pin_drop,
                                      color: Colors.black54,
                                      size: 35,
                                    ),
                                    title: "Pay Us a Visit",
                                    sub: "ROAD C, Enterprise Rd, Nairobi",
                                    fontSize: fontSize,
                                  ),
                                ),
                                
                                Expanded(
                                  child: splashDetails(
                                    icon: Icon(
                                      Icons.wifi_calling_3,
                                      color: Colors.black54,
                                      size: 35,
                                    ),
                                    title: "Give Us a call",
                                    sub: "0781033073",
                                    fontSize: fontSize,
                                  ),
                                ),
                                
                                Expanded(
                                  child: splashDetails(
                                    icon: Icon(
                                      Icons.mail_outline_outlined,
                                      color: Colors.black54,
                                      size: 35,
                                    ),
                                    title: "Send Us a Message",
                                    sub: "box@gnovation.xyz",
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Tablet/Desktop view (Column)
                          return Column(
                            children: [
                              Text(
                                "Gnovation",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width < 600 ? 20 : 24,
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
                                sub: "ROAD C, Enterprise Rd, Nairobi",
                                fontSize: fontSize,
                              ),
                              
                              splashDetails(
                                icon: Icon(
                                  Icons.wifi_calling_3,
                                  color: Colors.black54,
                                  size: 35,
                                ),
                                title: "Give Us a call",
                                sub: "0781033073",
                                fontSize: fontSize,
                              ),
                                      splashDetails(
                                icon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.black54,
                                  size: 35,
                                ),
                                title: "Send Us a Message",
                                sub: "box@gnovation.xyz",
                                fontSize: fontSize,
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
