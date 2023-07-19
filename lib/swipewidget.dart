// import 'package:flutter/material.dart';

// //swipe기능을 가능하게 해주는 건데 어떻게 변형해서 수락거절하게할지 몰라서 두었다.





// class SwipeWidget extends StatefulWidget {
//   final List<String> items; // 항목 리스트를 받아오기 위한 매개변수

//   SwipeWidget({required this.items});

//   @override
//   _SwipeWidgetState createState() => _SwipeWidgetState();
// }

// class _SwipeWidgetState extends State<SwipeWidget> {
//   int _currentIndex = 0;
//   // ignore: unused_field
//   static const double _swipeThreshold = 100; // 스와이프 동작을 감지하기 위한 거리 임계값

//   void _handleReject() {
//     setState(() {
//       if (_currentIndex < widget.items.length - 1) {
//         _currentIndex++;
//       }
//     });
//   }

//   void _handleAccept() {
//     setState(() {
//       if (_currentIndex < widget.items.length - 1) {
//         _currentIndex++;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxHeight: 500),
//       child: Stack(
//         children: [
//           // 거절
//           Positioned(
//             left: 0,
//             top: 0,
//             bottom: 0,
//             width: MediaQuery.of(context).size.width / 2,
//             child: GestureDetector(
//               onTap: _handleReject,
//               child: Container(
//                 color: Colors.red,
//                 child: Center(
//                   child: Icon(
//                     Icons.thumb_down,
//                     color: Colors.white,
//                     size: 48,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // 수락
//           Positioned(
//             right: 0,
//             top: 0,
//             bottom: 0,
//             width: MediaQuery.of(context).size.width / 2,
//             child: GestureDetector(
//               onTap: _handleAccept,
//               child: Container(
//                 color: Colors.green,
//                 child: Center(
//                   child: Icon(
//                     Icons.thumb_up,
//                     color: Colors.white,
//                     size: 48,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // 현재 항목
//           Positioned.fill(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.items[_currentIndex],
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
