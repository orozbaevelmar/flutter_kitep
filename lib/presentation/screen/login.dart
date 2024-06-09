import 'package:flutter/material.dart';
import 'package:kitep/constants/constants.dart';
import 'package:kitep/presentation/screen/home_screen.dart';
import 'package:kitep/presentation/widget/custom_button.dart';
import 'package:kitep/presentation/widget/text_field_with_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildLoginBody(context);
  }

  Widget _buildLoginBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Кирүү', style: MTextStyle.appBarTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/oshsu_kitep.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                CustomTextFieldWithColumnText(
                  title: 'Номер телефона',
                  hintText: '+996550000000',
                  controller: phoneController,
                ),
                const SizedBox(height: 24),
                CustomTextFieldWithColumnText(
                  title: 'Пароль',
                  hintText: '************',
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 5),
                SizedBox(height: 15),
                CustomButton(
                  title: 'Кирүү',
                  onTap: () => Go.to(context, HomeScreen()),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
