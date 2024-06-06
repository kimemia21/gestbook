// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application/widgets/AuthServices.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: GoogleFonts.abel(
    fontSize: 16,
  ),
  backgroundColor: Colors.grey.shade200,
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 350),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  titleStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
  alertAlignment: Alignment.center,
);

class popups {
  void displayFormDialog(
      {required BuildContext context,
      required String guest_id,
      required String name,
      required String email,
      required String corp}) {
    List myList = [name, email, corp];
    print(myList);
    final _formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();

    TextEditingController emailController = TextEditingController();

    TextEditingController corpController = TextEditingController();

    if (name.isNotEmpty) {
      nameController.text = name;
    }
    if (email.isNotEmpty) {
      emailController.text = email;
    }
    if (corp.isNotEmpty) {
      corpController.text = corp;
    }

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        AuthServices()
            .postUserInfo(
              context: context,
              guest_id: guest_id, email: emailController.text);
             Navigator.pop(context);

        // Form is valid, proceed with API call
      }
    }

 
    Alert(
      style: alertStyle,
      context: context,
      // type: AlertType.warning,
      title: "Add Missing Fields",
      // desc: "Flutter is more awesome with RFlutter Alert.",
      content: Container(
          width: 600,
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  Container(
                    margin: EdgeInsets.only(bottom: 25, top: 25),
                    alignment: Alignment.center,
                    height: 60,
                    // width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.visiblePassword,
                      controller: nameController,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        // setState(() {
                        //   password = value;
                        // });
                      },
                      decoration: InputDecoration(
                        labelText: "Full name",
                        labelStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
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
                      controller: emailController,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        // setState(() {
                        //   email = value;
                        // });
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
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
                      controller: corpController,
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
                          fontWeight: FontWeight.w600,
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
          )),
      //     ),,

      buttons: [
        DialogButton(
          radius: BorderRadius.circular(10),
          child: Text(
            "save",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _submitForm();
            
          },
          color:Colors.green.shade400,
        ),

        DialogButton(
           color:Colors.red.shade300,

          // ignore: sort_child_properties_last
          child: Text(
            "close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }

  void successINFO({required BuildContext context, required name}) {
    AwesomeDialog(
      autoHide: Duration(seconds: 2),
      bodyHeaderDistance: 20,
      width: 500,
      transitionAnimationDuration: Duration(milliseconds: 400),
      // customHeader: Image.network(
      //     "https://static-00.iconduck.com/assets.00/success-icon-512x512-qdg1isa0.png"),
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,

      title: 'Details are okey',
      titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      desc: "Welcome $name to our ai base forum",
      descTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      // desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }

  
  void addSuccess({required BuildContext context}) {
    AwesomeDialog(
      autoHide: Duration(seconds: 2),
      bodyHeaderDistance: 20,
      width: 500,
      transitionAnimationDuration: Duration(milliseconds: 100),
      // customHeader: Image.network(
      //     "https://static-00.iconduck.com/assets.00/success-icon-512x512-qdg1isa0.png"),
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,

      title: 'Added succesfully',
      titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      // desc: "Welcome $name to our ai base forum",
      // descTextStyle: GoogleFonts.poppins(
      //     fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      // desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }

   void userNotAvailable({required BuildContext context}) {
    AwesomeDialog(
      
      btnOkColor: Colors.red.shade400,
      autoHide: Duration(seconds: 4),
      bodyHeaderDistance: 40,
      width: 400,
      transitionAnimationDuration: Duration(milliseconds: 100),
      // customHeader: Image.network(
      //     "https://static-00.iconduck.com/assets.00/success-icon-512x512-qdg1isa0.png"),
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.error,

      title: 'User not Found',
      titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      // desc: "Welcome $name to our ai base forum",
      // descTextStyle: GoogleFonts.poppins(
      //     fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 12),
      // desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }



}
