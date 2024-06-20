import 'member.dart';

class ChoresProvider {
  static final ChoresProvider _instance = ChoresProvider._internal();
  factory ChoresProvider() => _instance;
  ChoresProvider._internal();

  final List<Member> _members = [
    Member(name: 'Sister 1'),
    Member(name: 'Sister 2'),
    Member(name: 'Brother'),
  ];

  List<Member> get members => _members;

  void assignChoreToMember(String memberName, String chore) {
    final member = _members.firstWhere((m) => m.name == memberName);
    member.assignChore(chore);
  }

  void saveChore(String memberName) {
    final member = _members.firstWhere((m) => m.name == memberName);
    member.saveChores(); // This will save the chores to savedChores
  }

  void clearAllSavedChores() {
    for (final member in _members) {
      member.clearSavedChores();
    }
  }
}
