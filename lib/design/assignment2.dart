import 'package:flutter/material.dart';

const Color bgColor = Color.fromARGB(255, 255, 255, 255);
const Color primaryColor = Color.fromARGB(255, 255, 169, 71);
const Color primaryColor2 = Color.fromRGBO(102, 5, 34, 1);
const Color primaryColor3 = Color.fromRGBO(163, 0, 0, 1);

class As2 extends StatelessWidget {
  const As2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const RandomDemo(),
    );
  }
}

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tourist Place',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 46, 112),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/clock-tower.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Chiang Rai Clock Tower',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chiang Rai Thailand',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 13,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '559',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 20,
                  ),
                  Text(
                    'CALL',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.directions,
                    color: Colors.blue,
                    size: 20,
                  ),
                  Text(
                    'ROUTE',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 20,
                  ),
                  Text(
                    'SHARE',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do '
                    'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
                    'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure '
                    'dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
