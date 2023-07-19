import 'package:flutter/material.dart';
import 'emergmodel.dart';
import 'sorting.dart';
// ignore: camel_case_types
class detailscreen extends StatelessWidget {
  const detailscreen({super.key, required this.model});
  final emergencyModel model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar( //여기에 버튼 만들어서 뒤로 가게 만들어야한다.
          backgroundColor: Colors.black,
          title: const Text('상세 화면',
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
        body : Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 400.0,
                  height: 60,
                ),
                Image.asset(model.emerg.toString(),
                height: 40.0,
                width: 250,
                ),
                Column(
                  children: [
                    Text(
                      model.location.toString(),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Row(
                    children:[
                     const  SizedBox(
                        width:100,
                      ),
                 SizedBox(
                  width: 200,
                  child: Text(model.distance.toString(),
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                  ),
                ),
                
                    ],
                  ),
                    ],
                ),
                const  SizedBox(
                  width: 200,
                 
                ),
                
                ElevatedButton(
                    style: ButtonStyle(
                     fixedSize: MaterialStateProperty.all<Size>(Size(140, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => sorting() ),);
                  },
                   child: 
                    Text('경로확인',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                    ),
                   ),
              ],
            ),
            Row(
              children: [

                SizedBox(
                  width: 600,
                ),
                ElevatedButton(
                      style: ButtonStyle(
                     fixedSize: MaterialStateProperty.all<Size>(Size(140, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  onPressed: (){},//수락했을 때의 기능을 넣어주면 된다
                   child: 
                   const Text('수락'),
                   ),
                   SizedBox(
                    width: 150,
                   ),
              ElevatedButton(
                 style: ButtonStyle(
                     fixedSize: MaterialStateProperty.all<Size>(Size(140, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                onPressed: (){},
                 child: 
                 const Text('거절'),
                 ),
              ],
            ),
          Image.asset('assets/images/sort.png',
           width: 1600,
           height: 700,
           fit: BoxFit.contain,),
          
          
          ],


        ) 

    );
  }
}
