// import 'package:flutter/material.dart';


// //밑의 것은 gpt가 짜준 부분 새로고침 기능이 제대로 수행되지 않으면 스크롤해서 새로고침되게끔 다시 짜볼 것
// class MyButton extends StatefulWidget { //모션은 새로고침인데 실제로 데이터를 안가져오는 듯 
//   const MyButton({super.key});

//   @override
//   _MyButtonState createState() => _MyButtonState();
// }

// class _MyButtonState extends State<MyButton> {
//   bool isLoading = false;


//   void fetchData() {
//     // 데이터를 가져오는 비동기 작업을 수행하는 함수
//     // 이 예제에서는 2초 후에 완료되었다고 가정합니다.
//     setState(() {
//       isLoading = true; // 데이터 로딩 시작
//     }
    
//     );

//     Future.delayed(Duration(seconds: 2), () {
//       // 데이터 로딩 완료 후 상태 업데이트
//       setState(() {
       
//         isLoading = false; // 데이터 로딩 완료
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: isLoading ? null : fetchData, // 버튼을 비활성화하는 조건 추가
//        style: ButtonStyle(
//         fixedSize: MaterialStateProperty.all<Size>(Size(56, 56)),
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.grey), // 버튼 배경색 변경
//         ),
//         //그냥 circularprogressindicator가 새로고침때 처럼 빙글빙글 도는 애네 그럼 이 버튼은 사실상 그냥 얘 때문에 이렇게 보일뿐이지 패치 x
//       child: isLoading ? CircularProgressIndicator() : Text(' 새로고침',
//       style: const TextStyle(
//         fontSize: 15.0,
//       ),
//       ),
//     );
//   }
// } //차라리 얘도 클래스가 아니라 하나의 버튼으로 그냥 넣어주면 작동할 것 같은데? 저기에 readjsondata만 넣어준다면? ㅇㅋ함 해보자