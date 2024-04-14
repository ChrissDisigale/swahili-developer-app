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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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

                Text('SIGN UP', style: fontSizeBold.copyWith(fontSize: Dimensions.fontSizeOverOverLarge)),
                const SizedBox(height: 50),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Username',
                  controller: _usernameController,
                  focusNode: _usernameFocus,
                  nextFocus: _emailFocus,
                  inputType: TextInputType.name,
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Email',
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocus: _phoneFocus,
                  inputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Phone',
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  nextFocus: _passwordFocus,
                  inputType: TextInputType.number,
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Password',
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  nextFocus: _confirmPasswordFocus,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  fillColor: Colors.white,
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
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
              buttonText: 'Sign Up',
              onPressed: () => {},
            ),

            const SizedBox(height: Dimensions.paddingSizeSmall),
          ]),
        ),
        ),
      ),
    );
  }
}
