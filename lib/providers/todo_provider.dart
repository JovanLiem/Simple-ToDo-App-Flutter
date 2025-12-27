import 'package:flutter/foundation.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _todoService = TodoService();

  List<Todo> _todos = [];
  String _filter = 'all';

  List<Todo> get todos => _todos;
  String get filter => _filter;

  List<Todo> get filteredTodos {
    switch (_filter) {
      case 'active':
        return _todos.where((t) => !t.isCompleted).toList();
      case 'completed':
        return _todos.where((t) => t.isCompleted).toList();
      default:
        return _todos;
    }
  }

  int get totalTodos => _todos.length;
  int get activeTodos => _todos.where((t) => !t.isCompleted).length;
  int get completedTodos => _todos.where((t) => t.isCompleted).length;

  /// FETCH dari backend
  Future<void> fetchTodos() async {
    _todos = await _todoService.getTodos();
    notifyListeners();
  }

  /// ADD
  Future<void> addTodo(String title, {DateTime? deadline}) async {
    if (title.trim().isEmpty) return;

    await _todoService.createTodo(title, deadline: deadline);
    await fetchTodos(); // ⬅️ SATU-SATUNYA refresh
  }

  /// TOGGLE
  Future<void> toggleTodo(int id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index == -1) return;

    final updated = await _todoService.toggleTodo(id);
    _todos[index] = updated;
    notifyListeners();
  }

  /// DELETE
  Future<void> deleteTodo(int id) async {
    await _todoService.deleteTodo(id);
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  void clearTodos() {
    _todos.clear();
    notifyListeners();
  }
}
