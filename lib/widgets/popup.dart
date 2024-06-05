// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class popups {
  void displayFormDialog({required BuildContext context}) {
    AwesomeDialog(
      width: MediaQuery.of(context).size.width * 0.4,
  

      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.warning,
      body: Container(

     
        width: 600,
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "missing fields",
                  style: GoogleFonts.poppins(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25, top: 25),
                  alignment: Alignment.center,
                  height: 60,
                  // width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    // controller: _SignUpPasswordController,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      // setState(() {
                      //   password = value;
                      // });
                    },
                    decoration: InputDecoration(
                      labelText: "Full name",
                      labelStyle: GoogleFonts.poppins(
                        fontWeight:FontWeight.w600,
                        
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      prefixIcon: Icon(CupertinoIcons.padlock_solid,
                          color: Colors.black54),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "full name is Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  alignment: Alignment.center,
                  height: 60,
                  // width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    // controller: _SignemailController,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      // setState(() {
                      //   email = value;
                      // });
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.poppins(
                        fontWeight:FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      prefixIcon: Icon(
                        CupertinoIcons.mail_solid,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is empty";
                      }
                      if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25, top: 25),
                  alignment: Alignment.center,
                  height: 60,
                  
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    // controller: _SignUpPasswordController,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      // setState(() {
                      //   password = value;
                      // });
                    },
                    decoration: InputDecoration(
                      labelText: "Company name",
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight:FontWeight.w600,
                        color: Colors.black54,
                      ),
                      prefixIcon: Icon(CupertinoIcons.padlock_solid,
                          color: Colors.black54),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Company name  is Empty";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // title: 'This is Ignored',
      // desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }

  void successINFO({required BuildContext context}) {
    AwesomeDialog(

      autoHide: Duration(seconds: 2),
      bodyHeaderDistance: 20,
      width:500,
      transitionAnimationDuration: Duration(milliseconds: 200),
      // customHeader: Image.network(
      //     "https://static-00.iconduck.com/assets.00/success-icon-512x512-qdg1isa0.png"),
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,

      title: 'Details are okey',
      titleTextStyle:GoogleFonts.poppins(fontWeight:FontWeight.w600,color:Colors.black54,fontSize:10),
      // desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }
}
