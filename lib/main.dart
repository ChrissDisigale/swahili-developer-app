import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swahlli_developers/screens/log_in_screen.dart';
import 'package:swahlli_developers/screens/sing_up_screen.dart';
import 'package:swahlli_developers/util/dimensions.dart';
import 'package:swahlli_developers/util/images.dart';
import 'package:swahlli_developers/util/styles.dart';
import 'package:swahlli_developers/widget/custom_button_widget.dart';
import 'package:swahlli_developers/widget/custom_dialog_widget.dart';

import 'helper/animated_custom_dialog_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: const Color(0xff2A4790),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => _onWillPop(context),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          decoration: const BoxDecoration(color: Color(0xffEDF0F9)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(Images.logo, width: 250),
                            const SizedBox(
                                height: Dimensions.paddingSizeExtraLarge),
                            Text('swahili developer.',
                                style: fontSizeBold.copyWith(
                                    fontSize:
                                        Dimensions.fontSizeOverOverLarge)),
                            const SizedBox(height: 10),
                            Text('Home Of Developers',
                                style: fontSizeMedium.copyWith(
                                    fontSize: Dimensions.fontSizeLarge,
                                    color: Theme.of(context).primaryColor)),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    CustomButtonWidget(
                      isLoading: false,
                      buttonText: 'Sign Up',
                      // onPressed: () => _login(authController, _usernameController, _passwordController, context),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(Dimensions.webMaxWidth, 50),
                        padding: EdgeInsets.zero,
                        elevation: 5,
                        // Add the desired elevation value
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login',
                              textAlign: TextAlign.center,
                              style: fontSizeMedium.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeLarge,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.logout,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  showAnimatedDialogHelper(
      context,
      CustomDialogWidget(
        icon: Icons.exit_to_app_rounded,
        title: 'exit',
        description: 'Do you want to exit app',
        onTapFalse: () => Navigator.of(context).pop(false),
        onTapTrue: () {
          SystemNavigator.pop();
        },
        onTapTrueText: 'yes',
        onTapFalseText: 'no',
      ),
      dismissible: false,
      isFlip: true);
  return true;
}
