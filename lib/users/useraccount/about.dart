import 'package:firstproject/users/useraccount/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            
          centerTitle: true,
          elevation: 0,
          title: Text(
            'About',
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
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 224, 224),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 9,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 224, 222, 222),
                      backgroundImage: AssetImage('assets/Scafe_Logo-removebg-preview.png'),
                      radius: 80,
                      
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: ' S',
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 142, 221),
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' CAFE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),

                        
                        Text(
                          'S H O E S    W O R L D',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 5, 185),
                          ),
                        ),
                        Text('      VERSION  :  1.0.0',style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Title(
                        color: Color.fromARGB(255, 0, 0, 0),
                        child: Text(
                          'Wherever you go we are there',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '''"SCAFE" is a Flutter-based mobile application designed to streamline the shoes delivery experience, similar to popular platforms like flipkart. The key feature that sets SCAFE apart is its reliance on a local database, specifically Hive, to manage and store shoes-related data. This ensures efficient data retrieval and storage, contributing to a seamless user experience''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text('Extensive Key Features',style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),)),
                         SizedBox(
                      height: 15,
                    ),
                    Text('''SCAFE utilizes Hive, a lightweight and efficient NoSQL database for Flutter, to manage and store various aspects of the application's data. This includes information about shoes items, categories, and user preferences. The local database enhances speed and responsiveness.
Users can explore a diverse range of shoes categorized based on different criteria such as style, comfortable preferences, and popularity. The application provides an intuitive interface for users to browse through available options.
Category-Based Organization: SCAFE categorizes shoes to simplify the browsing process. Users can easily navigate through categories like mens, womens, and kids. This organized approach enhances user experience and helps users quickly find what they are looking for.
User-Friendly Interface: The application boasts a user-friendly interface, ensuring a smooth and enjoyable user experience. Intuitive navigation, visually appealing design, and interactive elements contribute to the overall usability of the application.
SCAFE allows users to place shoes orders directly through the app. Users can select their desired items, customize orders, and proceed with secure and convenient online payment options.
 ''')
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}