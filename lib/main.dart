import 'package:flutter/material.dart';

import 'calllist.dart'; 

// ignore: prefer_const_constructors
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget { //병원 앱 기본의 변경없는 위젯으로 만듦
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'ERCALL' ,
        theme: ThemeData(
          primarySwatch:  Colors.red 
        ),
      home: const FirstPage(), 
    );
       }
}
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( //이게 발판이니까 이제 이안에다가 내용을 담는 것이지
    
      //appbar부분 혹시 appbar가 있는게 더 좋아보일 수 있어서 남겨둠
      /*appBar: AppBar( 
        // ignore: prefer_const_constructors
        title: Text('ERCALL'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 247, 102, 92),
        elevation: 0.0, 
        ),
*/  


      // ignore: prefer_const_constructors
        body: Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.fromLTRB(300.0, 0.0, 300.0, 0.0),
        // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
        child : Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
           Expanded(
            child: SingleChildScrollView( 
            child : Column (
              children : [
            Image.asset('assets/images/ercallimage3.png',
            width: 1200.0,
            height: 380.0,),
          // ignore: prefer_const_constructors
          Text('병원 식별 코드',style: TextStyle(
          color: Colors.black,
          letterSpacing: 2.0,
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
        ) 
        ,),
        // ignore: prefer_const_constructors
        SizedBox(height: 40.0,),
        // ignore: prefer_const_constructors
        TextField(), //text로 받은 데이터를 로그인할 때 사용할 수 있어야 함 
        //const Spacer(flex: 1,),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 100.0,
          width: 100.0,
        ),
        Row(
        children:[
          const SizedBox(
            height: 100.0,
            width: 400.0,
          ),          
        SizedBox(
          width: 300,
          height: 70,
          child:ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  calllist()),
            );
          },
          style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black),),
         // ignore: prefer_const_constructors
         child: Text('다음 페이지',
         // ignore: prefer_const_constructors
         style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          //backgroundColor: Colors.black,
         ),
         )
         ),
        ),
        ],
        ),
        ],
        ),
        ),
    ),
    ],
    ),
    ),
    );
  }
}