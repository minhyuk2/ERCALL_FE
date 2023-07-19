
class emergencyModel{
   String? emerg;
   String? location;
   String? distance;
   String? time;
 
  emergencyModel
  (this.emerg, this.location, this.distance, this.time, );

  emergencyModel.fromJson(Map<String,dynamic> json){
    emerg = json['emerg'];
    location = json['location'];
    distance = json['distance'];
    time = json['time'];
  }
}
//이게 문제가 되는 이유는 그렇다면 map으로 내가 못바꿔주고 있기 때문이네? 그러면 map으로 어찌바꿔주는지만 알면 해결이네
  // factory emergencyModel.fromJson(Map<String, dynamic> json) => emergencyModel(
       
  //       emerg: json["emerg"] as String,
  //       location: json["location"],
  //       distance: json["distance"],
  //       time: json["time"],
  //     );



// class modelList {
//   final List<emergencyModel> models;
//   modelList({required this.models});
//   factory modelList.fromJson(String jsonString){
//     List<dynamic> listFromJson = json.decode(jsonString);
//     List<emergencyModel> models = <emergencyModel>[];
    
//     models = listFromJson.map((model)=> emergencyModel.fromJson(model)).toList();
//     return modelList(models: models);
//   }
// }
// 이제 나중에 http로 연결할 때 이것들을 이용하면 되는거고 우선은 그냥 jsonString으로 만들어지게끔 이용해봐야겠다.


