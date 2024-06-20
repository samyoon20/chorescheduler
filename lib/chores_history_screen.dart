import 'package:flutter/material.dart';
import 'chores_provider.dart';
import 'member.dart';

class ChoresHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Member> members = ChoresProvider().members;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chores History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Assigned Chores:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blueAccent),
                        title: Text(
                          member.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            member.savedChores.isNotEmpty
                                ? member.savedChores.join(', ')
                                : 'No chores saved',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
