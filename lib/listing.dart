// import 'package:ercall/detailscreen.dart';
// import 'package:flutter/material.dart';
// import 'calllist.dart' ;
// import 'emergmodel.dart';


// class ListViewPage extends StatefulWidget {
//   const ListViewPage({super.key});

//   @override
//   State<ListViewPage> createState() => _ListViewPageState();
// }

// class _ListViewPageState extends State<ListViewPage> {

  
  
//   final List<emergencyModel> emergdata = List.generate(item.items.emerg.length,
//     (index) =>emergencyModel(first.location , item.location[index], item.distance[index], item.time[index]));
//   // 있던 데이터들을 문장으로 만드는 코드
//   @override
//   Widget build(BuildContext context) {
//   //  double  width = MediaQuery.of(context).size.width *0.6;
//     return Container(       
//       height: 500.0, 
    
//       child: ListView.builder(
//         itemCount: time.length,   //다 개수가 똑같이 들어갈테니까 time배열의 개수로 item의 갯수를 설정했을 뿐이다.
//         itemBuilder: (context, index){
//           return GestureDetector(
//             onTap:(){
//               //showPopup(context, emerg[index], location[index], time[index]);
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => detailscreen(model: emergdata[index] ,) ));
//             },
//             child: Card(
//               child: Row(
//                 children: [
//                 const SizedBox(
//                   width: 174,
//                 ),
//                 Container(
//                   width:100.0,
//                   height: 50.0,
//                   child : Image.asset(emerg[index],
//                   height: 40,
//                   width: 100,
//                   fit: BoxFit.fill,
//                   ),
              
//                 ),
                
//                 const SizedBox(
//                   height: 30,
//                   width: 200,
//                 ),
//                 Column(
//               children:[
//                 Row(
//                     children:[
//                       SizedBox(
//                         height: 40,
//                         width:400,
//                       child: 
//                       Text(location[index],
//                       style: const TextStyle(
//                         fontSize: 22.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       ),
//                       ),  
//                     ],
//                     ),
//                   SizedBox(
//                       height: 20,
//                       child:
//                       Text(distance[index],
//                       style: const TextStyle(
//                         fontSize: 16,
//                       ) ,
//                       ),
//                   )
//               ],
//                 ),
//                  const SizedBox(
//                     width: 400.0,
//                   ),  
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
                
//                  children:[ SizedBox(
                 
//                   width: 150.0,
//                   child: Text(time[index],
//                   style: const TextStyle(
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   ),
//                 ),
//                  ],    
//                 ),
//               ],
//               ),
//             ),
//           );
//         },
//         ),
//     );
//   }
// }