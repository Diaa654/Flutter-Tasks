import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_profile_app/features/presentation/widgets/custom_text_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.blue.shade100.withOpacity(.4),
              child: Padding(
                padding: const EdgeInsets.all(
                  22.0,
                ), // كل ما زاد الرقم ده، الصورة هتصغر أكتر جوه الدائرة
                child: Image.asset(
                  "assets/images/image6.png",
                  fit: BoxFit.contain, // بيخلي الصورة تظهر كاملة بدون قص
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Welcome to Flutter"),
            const SizedBox(height: 20),
            const Icon(Icons.star, color: Colors.yellow, size: 80),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: emailController,
                    hint: "Email",
                  ),

                  const SizedBox(height: 15),

                  CustomTextField(
                    textEditingController: passwordController,
                    hint: "Password",
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            105,
                            196,
                            239,
                          ),
                        ),

                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("button pressed");
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
