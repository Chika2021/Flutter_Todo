class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({required this.id, required this.todoText, this.isDone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'Code Python', isDone: true),
      Todo(id: '02', todoText: 'Push my Code to GitHub', isDone: true),
      Todo(id: '03', todoText: 'Check My Emails'),
      Todo(id: '04', todoText: 'Work in My Flutter App'),
      Todo(id: '06', todoText: 'Dinner With Favour'),
      Todo(id: '07', todoText: 'Work on My JavaScript Project'),
    ];
  }
}
