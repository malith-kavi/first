// import 'dart:math';

// import 'package:first/screens/notifications.dart';
// import 'package:first/screens/user_registration.dart';
// import 'package:first/widgets/custom_button.dart';
// import 'package:first/widgets/num_box.dart';
// import 'package:first/widgets/s_button.dart';
// import 'package:first/widgets/style_text.dart';
// import 'package:flutter/material.dart';

// var verification = 'assets/images/verification.png';

// class VerificationReg extends StatelessWidget {
//   final List<TextEditingController> controllers = List.generate(
//     4,
//     (index) => TextEditingController(),
//   );

//   @override
//   Widget build(context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const UserRegistration(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: SafeArea(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child:
//                   Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 const Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(17, 60, 0, 0),
//                       ),
//                       Text(
//                         "Verification Code",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ]),
//                 const SizedBox(height: 20),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
//                     ),
//                     StyledText(
//                         'Enter the verification code that we \nare sent to your Email address')
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     for (int i = 0; i < 4; i++)
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: NumBox(controller: controllers[i]),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
//                     ),
//                     const StyledText("Don't receive SMS?"),
//                     SButton(
//                       text: 'Resend Code',
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   verification,
//                   width: 260,
//                   height: 260,
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: CustomButton(
//                     text: 'Register',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Notifications()),
//                       );
//                     },
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/screens/notifications.dart';
import 'package:first/screens/user_registration.dart';
import 'package:first/widgets/custom_button.dart';
import 'package:first/widgets/num_box.dart';
import 'package:first/widgets/s_button.dart';
import 'package:first/widgets/style_text.dart';
import 'package:flutter/material.dart';

class VerificationReg extends StatelessWidget {
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const UserRegistration(),
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 60, 0, 0),
                      ),
                      Text(
                        "Verification Code",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                      ),
                      StyledText(
                        'Enter the verification code that we \nare sent to your Email address',
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: NumBox(controller: controllers[i]),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                      ),
                      const StyledText("Don't receive SMS?"),
                      SButton(
                        text: 'Resend Code',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                      text: 'Register',
                      onPressed: () async {
                        final code = controllers.fold<String>(
                          '',
                          (prev, controller) => prev + controller.text,
                        );

                        try {
                          await FirebaseAuth.instance.applyActionCode(code);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications(
                                      docId: "null",
                                    )),
                          );
                        } catch (e) {
                          print('Failed to verify code: $e');
                          // Handle error: display message to user or retry, etc.
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
