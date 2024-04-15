// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MaterialApp(home: Home()));
// // }

// // class Home extends StatefulWidget {
// //   const Home({super.key});

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> with TickerProviderStateMixin<Home> {
// //   static const List<Destination> allDestinations = <Destination>[
// //     Destination(0, 'Home', Icons.home, Colors.teal),
// //     Destination(1, 'Add', Icons.add, Colors.cyan),
// //     Destination(2, 'History', Icons.history, Colors.orange),
// //     Destination(3, 'Meals', Icons.fastfood_rounded, Colors.blue),
// //   ];

// //   late final List<GlobalKey<NavigatorState>> navigatorKeys;
// //   late final List<GlobalKey> destinationKeys;
// //   late final List<AnimationController> destinationFaders;
// //   late final List<Widget> destinationViews;
// //   int selectedIndex = 0;

// //   AnimationController buildFaderController() {
// //     final AnimationController controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 300),
// //     );
// //     controller.addStatusListener(
// //       (AnimationStatus status) {
// //         if (status == AnimationStatus.dismissed) {
// //           setState(() {}); // Rebuild unselected destinations offstage.
// //         }
// //       },
// //     );
// //     return controller;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();

// //     navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
// //       allDestinations.length,
// //       (int index) => GlobalKey(),
// //     ).toList();

// //     destinationFaders = List<AnimationController>.generate(
// //       allDestinations.length,
// //       (int index) => buildFaderController(),
// //     ).toList();
// //     destinationFaders[selectedIndex].value = 1.0;

// //     final CurveTween tween = CurveTween(curve: Curves.fastOutSlowIn);
// //     destinationViews = allDestinations.map<Widget>(
// //       (Destination destination) {
// //         return FadeTransition(
// //           opacity: destinationFaders[destination.index].drive(tween),
// //           child: DestinationView(
// //             destination: destination,
// //             navigatorKey: navigatorKeys[destination.index],
// //           ),
// //         );
// //       },
// //     ).toList();
// //   }

// //   @override
// //   void dispose() {
// //     for (final AnimationController controller in destinationFaders) {
// //       controller.dispose();
// //     }
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return NavigatorPopHandler(
// //       onPop: () {
// //         final NavigatorState navigator =
// //             navigatorKeys[selectedIndex].currentState!;
// //         navigator.pop();
// //       },
// //       child: Scaffold(
// //         body: SafeArea(
// //           top: false,
// //           child: Stack(
// //             fit: StackFit.expand,
// //             children: allDestinations.map(
// //               (Destination destination) {
// //                 final int index = destination.index;
// //                 final Widget view = destinationViews[index];
// //                 if (index == selectedIndex) {
// //                   destinationFaders[index].forward();
// //                   return Offstage(offstage: false, child: view);
// //                 } else {
// //                   destinationFaders[index].reverse();
// //                   if (destinationFaders[index].isAnimating) {
// //                     return IgnorePointer(child: view);
// //                   }
// //                   return Offstage(child: view);
// //                 }
// //               },
// //             ).toList(),
// //           ),
// //         ),
// //         bottomNavigationBar: NavigationBar(
// //           selectedIndex: selectedIndex,
// //           onDestinationSelected: (int index) {
// //             setState(() {
// //               selectedIndex = index;
// //             });
// //           },
// //           destinations: allDestinations.map<NavigationDestination>(
// //             (Destination destination) {
// //               return NavigationDestination(
// //                 icon: Icon(destination.icon, color: destination.color),
// //                 label: destination.title,
// //               );
// //             },
// //           ).toList(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Destination {
// //   const Destination(this.index, this.title, this.icon, this.color);
// //   final int index;
// //   final String title;
// //   final IconData icon;
// //   final MaterialColor color;
// // }

// // class RootPage extends StatelessWidget {
// //   const RootPage({super.key, required this.destination});

// //   final Destination destination;

// //   Widget _buildDialog(BuildContext context) {
// //     return AlertDialog(
// //       title: Text('${destination.title} AlertDialog'),
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final TextStyle headlineSmall = Theme.of(context).textTheme.headlineSmall!;
// //     final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
// //       backgroundColor: destination.color,
// //       foregroundColor: Colors.white,
// //       visualDensity: VisualDensity.comfortable,
// //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
// //       textStyle: headlineSmall,
// //     );

// //     return Scaffold(
// //       appBar: AppBar(
// //         leading:
// //             IconButton(icon: const Icon(Icons.menu_rounded), onPressed: () {}),
// //         //title: Text('${destination.title} '),
// //         actions: <Widget>[
// //           IconButton(
// //               icon:
// //                   const Icon(Icons.notifications_active, color: Colors.black54),
// //               onPressed: () {}),
// //           IconButton(
// //               icon:
// //                   Image.asset('assets/images/Male.png', width: 35, height: 35),
// //               onPressed: () {}),
// //         ],
// //         backgroundColor: Colors.transparent,
// //         foregroundColor: const Color.fromARGB(255, 0, 0, 0),
// //       ),
// //       backgroundColor: const Color.fromARGB(255, 87, 20, 20),
// //       body: const Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ListPage extends StatelessWidget {
// //   const ListPage({super.key, required this.destination});

// //   final Destination destination;

// //   @override
// //   Widget build(BuildContext context) {
// //     const int itemCount = 50;
// //     final ColorScheme colorScheme = Theme.of(context).colorScheme;
// //     final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(8),
// //         side: BorderSide(
// //           color: colorScheme.onSurface.withOpacity(0.12),
// //         ),
// //       ),
// //       foregroundColor: destination.color,
// //       fixedSize: const Size.fromHeight(64),
// //       textStyle: Theme.of(context).textTheme.headlineSmall,
// //     );
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${destination.title} ListPage - /list'),
// //         backgroundColor: destination.color,
// //         foregroundColor: Colors.white,
// //       ),
// //       backgroundColor: destination.color[50],
// //       body: SizedBox.expand(
// //         child: ListView.builder(
// //           itemCount: itemCount,
// //           itemBuilder: (BuildContext context, int index) {
// //             return Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
// //               child: OutlinedButton(
// //                 style: buttonStyle.copyWith(
// //                   backgroundColor: MaterialStatePropertyAll<Color>(
// //                     Color.lerp(destination.color[100], Colors.white,
// //                         index / itemCount)!,
// //                   ),
// //                 ),
// //                 onPressed: () {
// //                   Navigator.pushNamed(context, '/text');
// //                 },
// //                 child: Text('Push /text [$index]'),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class TextPage extends StatefulWidget {
// //   const TextPage({super.key, required this.destination});

// //   final Destination destination;

// //   @override
// //   State<TextPage> createState() => _TextPageState();
// // }

// // class _TextPageState extends State<TextPage> {
// //   late final TextEditingController textController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     textController = TextEditingController(text: 'Sample Text');
// //   }

// //   @override
// //   void dispose() {
// //     textController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final ThemeData theme = Theme.of(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${widget.destination.title} TextPage - /list/text'),
// //         backgroundColor: widget.destination.color,
// //         foregroundColor: Colors.white,
// //       ),
// //       backgroundColor: widget.destination.color[50],
// //       body: Container(
// //         padding: const EdgeInsets.all(32.0),
// //         alignment: Alignment.center,
// //         child: TextField(
// //           controller: textController,
// //           style: theme.primaryTextTheme.headlineMedium?.copyWith(
// //             color: widget.destination.color,
// //           ),
// //           decoration: InputDecoration(
// //             focusedBorder: UnderlineInputBorder(
// //               borderSide: BorderSide(
// //                 color: widget.destination.color,
// //                 width: 3.0,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class DestinationView extends StatefulWidget {
// //   const DestinationView({
// //     super.key,
// //     required this.destination,
// //     required this.navigatorKey,
// //   });

// //   final Destination destination;
// //   final Key navigatorKey;

// //   @override
// //   State<DestinationView> createState() => _DestinationViewState();
// // }

// // class _DestinationViewState extends State<DestinationView> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Navigator(
// //       key: widget.navigatorKey,
// //       onGenerateRoute: (RouteSettings settings) {
// //         return MaterialPageRoute<void>(
// //           settings: settings,
// //           builder: (BuildContext context) {
// //             switch (settings.name) {
// //               case '/':
// //                 return RootPage(destination: widget.destination);
// //               case '/list':
// //                 return ListPage(destination: widget.destination);
// //               case '/text':
// //                 return TextPage(destination: widget.destination);
// //             }
// //             assert(false);
// //             return const SizedBox();
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:first/screens/forget_password.dart';
// import 'package:first/screens/home_page.dart';
// import 'package:first/screens/user_registration.dart';
// import 'package:first/services/auth.dart';
// import 'package:first/widgets/s_button.dart';
// import 'package:flutter/material.dart';
// import 'package:first/widgets/style_text.dart';
// import 'package:first/widgets/custom_button.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AuthServices _auth = AuthServices();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String email = "";
//   String password = "";
//   String errorMessage = ""; // Add error message variable

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: SafeArea(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const StyledText('Enter Your Email & password to Log in'),
//                     const SizedBox(height: 40),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                       ),
//                       validator: (val) =>
//                           val!.isEmpty ? 'Enter an email' : null,
//                       onChanged: (val) {
//                         setState(() {
//                           email = val;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       obscureText: true,
//                       validator: (val) =>
//                           val!.isEmpty ? 'Enter a password' : null,
//                       onChanged: (val) {
//                         setState(() {
//                           password = val;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     if (errorMessage.isNotEmpty) // Display error message if not empty
//                       Text(
//                         errorMessage,
//                         style: TextStyle(
//                           color: Colors.red,
//                         ),
//                       ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: SButton(
//                             text: 'Forgot Password',
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const ForgetPassword(),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const StyledText('Or login with'),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.facebook_rounded,
//                               size: 30.0,
//                               color: Color.fromARGB(255, 2, 27, 254)),
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 10),
//                         IconButton(
//                           icon: Image.asset(
//                             google,
//                             height: 30,
//                             width: 30,
//                           ),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const StyledText('Do not have an account ?'),
//                         SButton(
//                           text: 'Register Now',
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UserRegistration(),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: CustomButton(
//                         text: 'Login',
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             dynamic result =
//                                 await _auth.signInWithEmailAndPassword(
//                               email,
//                               password,
//                             );
//                             if (result == null) {
//                               setState(() {
//                                 errorMessage = 'Invalid email or password'; // Set error message
//                               });
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HomePage(),
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
