 import 'package:flutter/material.dart';

class Imagee extends ChangeNotifier {
  List<Imagee> list = [];

  final String large;
  final String medium;
  final String small;

  Imagee(this.large, this.medium, this.small);

  void addToList(List<Imagee> tempList) async {
    for (var element in tempList) {
      list.add(element);
      notifyListeners();
    }
  }

  factory Imagee.fromJson(Map<String, dynamic> resp) {
    return Imagee(
      resp['src']['large'],
      resp['src']['medium'],
      resp['src']['small'],
    );
    // return Imagee("large", 'medium', 'small');
  }
}
