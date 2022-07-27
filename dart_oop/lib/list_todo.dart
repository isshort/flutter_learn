void listTodo() {
  var x = [1, 3];
  var y = [2, 3, 4, 5];
  x.addAll(y); // are the same
  print(x);
  x = [1, 3, ...y]; // are the same
  print(x);
}
