import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:splash_onboard/core/constants/colors/login_color.dart';
import 'package:splash_onboard/core/constants/icon/login_icon.dart';
import 'package:splash_onboard/core/constants/strings/login_strings.dart';

import '../../../products/widgets/custom_text_form_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _codeNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.verticalPaddingHigh,
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLoginTexts(),
              _buildFormTextFields(),
              Padding(
                padding: context.paddingLow,
                child: _buildForgotPasswordText(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLoginButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(LoginStrings.loginText),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(context.width * 1, context.height * 0.09),
        primary: LoginColor.loginButtonColor,
        elevation: 0,
      ),
    );
  }

  Form _buildFormTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            codeController: _mailController,
            labelText: LoginStrings.emailText,
            textInputType: TextInputType.emailAddress,
            focusNode: _emailNode,
          ),
          Row(
            children: [
              CustomTextFormField(
                codeController: _passwordController,
                labelText: LoginStrings.passwordText,
                textInputType: TextInputType.number,
                focusNode: _passwordNode,
                isPassword: isPassword,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: LoginIcon.eyesIcon)
            ],
          ),
        ],
      ),
    );
  }

  TextButton _buildForgotPasswordText(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
      child: Text(
        LoginStrings.forgotPassword,
        style: context.textTheme.subtitle2,
      ),
      onPressed: () {},
    );
  }

  Column _buildLoginTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LoginStrings.welcomeText,
          style: TextStyle(
            fontSize: context.normalValue * 1.5,
          ),
        ),
        Text(
          LoginStrings.designRelishText,
          style: TextStyle(
            fontSize: context.normalValue * 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
