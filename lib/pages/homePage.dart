import 'package:flutter/material.dart';
import 'package:monday_flutter/components/todoItem.dart';
import 'package:monday_flutter/constrants/colors.dart';
import '../models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = Todo.todoList();
  final _todoController = TextEditingController();

  List<Todo> _foundTodo = [];

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  Widget build(BuildContext context) {
    void _handleTodoChange(Todo todo) {
      setState(() {
        todo.isDone = !todo.isDone;
      });
    }

    void _runFilter(String enteredKeyword) {
      List<Todo> results = [];
      if (enteredKeyword.isEmpty) {
        results = todoList;
      } else {
        results = todoList
            .where((item) => item.todoText!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      setState(() {
        _foundTodo = results;
      });
    }

    void _handleDelete(String id) {
      setState(() {
        todoList.removeWhere((item) => item.id == id);
      });
    }

    void _addToDoitem(String toDo) {
      setState(() {
        todoList.add(Todo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: toDo));
      });

      _todoController.clear();
    }

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
          backgroundColor: tdBGColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: tdBlack,
              ),
              Container(
                height: 40,
                width: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('images/chika.png')),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _searchBox(),
                Expanded(
                  child: ListView(children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30),
                      ),
                    ),

                    // for (Todo todoo in todoList)
                    for (Todo todoo in _foundTodo.reversed)
                      TodoItem(
                        todo: todoo,
                        onTodoChanged: _handleTodoChange,
                        onDeleteItem: _handleDelete,
                      ),
                  ]),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintText: 'Add A New Todo', border: InputBorder.none),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          _addToDoitem(_todoController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tdBlue,
                            minimumSize: const Size(60, 60),
                            elevation: 10),
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40),
                        )),
                  )
                ],
              ))
        ],
      ),
    );

    
  }



}

  Widget _searchBox() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: const TextField(
      // onChanged: (value) => _runFilter,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey)),
    ),
  );
}

