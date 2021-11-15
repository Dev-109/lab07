import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import'package:cloud_firestore/cloud_firestore.dart';
class Grades{
 String? sid;
  String? grades;
  Grades(this.sid,this.grades);
}

class addgrades extends StatelessWidget {
  


   
	addgrades({Key? key}) : super(key: key);
	  TextEditingController _student_id = TextEditingController();
    	  TextEditingController _grades = TextEditingController();

	
	  @override
	  Widget build(BuildContext context) {
      //adding new users
      CollectionReference students= FirebaseFirestore.instance.collection('grades');
      

      Future<void> addstudent() {
      // Call the user's CollectionReference to add a new user
      return students
          .add({
            'grade': _grades.text, 
             'sid':_student_id.text , 
          })
          .then((value) => print("student Added"))
          .catchError((error) => print("Failed to add student: $error"));
    }





	    return Scaffold(
	      appBar: AppBar(
	        title: const Text("Add Grades"),
	        automaticallyImplyLeading: false,
	      ),
	      body: Column(
	        children: [
	          TextField(
	            controller: _student_id,
	            decoration: const InputDecoration(labelText: "SID:"),
	          ),
            TextField(
	           controller: _grades,
	            decoration: const InputDecoration(labelText: "Grade:"),
	          ),
           
	          ElevatedButton(
	              onPressed: () {
                 
	              
                  Navigator.pop(context,true);
                },
	            
	              child: const Text("close"))
	        ],
	      ),
		     floatingActionButton: FloatingActionButton(
         onPressed: () {
          
	         addstudent();
	        _student_id.clear();
          _grades.clear();
	        },

 child: Icon(Icons.save),
	    ));
      




      
	  }
	}
