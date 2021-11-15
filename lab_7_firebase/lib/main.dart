import 'package:flutter/material.dart';
import 'grade.dart';
import 'package:firebase_core/firebase_core.dart';
import'package:cloud_firestore/cloud_firestore.dart';

void main()async

 {
  
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
	        '/gradeform': (context) => addgrades(),
	      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final grade_data = FirebaseFirestore.instance.collection("grades");
          int? _selectedindex;
  var id;

    
  @override
  void initState() {
    super.initState();
    

    
  }

  updategrades(){
    return grade_data .doc(id).update({'grade':'A'});

  }
deletegrades(){
 return grade_data.doc(id).delete();
}
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("List grades"),
      actions: [
      IconButton(onPressed:(){
       
      updategrades();

        
      
      }, icon: Icon(Icons.edit,color: Colors.white), ),
      IconButton(onPressed: (){
        deletegrades();
       
      }, icon: Icon(Icons.delete,color: Colors.white) ),
            
            
           

      ],    

      ),
      body:Center(
        child:
      StreamBuilder(
      
       stream: grade_data.snapshots(),
       builder: 
       (BuildContext context,AsyncSnapshot snapshot){
         if(!snapshot.hasData)
         {
           return CircularProgressIndicator();
         }
         


         return ListView.builder(
          
          //snapshot-> gets most recent data
          itemCount: snapshot.data.docs.length,
          itemBuilder:
       (BuildContext context, int index){
//this returns a collection reference
         var document_data = snapshot.data.docs[index].data();
        
       
    
      return
           
    GestureDetector(
      
                onTap: (){
         setState(() {
            _selectedindex = index;
           id = snapshot.data.docs[index].id;
            
        
         });
        
        
       },   
       
        child:
        Container(
          decoration: BoxDecoration(
            color:_selectedindex==index?Colors.blue:null

          ),
        child:
         ListTile(
           
          
        
        title: Text(document_data['sid']
          
        ),
        
        subtitle: Text(document_data["grade"]),
      

        
        ),
       
        )
        
        
        );
 
        } );
      
      
       
       
      
        
       }

       
         
         
         
         
         ) 
         
         
         ,)
      
  
        
 


    ,
      
     
    
      
    floatingActionButton:FloatingActionButton(
         onPressed: () async {
	          Navigator.pushNamed(context, '/gradeform');
	        
            
	          
	        },

 child: Icon(Icons.add),


      ));
  
 }
  
}






	 