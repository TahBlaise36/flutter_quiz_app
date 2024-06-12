import 'package:flutter/material.dart';
import 'package:quiz_app/constanst/colors.dart';
import 'package:quiz_app/components/main_button.dart';
import 'package:quiz_app/components/text_styles.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage(this.switchToLevelPage, {super.key});

  final void Function() switchToLevelPage;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  Function() get switchToLevelPage => widget.switchToLevelPage;
  String name = "";
  TextEditingController nameEditing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'lib/images/Logo-removebg.png',
            width: 400,
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyles(
                'Your Mob',
                color: white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              TextStyles(
                'ile App Quiz',
                color: accentColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const TextStyles(
            'Enter your name to get started',
            fontSize: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            child: SizedBox(
              width: double.infinity,
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18), // Set text color to accentColor
                textAlignVertical: TextAlignVertical.center,
                cursorColor: accentColor, // Align text vertically center
                decoration: InputDecoration(
                  hintText: "e.g. Adam Smith",
                  contentPadding: const EdgeInsets.all(22),
                  hintStyle: TextStyle(color: textColor, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: accentColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Field is empty";
                  }
                  return null;
                },

                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                controller: nameEditing,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MainButton(
            switchToLevelPage,
            color: accentColor,
            buttonText: 'Start Quiz',
            borderRadius: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'By clicking continue, You agree to our ',
                  style: TextStyle(color: white, fontSize: 16),
                ),
                TextSpan(
                  text: 'Terms of Servive',
                  style: TextStyle(color: accentColor, fontSize: 16),
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(color: white, fontSize: 16),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(color: accentColor, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
