import 'package:flutter/material.dart';
import 'CryptoData.dart';

class CryptoList extends StatelessWidget{

  List<CryptoData> data = [
    CryptoData(name: 'Bitcoin', symbol: 'BTC', rank: 1, price: 12000.0),
    CryptoData(name: 'Etherium', symbol: 'ETH', rank: 2, price: 200.0)
  ];

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
    );
  }
  List<Widget> _buildList(){
    return data.map((CryptoData f) => ListTile(
      title: Text(f.name),
      subtitle: Text(f.symbol),
      leading: CircleAvatar(
        child: Text(f.rank.toString())),
      trailing: Text('\$${f.price.toString()}'),
    )).toList();
  }
}

