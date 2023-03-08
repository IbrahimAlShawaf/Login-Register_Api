import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_api/controller/user_api_controller.dart';
import 'package:user_api/model/user_model.dart';
import '../../utlis/helpers.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with Helpers {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FORGOT PASSWORD',
          style: GoogleFonts.actor(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back...',
              style: GoogleFonts.actor(
                  fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
            ),
            Text(
              'Enter email & password',
              style: GoogleFonts.actor(
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performForgotPassword(),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performForgotPassword() async {
    if (_checkData()) {
      await _forgotPassword();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _forgotPassword() async {
    UserModel response = await AuthController().forgotPassword(
      email: _emailTextController.text,
    );
    if (response.status!) {
      print(response.code);
      Get.off(() => ResetPasswordScreen(
            email: _emailTextController.text,
          ));
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.red,
        colorText: Colors.white);
  }
}
