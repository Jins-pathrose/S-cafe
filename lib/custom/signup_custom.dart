import 'package:flutter/material.dart';

class SignupName extends StatefulWidget {
  const SignupName({super.key, required TextEditingController namecontroller});

  @override
  State<SignupName> createState() => _SignupNameState();
}

class _SignupNameState extends State<SignupName> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String nameRegex = r'^[a-zA-Z ]+$';
        RegExp regex = RegExp(nameRegex);
        if (value == null || value.isEmpty || !regex.hasMatch(value)) {
          return 'Enter a valid name';
        }
        return null;
      },
      controller: _nameController,
      decoration: InputDecoration(
          hintText: 'Name',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}

class SignupPhone extends StatefulWidget {
  const SignupPhone(
      {super.key, required TextEditingController phoneController});

  @override
  State<SignupPhone> createState() => _SignupPhoneState();
}

class _SignupPhoneState extends State<SignupPhone> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String phoneRegex = r'^[0-9]{10}$';
        RegExp regex = RegExp(phoneRegex);
        if (value == null || value.isEmpty || !regex.hasMatch(value)) {
          return 'Enter a valid 10-digit phone number';
        }
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
          hintText: 'Phone',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}

class SignupEmail extends StatefulWidget {
  const SignupEmail(
      {super.key, required TextEditingController emailController});

  @override
  State<SignupEmail> createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
        RegExp regex = RegExp(emailRegex);
        if (value == null || value.isEmpty || !regex.hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },
      controller: _emailController,
      decoration: InputDecoration(
          hintText: 'Email',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}

class SignupPassword extends StatefulWidget {
  const SignupPassword(
      {super.key, required TextEditingController passwordController});

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String passwordRegex =
            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,}$';

        RegExp regex = RegExp(passwordRegex);
        if (value == null || value.isEmpty || !regex.hasMatch(value)) {
          return 'Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
        }
        return null;
      },
      controller: _passwordController,
      decoration: InputDecoration(
          hintText: 'Create Password',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}

class SignupConfirmPassword extends StatefulWidget {
  const SignupConfirmPassword(
      {super.key, required TextEditingController confirmPasswordController});

  @override
  State<SignupConfirmPassword> createState() => _SignupConfirmPasswordState();
}

class _SignupConfirmPasswordState extends State<SignupConfirmPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      controller: _confirmPasswordController,
      decoration: InputDecoration(
          hintText: 'Conform Password',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}
