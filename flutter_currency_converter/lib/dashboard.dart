import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_converter/currencyService.dart';
import 'package:flutter_currency_converter/currency_list.dart';
import 'package:flutter_currency_converter/red_input.dart';
import 'package:flutter_currency_converter/white_input.dart';

class Dashboard extends StatefulWidget {
  final currencyVal;
  final dynamic currencyone;
  final convertedCurrency;
  final currencyTwo;
  final isWhite;

  const Dashboard(
      {Key key,
      this.convertedCurrency,
      this.currencyVal,
      this.currencyone,
      this.currencyTwo,
      this.isWhite})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          // SizedBox(height: 15),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFEC5759),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      CurrencyList()));
                        },
                        child: Text(
                          CurrencyService()
                              .getCurrencyString(widget.currencyone),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          widget.currencyVal.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 122,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      InputRedPage(
                                        ogignCurrency: widget.currencyone,
                                        convCurrency: widget.currencyTwo,
                                      )));
                        },
                        child: Text(
                          (widget.currencyone),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 4 - 30,
                      ),
                      Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFEC5759),
                                style: BorderStyle.solid,
                                width: 5),
                            borderRadius: BorderRadius.circular(62),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //     builder: (BuildContext context) => InputWhitePage(
                            //           ogignCurrency: widget.currencyone,
                            //           convCurrency: widget.currencyTwo,
                            //         )));
                          },
                          child: Center(
                              child: widget.isWhite
                                  ? Icon(
                                      Icons.arrow_upward,
                                      size: 60,
                                      color: Color(0xFFEC5759),
                                    )
                                  : Icon(
                                      Icons.arrow_downward,
                                      size: 60,
                                      color: Color(0xFFEC5759),
                                    )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      InputWhitePage(
                                        ogignCurrency: widget.currencyone,
                                        convCurrency: widget.currencyTwo,
                                      )));
                        },
                        child: Text(
                          (widget.currencyTwo),
                          style: TextStyle(
                              color: Color(0xFFEC5759),
                              fontSize: 22,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Text(
                          widget.convertedCurrency.toString(),
                          style: TextStyle(
                              color: Color(0xFFEC5759),
                              fontSize: 122,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      CurrencyList()));
                        },
                        child: Text(
                          CurrencyService().getCurrencyString(widget.currencyone),
                          style: TextStyle(
                              color: Color(0xFFEC5759),
                              fontSize: 20,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
