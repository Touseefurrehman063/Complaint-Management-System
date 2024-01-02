import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTickets extends StatefulWidget {
  const AddTickets({super.key});

  @override
  State<AddTickets> createState() => _AddTicketsState();
}

class _AddTicketsState extends State<AddTickets> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('add Ticket'),
        ],
      ),
    );
  }
}
