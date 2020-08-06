import 'package:flutter/material.dart';
import 'CryptoData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CryptoListState();
  }
}

class CryptoListState extends State<CryptoList> {
  List<CryptoData> data = [];

  _loadCurrency() async {
    final response = await http.get('https://api.coincap.io/v2/assets?limit=10');
    if (response.statusCode == 200) {
      var allData = (json.decode(response.body) as Map)['data'];
      var dataList = List<CryptoData>();
      allData.forEach((val) {
        var record = CryptoData(
            name: val['name'],
            symbol: val['symbol'],
            price: double.parse(val['priceUsd']),
            rank: int.parse(val['rank']));
        dataList.add(record);
      });
      setState(() {
        data = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Курс криптовалют'),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadCurrency(),
      ),
    );
  }

  List<Widget> _buildList() {
    return data
        .map((CryptoData f) => ListTile(
              title: Text(f.name),
              subtitle: Text(f.symbol),
              leading: CircleAvatar(child: Text(f.rank.toString())),
              trailing: Text('\$${f.price.toStringAsFixed(2)}'),
            ))
        .toList();
  }

  @override
  void initState(){
    super.initState();
    _loadCurrency();
  }

}
