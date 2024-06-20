class Member {
  String name;
  List<String> chores = [];
  List<String> savedChores = [];

  Member({required this.name});

  void assignChore(String chore) {
    chores.add(chore);
  }

  void saveChores() {
    savedChores.addAll(chores);
    chores = []; // Clear chores after saving
  }

  void clearSavedChores() {
    savedChores.clear();
  }
}
