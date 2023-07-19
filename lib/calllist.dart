import 'dart:convert';

import 'package:ercall/emergmodel.dart';
import 'package:ercall/main.dart';
import 'package:flutter/material.dart';
import 'detailscreen.dart';
import 'package:flutter/services.dart' as rootBundle;

// ignore: camel_case_types


  

// ignore: camel_case_types
class calllist extends StatefulWidget {
   calllist({super.key});

  @override
  State<calllist> createState() => _calllistState();
}

class _calllistState extends State<calllist> {
  

  Future <List<emergencyModel>>ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/json/model.json');
    //위의 코드로 jsondata에 경로에 있는 josn파일에 있는 것들을 넣어주는 것이고
    final list =  json.decode(jsondata) as List<dynamic>;
    //위의 코드로 리스트로 만들어서 넣어주는 역할을 하는 것이다.
    return list.map((e)=>emergencyModel.fromJson(e)).toList();
  
  } 
 //이 함수의 위치가 여기에 있는게 맞을지만 따져보자
void showPopup(context){
  showDialog(
  context: context,
   builder: (context){
    return Dialog(
      child : Container(
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.5,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),

            ElevatedButton(
              
              style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(Size(300, 100)),
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: (){},
              child: const Text('응급도 순 정렬',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
              ),
              ), 
               ),
           const SizedBox(
             height: 40,
           ),
           
           ElevatedButton(

            style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(Size(300, 100)),
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
              onPressed: (){},
              child: const Text('거리 순 정렬',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),  
              ),
          
          
          ],
        ),
      
      ),
      );
   },
  );

}

DateTime now = DateTime.now();

String datemaker (String datedata){
  DateTime changedata = DateTime.parse(datedata);
  var  minus = now.difference(changedata).inMinutes;
  int hours = (minus/60).toInt();
  var minutes =minus%60;
  
  return hours.toString()+'시간  '+ minutes.toString()+'분 전';
}



bool ascend = true;

String getButtonName() {
  return ascend ? '최신순' : '오래된순';
}

