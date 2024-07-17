import 'package:firstproject/users/useraccount/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Terms & condition',
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              )),
        backgroundColor: Color.fromRGBO(189, 108, 102, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Title(
                        color: Color.fromARGB(255, 0, 0, 0),
                        child: Text(
                          "S'CAFE - Terms and Conditions",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '''Welcome to S'CAFE , a shoes delivery application ("Application") designed to provide you with convenient access to a variety of popular shoes. Before using our services, please carefully read and understand the terms and conditions outlined below:

1. Acceptance of Terms

By accessing or using the SCAFE application, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not use our services.

2. Use of the Application

2.1. Eligibility: You must be at least 18 years old to use S'CAFE . By using the Application, you represent and warrant that you are at least 18 years of age.

2.2. Account: To use certain features of the Application, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.

2.3. Accuracy of Information: You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.

3. Services

3.1. Shoes Delivery: S'CAFE  facilitates the delivery of Shoes from all over.

3.2. Delivery Fees: All delivery is totally Free.

4. Payments

4.1. Payment Methods: S'CAFE accepts various payment methods. By providing a payment method, you represent and warrant that you are authorized to use the designated payment method.

4.2. Charges: You agree to pay all charges incurred on your account, including applicable taxes and fees.

5. User Conduct

You agree to use S'CAFE  for lawful purposes only. You must not engage in any prohibited activities, including but not limited to fraud, harassment, or the violation of any applicable laws.

6. Privacy Policy

Your use of the Application is also governed by our Privacy Policy. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information.

7. Termination

S'CAFE reserves the right to terminate or suspend your account and access to the Application at any time, without notice, for any reason.

8. Amendments

S'CAFE  may update or modify these Terms and Conditions from time to time. It is your responsibility to review these terms periodically. Continued use of the Application after any changes constitutes acceptance of the revised terms.

9. Contact Information

If you have any questions or concerns regarding these Terms and Conditions, please contact us at 9074267478.

By using S'CAFE , you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. Thank you for choosing S'CAFE  for your shoes delivery needs!
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}