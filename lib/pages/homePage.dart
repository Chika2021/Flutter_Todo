import 'package:flutter/material.dart';
import 'package:monday_flutter/components/todoItem.dart';
import 'package:monday_flutter/constrants/colors.dart';
import '../models/todo.dart';

class HomePage extends StatefulWidget {
  

  const HomePage({super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    
  
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
      body: Container(
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                ),
                for (Todo todo in todoList) 
                TodoItem(todo: todo,)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _searchBox() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: TextField(
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
