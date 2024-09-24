import 'package:flutter/material.dart';

const Color bgColor = Color.fromARGB(255, 255, 255, 255);
const Color primaryColor = Color.fromARGB(255, 255, 169, 71);
const Color primaryColor2 = Color.fromRGBO(102, 5, 34, 1);
const Color primaryColor3 = Color.fromRGBO(163, 0, 0, 1);

class As1 extends StatelessWidget {
  const As1({super.key});

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
            'Cooking Recipes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Papaya Salad',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip '
                      'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate '
                      'velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 200,
                        child: Image.asset(
                          'assets/images/salad.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, size: 21, color: primaryColor),
                          Icon(Icons.star, size: 21, color: primaryColor),
                          Icon(Icons.star, size: 21, color: primaryColor),
                          Icon(Icons.star, size: 21, color: primaryColor),
                          const Icon(Icons.star, size: 21, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '3128 Reviews',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.timelapse,
                                size: 20,
                                color: primaryColor2,
                              ),
                              Text(
                                'PREP:',
                                style: TextStyle(
                                  color: primaryColor2,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                '5 mins',
                                style: TextStyle(
                                  color: primaryColor2,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 20,
                                color: primaryColor3,
                              ),
                              Text(
                                'COOK:',
                                style: TextStyle(
                                  color: primaryColor3,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                '10 mins',
                                style: TextStyle(
                                  color: primaryColor3,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              const Icon(
                                Icons.restaurant,
                                size: 20,
                                color: Colors.black,
                              ),
                              const Text(
                                'FEEDS:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              const Text(
                                '1-3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
