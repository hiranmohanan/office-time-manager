import 'package:flutter/material.dart';
import 'package:flutter_office_time/constants/app%20Strings/appstrings.dart';
import 'package:flutter_office_time/constants/sizer/sizer_data.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kSsignup,
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
                kSsignup,
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
                  onPressed: () {},
                  child: Text(
                    kSsignup,
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
                        kSAlreadyHaveAnAccount,
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
