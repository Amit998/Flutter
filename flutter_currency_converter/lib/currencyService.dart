import 'package:flutter/material.dart';
import 'package:flutter_currency_converter/dashboard.dart';

class CurrencyService {
  getCurrencyString(currency) {
    if (currency == 'USD') return ' United States Dallar';
    if (currency == 'RUB') return ' Russian Ruble';
  }

  convertCurrency(String fromCurrency, String toCurrency, int amout, context) {
    if (fromCurrency == 'USD') {
      switch (toCurrency) {
        case 'RUB':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Dashboard(
                  currencyone: fromCurrency,
                  currencyTwo: toCurrency,
                  isWhite: false,
                  currencyVal: amout,
                  convertedCurrency: (amout * 65))));
      }
    }
    if (fromCurrency == 'RUB') {
      switch (toCurrency) {
        case 'RUB':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Dashboard(
                  currencyone: fromCurrency,
                  currencyTwo: toCurrency,
                  isWhite: false,
                  currencyVal: amout,
                  convertedCurrency: (amout * 65))));
      }
    }
  }
}
