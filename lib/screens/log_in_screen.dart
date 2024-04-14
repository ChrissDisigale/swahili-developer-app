import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/animated_custom_dialog_helper.dart';
import '../../util/dimensions.dart';
import '../../util/images.dart';
import '../../util/styles.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_dialog_widget.dart';
import '../../widget/custom_text_field_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        decoration: const BoxDecoration(
          color: Color(0xffEDF0F9)
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
          child: Column( mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
            Flexible(child: SingleChildScrollView(
              child: Column(children: [

                Text('LOGIN', style: fontSizeBold.copyWith(fontSize: Dimensions.fontSizeOverOverLarge)),
                const SizedBox(height: 50),

                Image.asset(Images.logo, width: 250),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Username',
                  controller: _usernameController,
                  focusNode: _usernameFocus,
                  nextFocus: _passwordFocus,
                  inputType: TextInputType.name,
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Password',
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
              ],
              ),
            ),
            ),

            const SizedBox(height: Dimensions.paddingSizeExtraLarge),

            CustomButtonWidget(
              isLoading: false,
              buttonText: 'Login',
              // onPressed: () => _login(authController, _usernameController, _passwordController, context),
              onPressed: () => {},
            ),

            const SizedBox(height: Dimensions.paddingSizeSmall),
          ]),
        ),
        ),
      ),
    );
  }

  void _login(
      TextEditingController emailController,
      TextEditingController passController,
      BuildContext context) async {
    String password = passController.text.trim();
    String email = _usernameController.text.trim();

  }
}