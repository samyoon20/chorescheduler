import 'package:flutter/material.dart';
import 'member_card.dart';
import 'chores_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to determine screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chores Assignment', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.history, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/history');
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(screenWidth > 600 ? 32 : 16), // Adjusted based on screen width
            child: Text(
              'Assign Chores',
              style: TextStyle(fontSize: screenWidth > 600 ? 24 : 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: MemberList()),
        ],
      ),
    );
  }
}

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final members = ChoresProvider().members;

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return MemberCard(member: members[index]);
      },
    );
  }
}
