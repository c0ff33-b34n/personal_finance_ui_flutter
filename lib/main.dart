import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              'Welcome Back!',
              style: TextStyle(
                fontSize: 20.0,
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
        icon: const Icon(
          Icons.arrow_circle_up_rounded,
          color: kTextColorPrimaryDark,
        ),
      ),
      TransactionButton(
          buttonName: 'Receive',
          icon: const Icon(
            Icons.arrow_circle_down_rounded,
            color: kTextColorPrimaryDark,
          )),
      TransactionButton(
          buttonName: 'Swap',
          icon: const Icon(
            Icons.swap_horiz,
            color: kTextColorPrimaryDark,
          )),
      TransactionButton(
          buttonName: 'More',
          icon: const Icon(
            Icons.more_horiz,
            color: kTextColorPrimaryDark,
          )),
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
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        'See all',
        style: TextStyle(
          color: kTextColorSecondaryDark,
        ),
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
