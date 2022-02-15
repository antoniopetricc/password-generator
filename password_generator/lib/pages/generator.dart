import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/misc/get_checkbox_color.dart';
import 'package:password_generator/misc/password_generator.dart';
import 'package:password_generator/styles.dart';
import 'package:password_generator/widgets/custom_button.dart';

class GeneratorView extends StatefulWidget {
  const GeneratorView({Key? key}) : super(key: key);

  @override
  _GeneratorViewState createState() => _GeneratorViewState();
}

class _GeneratorViewState extends State<GeneratorView> {
  final TextEditingController _passwordController = TextEditingController();
  double charLength = 8;
  bool upperCase = false;
  bool numbers = false;
  bool specialChars = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kScaffold,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Password Generator", style: Styles.kTitle),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _passwordController,
                  style: Styles.kSubtitle,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(25),
                    hintText: "Password",
                    hintStyle: Styles.kSubtitle,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                      borderRadius: Styles.kRadius,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                      borderRadius: Styles.kRadius,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Password length: ", style: Styles.kTitle),
                  Text("$charLength", style: Styles.kTitle)
                ],
              ),
              SizedBox(
                width: 150,
                child: Slider(
                  activeColor: Styles.kPrimary,
                  inactiveColor: Colors.grey.shade500,
                  thumbColor: Styles.kPrimary,
                  label: "$charLength",
                  min: 8,
                  max: 32,
                  divisions: 3,
                  value: charLength,
                  onChanged: (value) => setState(() {
                    charLength = value;
                  }),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Include uppercase letters:", style: Styles.kTitle),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: upperCase,
                    onChanged: (value) => setState(() {
                      upperCase = value!;
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Include numbers:", style: Styles.kTitle),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: numbers,
                    onChanged: (value) => setState(() {
                      numbers = value!;
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Include special chars:", style: Styles.kTitle),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: specialChars,
                    onChanged: (value) => setState(() {
                      specialChars = value!;
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(
                  text: "Generate Password",
                  onPressed: () {
                    setState(() {
                      _passwordController.text = randomPassword(
                        chars: true,
                        numbers: numbers,
                        specialChars: specialChars,
                        length: charLength.toInt(),
                        upperCase: upperCase,
                      );
                    });
                  }),
              const SizedBox(height: 20),
              CustomButton(
                text: "Copy Password",
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: _passwordController.text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
