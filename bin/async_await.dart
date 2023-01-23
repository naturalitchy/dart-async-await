import 'package:async_await/async_await.dart' as async_await;

// void main() {
//   addNumbers(1,1);
//   addNumbers(2,2);
// }

// void addNumbers(int num1, int num2) async {
//   print("Execute addNumbers function");

//   await Future.delayed(Duration(seconds: 2), 
//     () { print('result(add) = ${num1 + num2}'); }   // call back function.
//   );

//   print("End addNumbers function");

// }



// void main() async {
//   await addNumbers(1,1);
//   await addNumbers(2,2);
// }

// Future<void> addNumbers(int num1, int num2) async {
//   print("Execute addNumbers function");

//   await Future.delayed(Duration(seconds: 2), 
//     () { print('result(add) = ${num1 + num2}'); }   // call back function.
//   );

//   print("End addNumbers function");

// }



import 'dart:async';

void main() async {
  final controller = StreamController();
  final stream = controller.stream;

  // listen중에 값이 들어올때마다 콜백함수 실행.
  final streamListener = stream.listen((val) => print(val));
  
  controller.sink.add(1);
  controller.sink.add(2);
  await Future.delayed(Duration(seconds: 1), () => print("delayed end")); 
  controller.sink.add(3);




  // Stream은 단 한번만 리슨 가능.
  // 브로드캐스트 스트림은 여러번 리슨 가능.
  final broController = StreamController();
  final broStream = broController.stream.asBroadcastStream();
  
  final broStreamListener1 = broStream.listen((val) => print("bro1 ${val}"));
  final broStreamListener2 = broStream.listen((val) => print("bro2 ${val}"));
  
  broController.sink.add(10);
  broController.sink.add(20);
  broController.sink.add(30);

}