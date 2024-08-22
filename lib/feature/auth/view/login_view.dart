import 'package:flutter/material.dart';
import 'package:flutter_office_time/constants/app%20Strings/appstrings.dart';
import 'package:flutter_office_time/constants/sizer/sizer_data.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kSlogin,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox2,
              Text(
                kSWelcomeToTheApp,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              vSizedBox0,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: kSEmail,
                ),
              ),
              vSizedBox1,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: kSPassword,
                ),
              ),
              vSizedBox2,
              SizedBox(
                width: 90.w,
                height: vBox3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    kSlogin,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              vSizedBox2,
              RichText(
                  text: TextSpan(
                text: '$kSForgetpassword\n',
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  WidgetSpan(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        kSRegister,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
