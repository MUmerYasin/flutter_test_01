/// Flutter code sample for Form

// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/form.png)

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:share/share.dart';

// void main() => runApp2(const MyApp2());

/// This is the main application widget.
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  static const String _title = 'Flutter Form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


enum SingingCharacter { Under18, Under50 }

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  SingingCharacter? _character = SingingCharacter.Under18;
  bool isChecked = false;


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLastNameValue);
  }

  // void _printLastNameValue() {

  //   print('Last Name: ${myController.text}');
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///Title Login Form
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                    child: Text(
                      'Login Form',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Double Text fields in one Row
            Row(
              children: [
                /// first name
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 4.0, 6.0),
                    child: TextFormField(
                      controller: fNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText:
                        hintText: 'First Name',
                      ),

                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!isAlpha(value)) {
                          return "Invalid First Name";
                        }
                        // return null;
                      },
                      // onChanged: (text) {

                      //   print('First text field: $text');
                      // },
                    ),
                  ),
                ),

                /// last name
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 16.0, 8.0, 6.0),
                    child: TextFormField(
                      controller: lNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Last Name'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!isAlpha(value)) {
                          return "Invalid Last Name";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),

            /// email text field
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Email'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!isEmail(value)) {
                          return "Invalid Email";
                        }
                      },

                      // validator: (String? value) => !isEmail(value) ? "Invalid Email" : null;,
                    ),
                  ),
                ),
              ],
            ),

            /// Phone number text field
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneController,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone Number'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!isNumeric(value)) {
                          return "Invalid Phone Number";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),

            ///Address text field
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 8.0),
                    child: TextFormField(
                      controller: addressController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Address'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!isAlphanumeric(value)) {
                          return "Invalid Address";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Row(
            //   children: [
            // Expanded(child:
            //
            // ),
            //   ],
            // ),



            /// Radio Button

            Row(
              children: <Widget>[
            Expanded(child:
            ListTile(
              title: const Text('Under18'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Under18,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() { _character = value; });
                },
              ),
            ),
            ),
              ],
            ),

            Row(
              children: <Widget>[
            Expanded(child:
            ListTile(
              title: const Text('Under50'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Under50,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() { _character = value; });
                },
              ),
            ),
            ),
              ],
            ),

            /// Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Color getColor(Set<MaterialState> states) {
                // const Set<MaterialState> interactiveStates = <MaterialState>{
                // MaterialState.pressed,
                // MaterialState.hovered,
                // MaterialState.focused,
                // };
                // if (states.any(interactiveStates.contains)) {
                // return Colors.blue;
                // }
                // return Colors.red;
                // }

                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),

                Expanded(child:
                Text("  Are you agree on terms and conditions"),
                    ),
              ],
            ),

            // Row(
            //   children: <Widget>[
            // // Expanded(child:
            // //
            // // ),
            //
            //
            //   ],
            // ),

            //Button
            Row(
              children: [
                //Submit Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(100, 50) // put the width and height you want
                          ),
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.

                        /// Notification bar on screen
                        // if (_formKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')),
                        //
                        //   );
                        //   // Process data.
                        // }

                        String myContValue = " > First Name : " +
                            fNameController.text +
                            " > Last Name : " +
                            lNameController.text +
                            " > Email : " +
                            emailController.text +
                            " > Phone Number : " +
                            phoneController.text +
                            " > address : " +
                            addressController.text +
                            " > Age " + _character.toString() ;
                        if (myContValue.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text("Error Empty Fields"),
                              );
                            },
                          );
                        } else {
                          Share.share(myContValue);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),

                //Reset button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(100, 50) // put the width and height you want
                          ),
                      onPressed: () {
                        fNameController.text = "";
                        lNameController.text = "";
                        emailController.text = "";
                        phoneController.text = "";
                        addressController.text = "";
                      },
                      child: const Text('Reset'),
                    ),
                  ),
                ),

                //show data button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(100, 50) // put the width and height you want
                          ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the user has entered by using the
                              // TextEditingController.
                              content: Text(
                                " >First Name : " +
                                    fNameController.text +
                                    " >Last Name : " +
                                    lNameController.text +
                                    " >Email : " +
                                    emailController.text +
                                    " >Phone Number: " +
                                    phoneController.text +
                                    " >address: " +
                                    addressController.text + " > Age " + _character.toString(),
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Show'),
                    ),
                  ),
                ),
              ],
            ),

            //Show Text
            // Row(
            //   children: [
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             vertical: 16.0, horizontal: 8.0),
            //         // child:  Text('Last Name: ${addressController.text}'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
