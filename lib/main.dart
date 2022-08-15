import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

@override
void dispose() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userMessage,
              searchBar,
              balance,
              cardsHeader,
            ],
          ),
        ),
      ),
    );
  }
}

Widget userMessage = Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Hello Martin,',
              ),
            ),
            const Text(
              'Welcome Back!,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Icon(Icons.notifications),
    ],
  ),
);

Widget searchBar = Container(
  padding: const EdgeInsets.all(16),
  child: TextField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0.8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(width: 0.8, color: Colors.black),
      ),
      hintText: 'Transactions, services or contracts',
      prefixIcon: Icon(
        Icons.search,
        size: 30.0,
      ),
    ),
  ),
);

Widget balance = Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Total Balance',
              ),
            ),
            const Text(
              '\$ 123 640.32',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget cardsHeader = Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cards',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 42.0,
            width: 62.0,
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black45,
                  Colors.black54,
                ],
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 60.0,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  ),
);