void toggleSortOrder() {
  setState(() {
    ascend = !ascend;
    // 여기에서 버튼의 이름을 업데이트
  });
}

  bool isLoading = false;


  void fetchData() {
    // 데이터를 가져오는 비동기 작업을 수행하는 함수
    setState(() {
      isLoading = true; // 데이터 로딩 시작
    }
    
    );
    //이 딜레잉 fetchdata 안에 있는거구나 
    Future.delayed(Duration(seconds: 2), () {
      // 데이터 로딩 완료 후 상태 업데이트
      setState(() {
        ReadJsonData();
        isLoading = false; // 데이터 로딩 완료
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    //  late int newcall ;
      
    //   int usedcall = 0; //완료  배차가 다 끝나면 늘어나게
    //   int catchcall = 0; //배정 수락하면 늘어나게 하고 
        return  Scaffold(
      
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        title: const Text('콜 리스트',
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.white,

        ),
         ),
         actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: (){
              showPopup(context);
              //여기에 정렬버튼 눌렀을 때의 효과들을 적용하면 된다.
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
           const UserAccountsDrawerHeader(
              accountName: Text('숭실대학교병원'), //이름이랑 이메일이 반드시 필요하다
              accountEmail: Text('soongsil.ac.kr'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/hospital.png'),
              backgroundColor: Colors.white,
              ),
            decoration : BoxDecoration(
                color : Colors.grey,
                 
            ),
            
            ),
            ElevatedButton(onPressed: (){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  FirstPage()),
            ); // 왜 들어가있는 정보가 없어서 pop으로 안되는 것일까?
            },
             child: const Text('로그아웃'),),
                 ],
        ),
      ),
    
      body:   FutureBuilder(
                future:  ReadJsonData(),
                builder:(context,data){
                  if (data.hasError){
                    return Center(
                      child: Text("${data.error}"));
                  }       
                  else if(data.hasData){
                    var items = data.data as List<emergencyModel>;
                    int newcall = items.length;
                    int usedcall = 0;
                    int catchcall = 0;
                     //얘의 길이를 위에서 쓰려면 어찌해야하지?
                     //이렇게 접근하는 거구나 그렇다면
                    //이렇게 하나씩 접근해줘야하는건가? 배열을 하나씩 더 만들어서 저장한 다음에 넘겨야하는건가?
                    //이 리스트로 만들어졌으니까 각각에 접근하는 방법을 이용하면 되지않을까?
                    return Padding(
        
        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
        child:Column( 
          
          children :[
            Stack(
            children:[
             Container( 
              color: Colors.black,
             height:200.0,
               width: 2000.0,
         
       ),
          Positioned(
            top: 130.0,
            left: 210.0,
            child:Container(
          color: Colors.black,
          height:120.0,
          width: 100.0,
          child:
            const Text('신규',
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
            ),
            ),
          )
           ),
           Positioned(
              top: 20.0,
              left: 220.0,
            child:Container(
              color:Colors.black,
              height: 100.0,
              width: 100.0,
              child: 
                
                Text ('$newcall', //얘도 가져온 데이터로 바뀌게 설정해야함.
                style: const TextStyle(
                fontSize: 90.0,
                color: Colors.white,
               ),
            ),
            ), 
            ),
            Positioned(
            top: 130.0,
            left: 1390.0,
            child:Container(
          color: Colors.black,
          height:120.0,
          width: 100.0,
          child:
            const Text('완료',
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
            ),
            ),
          )
           ),
           Positioned(
              top: 20.0,
              left:1400.0,
            child:Container(
              color:Colors.black,
              height: 100.0,
              width: 100.0,
              child: 
             
                Text ('$usedcall',
                style: const TextStyle(
                fontSize: 90.0,
                color: Colors.white,
               ),
            ),
            ), 
            ),
            Positioned(
            top: 130.0,
            left: 800.0,
            child:Container(
          color: Colors.black,
          height:120.0,
          width: 100.0,
          child:
            const Text('배차',
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
            ),
            ),
          )
           ),
           Positioned(
              top: 20.0,
              left: 810.0,
            child:Container(
              color:Colors.black,
              height: 100.0,
              width: 100.0,
              child: 
             
                Text ('$catchcall',
                style: const TextStyle(
                fontSize: 90.0,
                color: Colors.white,
               ),
            ),
            ), 
            ), 
          ], 
          ),
          Stack(
            children: [
              Container(
                color: Colors.grey,
                height: 30.0,
                width: 2000.0,

              ),
              Positioned(
                top: 0.0,
                left: 200.0,
                child:
                Container(
                  color:Colors.grey,
                  child: const Text('응급도',
                  style: TextStyle(
                    fontSize: 20.0,
                  )
                  ,
                  ),
                  ),
                  ),
                   Positioned(
                top: 0.0,
                left: 600.0,
                child:
                Container(
                  color:Colors.grey,
                  child: const Text('출발지',
                  style: TextStyle(
                    fontSize: 20.0,
                  )
                  ,
                  ),
                  ),
                  ),
                   Positioned(
                top: 0.0,
                left: 1300.0,
                child:
                Container(
                  color:Colors.grey,
                  child: const Text('대기시간',
                  style: TextStyle(
                    fontSize: 20.0,
                  )
                  ,
                  ),
                  ),
                  ),
            ],
          ), 
        Container(       
        height: 500.0, 

        child: ListView.builder(
        itemCount: items.length,   //다 개수가 똑같이 들어갈테니까 time배열의 개수로 item의 갯수를 설정했을 뿐이다.
        itemBuilder: (context, index){
          return GestureDetector(
            onTap:(){
              //showPopup(context, emerg[index], location[index], time[index]);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => detailscreen(model: items[index] ,) ));
            //모델로 이렇게 전달시켜준다.
            },
            child: Card(
              elevation: 5.0,
              child: Row(
                children: [
                const SizedBox(
                  width: 174,
                ),
                Container(
                  width:100.0,
                  height: 50.0,
                  child : Image.asset(items[index].emerg.toString(),
                  height: 40,
                  width: 100,
                  fit: BoxFit.fill,
                  ),
              
                ),
                
                const SizedBox(
                  height: 30,
                  width: 200,
                ),
                Column(
              children:[
                Row(
                    children:[
                      SizedBox(
                        height: 40,
                        width:400,
                      child: 
                      Text(items[index].location.toString(),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      ),  
                    ],
                    ),
                  SizedBox(
                      height: 30,
                      child:
                      Text(items[index].distance.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ) ,
                      ),
                  )
              ],
                ),
                 const SizedBox(
                    width: 400.0,
                  ),  
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                
                 children:[ SizedBox(
                 
                  width: 150.0,
                  child: Text(datemaker(items[index].time.toString()),
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                 ],    
                ),
              ],
              ),
            ),
          );
        },
        ),
    ),
  Container( //최신이랑 새로고침 얘네를 bottom bar로 내릴 수도 있겠네 ㅇㅋ
   alignment: Alignment.bottomCenter,
   padding: const EdgeInsets.all(0.0),
   child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Expanded(
        
         child: ElevatedButton.icon(
           onPressed: () {
            toggleSortOrder();

            // 최신순 버튼 동작 기능 추가해야함
            },
           icon: const Icon(Icons.sync),
           label:  Text(
             getButtonName(),
              style: TextStyle(fontSize: 15.0,),
              textAlign: TextAlign.left,
           ),
           style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              primary: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
        ),
      ),
      const SizedBox(width: 6.0), // 버튼 사이의 간격을 조절할 수 있습니다.
       Expanded(
        
        child:  ElevatedButton(
          
      onPressed: isLoading ? null : fetchData, // 버튼을 비활성화하는 조건 추가
       style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(56, 56)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey), // 버튼 배경색 변경
        ),
        //그냥 circularprogressindicator가 새로고침때 처럼 빙글빙글 도는 애네 그럼 이 버튼은 사실상 그냥 얘 때문에 이렇게 보일뿐이지 패치 x
      child: isLoading ? CircularProgressIndicator() : Text(' 새로고침',
      style: const TextStyle(
        fontSize: 15.0,
      ),
      ),
    ),
      ),
    ],
  ),
),
      ],
      ),
     );
                
        }
   else{
       return  const Center(child: CircularProgressIndicator(),);
    }             
  },
  ),
         );      
  }
}

