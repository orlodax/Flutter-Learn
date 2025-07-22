class TodoItem {
  String taskName;
  bool isCompleted;

  TodoItem({required this.taskName, required this.isCompleted});

  // Convert to Map for Hive storage
  Map<String, dynamic> toMap() {
    return {'taskName': taskName, 'isCompleted': isCompleted};
  }

  // Create from Map when loading from Hive
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(taskName: map['taskName'], isCompleted: map['isCompleted']);
  }
}
