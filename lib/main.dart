import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

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
          color: kBackgroundPrimaryDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userMessage,
              searchBar,
              balance,
              cardsHeader,
              individualPaymentCard,
            ],
          ),
        ),
      ),
      theme: _buildAppTheme(),
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
                style: TextStyle(
                  color: kTextColorSecondaryDark,
                ),
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
      Icon(Icons.notifications, color: kTextColorPrimaryDark),
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
          borderSide: const BorderSide(
            width: 0.8,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(width: 2.0, color: kBackgroundSecondaryDark),
      ),
      hintText: 'Transactions, services or contracts',
      hintStyle: TextStyle(
        color: kTextColorSecondaryDark,
      ),
      fillColor: kBackgroundSecondaryDark,
      filled: true,
      prefixIcon: Icon(
        Icons.search,
        size: 30.0,
        color: kTextColorSecondaryDark,
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
                style: TextStyle(
                  color: kTextColorSecondaryDark,
                ),
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
            width: 72.0,
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  kButtonGradientTopDark,
                  kButtonGradientBottomDark,
                ],
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 70.0,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: kBackgroundSecondaryDark,
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

Widget individualPaymentCard = Container(
  padding: const EdgeInsets.all(18),
  height: 214,
  width: 340,
  decoration: BoxDecoration(
    color: kBackgroundSecondaryDark,
    borderRadius: BorderRadius.circular(20.0),
  ),
  child: Row(
    children: [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Card type',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Card number',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Valid Thru',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.payment,
              color: kTextColorPrimaryDark,
            ),
          ],
        ),
      ),
    ],
  ),
);

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _buildAppTextTheme(base.textTheme),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base.apply(
    displayColor: kTextColorPrimaryDark,
    bodyColor: kTextColorPrimaryDark,
  );
}
