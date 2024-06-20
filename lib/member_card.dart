import 'package:flutter/material.dart';
import 'member.dart';
import 'chores_provider.dart';

class MemberCard extends StatefulWidget {
  final Member member;

  MemberCard({required this.member});

  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  String? _selectedChore;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.member.name; // Initialize with current name
  }

  void _updateName(String newName) {
    setState(() {
      widget.member.name = newName; // Update the member name in the widget's state
      _nameController.text = newName; // Optionally update the controller if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Colors.blueAccent),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    onSubmitted: _updateName, // Correctly referenced here
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.assignment, color: Colors.blueAccent),
                SizedBox(width: 8),
                DropdownButton<String>(
                  hint: Text('Assign Chore'),
                  value: _selectedChore,
                  items: ['Dishes', 'Laundry', 'Cleaning'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedChore = newValue;
                    });
                    ChoresProvider().assignChoreToMember(widget.member.name, newValue!);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ChoresProvider().saveChore(widget.member.name);
                setState(() {}); // Force UI refresh
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
              ),
              child: Text('Save Chore', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            Text(
              'Saved Chores: ${widget.member.savedChores.join(', ')}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ChoresProvider().clearAllSavedChores();
                setState(() {}); // Force UI refresh
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              child: Text('Clear All Chores', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
