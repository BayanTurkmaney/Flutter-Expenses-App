import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Color.fromRGBO(255, 195, 0, 0.9),
      Color.fromRGBO(255, 88, 51, 0.9),
      Color.fromRGBO(199, 0, 56, 0.9),
      Color.fromRGBO(144, 12, 63, 0.9),
      Color.fromRGBO(87, 24, 69, 0.9),
      // Colors.red,
      // Colors.black,
      // Colors.blue,
      // Colors.purple
    ];
    _bgColor = availableColors[Random().nextInt(5)];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${widget.transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.deleteTx(widget.transactions.id),
                icon: Icon(Icons.delete),
                label: Text('delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transactions.id),
              ),
      ),
    );
  }
}
