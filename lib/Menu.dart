
import 'package:flutter/material.dart';
import 'AddFood.dart';
import 'Classes/Food.dart';
import 'FoodPage.dart';

class FoodMenu extends StatefulWidget {

  List<Food> foods = [];

  FoodMenu(this.foods);

  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {

  bool isInteger(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = int.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  String _inputName='', _inputDescription='',
      _inputPrice='', _inputDiscount='0', _inputPath='';
  bool _inputSizing=false,_inputAvailable=false,_inputIsDiscount=false;
  TypeFood _inputTypeFood ;
  List<String> foodType = [];
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Widget showFood(index){
      return Container(
        padding: const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            color: Colors.amber,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/3,
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/'+(index+1).toString()+".jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("   " + widget.foods[index].getName()),
                Spacer(),
                IconButton(
                    icon: Icon(
                      widget.foods[index].getAvailable()?Icons.check_circle_rounded:Icons.circle,
                      color: widget.foods[index].getAvailable()?Colors.greenAccent:Colors.redAccent,
                    ),
                    onPressed: (){
                      widget.foods[index].setAvailable(!widget.foods[index].getAvailable());
                      setState(() {});
                    }
                ),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      widget.foods.removeAt(index);
                      setState(() {});
                    }
                )
              ],
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(widget.foods, index),),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Page"),
      ),

      body: Container(
          child: ListView(
            children: List.generate(widget.foods.length, (index) => showFood(index)),
          )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFood(widget.foods)));
          // showModalBottomSheet<dynamic>(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) => Container(
          //     height: double.maxFinite,
          //     child: SingleChildScrollView(
          //       child: Container(
          //         child: Column(
          //           children: [
          //             Container(
          //               padding: EdgeInsets.only(top: 40, left: 10),
          //               color: Colors.blue,
          //               height: 90,
          //               width: double.infinity,
          //               child: Text("add one Food",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold
          //                 ),
          //               ),
          //             ),
          //             Form(
          //               key: _formKey,
          //               child: Container(
          //                 padding: EdgeInsets.all(40),
          //                 child: Column(
          //                   children: [
          //                     TextFormField(///Food Name
          //                       validator: (String value){
          //                         if(value.isEmpty){
          //                           return "Name cannot be empty";
          //                         }
          //                         return null;
          //                       },
          //                       onSaved: (String value) => _inputName = value,
          //                       decoration: InputDecoration(
          //                           icon: Icon(Icons.drive_file_rename_outline),
          //                           labelText: "Food Name",
          //                           labelStyle: TextStyle(fontSize: 18,)
          //                       ),
          //                     ),
          //                     TextFormField(///Food Description
          //                       maxLines: 2,
          //                       onSaved: (String value) => _inputDescription = value,
          //                       decoration: InputDecoration(
          //                           icon: Icon(Icons.drive_file_rename_outline),
          //                           labelText: "Description (optional)",
          //                           labelStyle: TextStyle(fontSize: 18,)
          //                       ),
          //                     ),
          //                     TextFormField(///Food Price
          //                       validator: (String value){
          //                         if(value.isEmpty){
          //                           return "Price cannot be empty";
          //                         } else if(!isInteger(value)){
          //                           return "Price is number";
          //                         }
          //                         return null;
          //                       },
          //                       onSaved: (String value) => _inputPrice = value,
          //                       decoration: InputDecoration(
          //                           icon: Icon(Icons.monetization_on_outlined),
          //                           labelText: "Food Price",
          //                           labelStyle: TextStyle(fontSize: 18,)
          //                       ),
          //                     ),
          //                     SizedBox(height: 20,),
          //                     Row(
          //                       children: [
          //                         Text("Do you have any discount?"),
          //                         IconButton(
          //                             icon: Icon(
          //                               _inputIsDiscount?Icons.check_circle_rounded:Icons.circle,
          //                               color: _inputIsDiscount?Colors.greenAccent:Colors.redAccent,
          //                             ),
          //                             onPressed: (){
          //                               _inputIsDiscount = !_inputIsDiscount;
          //                               setState(() {});
          //                             }
          //                         ),
          //                       ],
          //                     ),
          //                     _inputIsDiscount? TextFormField(///Food Discount
          //                       validator: (String value){
          //                         if(value.isEmpty){
          //                           return "Discount cannot be empty";
          //                         } else if(!isInteger(value) ||
          //                             int.parse(value)<0 ||
          //                             int.parse(value)>100){
          //                           return "Discount is integer between 0 to 100";
          //                         }
          //                         return null;
          //                       },
          //                       onSaved: (String value) => _inputDiscount = value,
          //                       decoration: InputDecoration(
          //                           icon: Icon(Icons.card_giftcard),
          //                           labelText: "Discount Percent",
          //                           labelStyle: TextStyle(fontSize: 18,)
          //                       ),
          //                     ):Container(),
          //
          //                     SizedBox(height: 30,),
          //
          //                     ElevatedButton(
          //                       onPressed: () {
          //                         if(_formKey.currentState.validate()){
          //                           _formKey.currentState.save();
          //                           print(_inputName);
          //                           print(_inputDescription);
          //                           print(_inputPrice);
          //                           print(_inputDiscount);
          //                           widget.foods.add(Food(
          //                               _inputName,
          //                               _inputDescription,
          //                               int.parse(_inputPrice),
          //                               int.parse(_inputDiscount),
          //                               true,
          //                               true,
          //                               TypeFood.Appetizer,
          //                               _inputPath
          //                           ));
          //                           Navigator.pop(context);
          //                         }
          //                         setState(() {});
          //                       },
          //                       child: Text("Add Food"),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   )
          // );  //showModalBottomSheet
        },
      ),
    );
  }
}
