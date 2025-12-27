class Todo {
  final int id;
  final String title;
  final bool isCompleted;
  final DateTime date;
  final DateTime? deadline;
  final int userId;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.date,
    this.deadline,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] is int ? json['id'] : (json['id'] as num).toInt(),
      title: json['title'] ?? '',
      isCompleted: json['is_completed'] == true,
      date: DateTime.parse(json['date']),
      deadline: json['deadline'] != null && json['deadline'] != ''
          ? DateTime.parse(json['deadline'])
          : null,
      userId: json['user_id'] is int
          ? json['user_id']
          : (json['user_id'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'deadline': deadline?.toIso8601String()};
  }
}
