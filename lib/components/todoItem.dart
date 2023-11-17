import 'package:flutter/material.dart';
import 'package:monday_flutter/constrants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box , color: tdBlue ,),
        title: Text('Check Mail' , style: TextStyle(fontSize: 16 , color: tdBlack, decoration: TextDecoration.lineThrough),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
            
          ),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.white, iconSize: 18,),
        ) ,
        
      ),
    );
  }
}