import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_converter/dashboard.dart';

class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC5759),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFEC5759),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          getListItem("Russian Ruble", "RUB"),
          getListItem("Indian Rupee", "INR"),
          getListItem("Japanese", "JYP"),
          getListItem("Pound Sterling", "GBP"),
        ],
      ),
    );
  }

  Widget getListItem(String currencyName, String currency) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => Dashboard(
                  currencyVal: 0.0,
                  convertedCurrency: 0.0,
                  currencyone: currency,
                  isWhite: false,
                  currencyTwo: 'RUB',
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Text(
          currencyName,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Quicksand'),
        ),
      ),
    );
  }
}
