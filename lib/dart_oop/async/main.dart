void main() {
  // fetchOrder();
  // print('blajar async');

  method1();
  var result = method2();
  method3(result);
}

Future<void> fetchOrder() {
  return Future.delayed(
    Duration(seconds: 3),
    () => print("List dari user orders"),
  );
}

void method1() {
  print('method 1');
}

Future method2() async {
  String? result;
  Future.delayed(Duration(seconds: 3), () => {result = "data method2"});
  return result;
}

void method3(Future value) {
  print(value);
}
