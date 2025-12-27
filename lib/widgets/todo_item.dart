import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    // INI BARIS PALING PENTING!
    // Jika ada deadline, tampilkan deadline. Jika tidak, tampilkan tanggal pembuatan
    final displayDate = todo.deadline ?? todo.date;
    final dateFormat = _formatDate(displayDate);

    final isOverdue =
        todo.deadline != null &&
        !todo.isCompleted &&
        todo.deadline!.isBefore(DateTime.now());

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: todo.isCompleted
            ? Colors.green[50]
            : isOverdue
            ? Colors.red[50]
            : Colors.grey[50],
        border: Border.all(
          color: todo.isCompleted
              ? Colors.green[200]!
              : isOverdue
              ? Colors.red[200]!
              : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todo.isCompleted ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: todo.isCompleted ? Colors.green : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: todo.isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: todo.isCompleted
                        ? Colors.grey[600]
                        : Colors.grey[800],
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.event,
                      size: 12,
                      color: isOverdue
                          ? Colors.red[600]
                          : todo.deadline != null
                          ? Colors.orange[600]
                          : Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateFormat, // Ini akan menampilkan 28 Des jika deadline 28 Des
                      style: TextStyle(
                        fontSize: 12,
                        color: isOverdue
                            ? Colors.red[600]
                            : todo.deadline != null
                            ? Colors.orange[600]
                            : Colors.grey[500],
                        fontWeight: todo.deadline != null
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
            color: Colors.red[400],
            hoverColor: Colors.red[50],
          ),
        ],
      ),
    );
  }
}
