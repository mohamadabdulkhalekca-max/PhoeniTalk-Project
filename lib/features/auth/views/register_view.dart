import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uniapp/core/widgets/app_button.dart';
import 'package:uniapp/features/auth/data/services/auth_service.dart';
import 'package:uniapp/features/auth/views/login_view.dart';
import 'package:uniapp/features/auth/views/widgets/auth_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: RegisterViewBody());
  }
}

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),

            child: SingleChildScrollView(
              child: Column(
                spacing: 50,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to PhoeniTalk!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "let's create your account.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    spacing: 20,
                    children: [
                      AuthTextField(
                        controller: _userNameController,
                        label: 'username',
                        icon: Icon(Icons.person),
                      ),
                      AuthTextField(
                        icon: Icon(Icons.mail),
                        label: "Email",
                        controller: _emailController,
                      ),
                      AuthTextField(
                        controller: _passwordController,
                        label: "Pasword",
                        icon: Icon(Icons.lock),
                        isObscure: true,
                      ),

                      AppButton(
                        ontap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          AuthService authService = AuthService.instance;

                          await authService.signUpUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                            displayName: _userNameController.text,
                            context: context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "already  have an account?"),
                              TextSpan(
                                text: " Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute(
                                            builder: (context) => LoginView(),
                                          ),
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
