import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabbar/models/Globals.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int initialstep = 0;
  getimagefromcamera() async {
    ImagePicker pick = ImagePicker();
    XFile? file = await pick.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        Globals.image = File(file.path);
      });
    }
  }

  String? name;
  String? contact;
  String? description;
  final gk1 = GlobalKey<FormState>();
  final gk2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: initialstep,
      onStepTapped: (val) {
        setState(() {
          initialstep = val;
        });
      },
      onStepContinue: () {
        setState(() {
          if (initialstep < 2) {
            ++initialstep;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (initialstep > 0) {
            --initialstep;
          }
        });
      },
      controlsBuilder: ((context, controldetails) {
        return (controldetails.currentStep == 0)
            ? Row(
                children: [
                  ElevatedButton(
                      onPressed: controldetails.onStepContinue,
                      child: Text("Next")),
                  OutlinedButton(
                      onPressed: controldetails.onStepCancel,
                      child: Text("Privious"))
                ],
              )
            : (controldetails.currentStep == 1)
                ? Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (gk1.currentState!.validate()) {
                                gk1.currentState!.save();
                                if (initialstep < 2) {
                                  ++initialstep;
                                }
                              }
                            });
                          },
                          child: Text("Next")),
                      OutlinedButton(
                          onPressed: controldetails.onStepCancel,
                          child: Text("Privious"))
                    ],
                  )
                : Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (gk2.currentState!.validate()) {
                                gk2.currentState!.save();
                                if (initialstep < 2) {
                                  ++initialstep;
                                }
                              }
                            });
                          },
                          child: Text("Next")),
                      OutlinedButton(
                          onPressed: controldetails.onStepCancel,
                          child: Text("Privious"))
                    ],
                  );
      }),
      steps: [
        Step(
          title: Text("Profile Photo"),
          state: StepState.indexed,
          subtitle: Text("Add Profile Photo"),
          content: Stack(alignment: Alignment(1, 1), children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage:
                  (Globals.image != null) ? FileImage(Globals.image!) : null,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  getimagefromcamera();
                });
              },
              child: Icon(Icons.add),
              mini: true,
            )
          ]),
          isActive: (initialstep >= 0) ? true : false,
        ),
        Step(
          title: Text("Name"),
          subtitle: Text("Enter Name"),
          content: Form(
            key: gk1,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Globals.name = val;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Akash Dungrani",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Contact Number";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Globals.contact = val;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "+91 3456789907",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ],
            ),
          ),
          isActive: (initialstep >= 1) ? true : false,
        ),
        Step(
          title: Text("Description"),
          subtitle: Text("Welcome to app"),
          content: Form(
            key: gk2,
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please Enter Description";
                }
              },
              onSaved: (val) {
                setState(() {
                  Globals.description = val;
                });
              },
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: "Welcome to this app",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          isActive: (initialstep >= 2) ? true : false,
        )
      ],
    );
  }
}
