import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'transaction_widget.dart';
import 'models/transaction_repository.dart';
import 'package:personal_finance_tracking_ui/transaction_button.dart';

import 'colors.dart';
import 'models/card_model.dart' as paymentCardClass;
import 'models/cards_repository.dart';
import 'models/transaction_model.dart' as transactionModelClass;
import 'payment_card_widget.dart';

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
        extendBody: true,
        body: Container(
          color: kBackgroundPrimaryDark,
          child: ListView(
            children: [
              userMessage,
              searchBar,
              balance,
              cardsHeader,
              SizedBox(
                height: 230,
                child: _buildPaymentCardsListView(context),
              ),
              transactionButtons,
              recentActivityHeader,
              SizedBox(
                height: 180.0,
                width: 362,
                child: _buildTransactionsListView(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: kBackgroundSecondaryDarkTranslucent,
              selectedItemColor: kTextColorPrimaryDark,
              unselectedItemColor: kTextColorSecondaryDark,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/home_rounded.svg',
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/home_rounded.svg',
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset(
                        'assets/graph_rounded.svg',
                      ),
                    ),
                    activeIcon: SvgPicture.asset('assets/graph_rounded.svg'),
                    label: 'Graph'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/scan.svg',
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    activeIcon: SvgPicture.asset('assets/scan.svg'),
                    label: 'Scanner'),
                BottomNavigationBarItem(
                    icon: Opacity(
                        opacity: 0.5,
                        child: SvgPicture.asset('assets/messages.svg')),
                    activeIcon: SvgPicture.asset('assets/messages.svg'),
                    label: 'Messages'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/person.svg',
                        color: const Color.fromRGBO(255, 255, 255, 0.5)),
                    activeIcon: SvgPicture.asset('assets/person.svg'),
                    label: 'Contacts'),
              ],
            ),
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
                    fontSize: 15.0,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontFamily: 'GilroyEB',
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
          // This could be made into a separate widget to switch icon without red dot depending on state
          onTap: () {
            print("Notification icon pressed");
          },
          child: SvgPicture.asset('assets/notification.svg')),
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
          fontFamily: 'GilroyLight',
          fontWeight: FontWeight.bold),
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
                    fontSize: 15.0,
                    fontFamily: 'GilroyLight',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              '\$ 123 640.32',
              style: TextStyle(
                fontSize: 34.0,
                fontFamily: 'GilroyEB',
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
                fontFamily: 'GilroyEB',
                fontSize: 20.0,
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

ListView _buildPaymentCardsListView(BuildContext context) {
  final List<paymentCardClass.PaymentCard> cards =
      PaymentCardsRepository.loadPaymentCards();

  return ListView.builder(
    padding: const EdgeInsets.all(8),
    scrollDirection: Axis.horizontal,
    itemCount: cards.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: PaymentCardWidget(card: cards[index]),
      );
    },
  );
}

Widget transactionButtons = Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TransactionButton(
        buttonName: 'Send',
        icon: SvgPicture.asset('assets/toprightarrow.svg'),
      ),
      TransactionButton(
        buttonName: 'Receive',
        icon: SvgPicture.asset('assets/bottomleftarrow.svg'),
      ),
      TransactionButton(
          buttonName: 'Swap',
          icon: const Icon(
            Icons.swap_horiz,
            color: kTextColorPrimaryDark,
          )),
      TransactionButton(
          buttonName: 'More',
          icon: SvgPicture.asset('assets/fourroundedsquares.svg')),
    ],
  ),
);

Widget recentActivityHeader = Container(
  padding: const EdgeInsets.all(16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Recent activity',
        style: TextStyle(
          fontFamily: 'GilroyEB',
          fontSize: 20.0,
        ),
      ),
      const Text(
        'See all',
        style: TextStyle(
            color: kTextColorSecondaryDark,
            fontSize: 15.0,
            fontFamily: 'GilroyLight',
            fontWeight: FontWeight.bold),
      ),
    ],
  ),
);

ListView _buildTransactionsListView(BuildContext context) {
  final List<transactionModelClass.Transaction> transactions =
      TransactionsRepository.loadTransactions();

  return ListView.builder(
    padding: const EdgeInsets.all(8),
    scrollDirection: Axis.vertical,
    itemCount: transactions.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: TransactionWidget(transaction: transactions[index]),
      );
    },
  );
}

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
