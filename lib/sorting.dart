import 'package:flutter/material.dart';

class sorting extends StatelessWidget {
  const sorting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
    title: const Text('경로확인',
         
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          
            
        ),
        ),
        centerTitle:  true,
        elevation: 0.0,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context); //pop해서 뒤로 가는 형태가 아마 맞을거임 아니면 다시 경로설정해서 이동    
          },   
        ),
     ),
    body: 
    Row(
    children: [
      const SizedBox(
        width: 380,
      ),
      Column(
      children: [
        Image.asset('assets/images/map.png',
        width: 1000,
        height: 800,
         fit: BoxFit.fill,),
      ],
      ),
      ],
      ),
    );
}
}