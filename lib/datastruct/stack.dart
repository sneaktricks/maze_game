class Stack<T> {
  final _list = <T>[];

  void push(T elem) => _list.add(elem);

  T pop() => _list.removeLast();

  bool get isEmpty => _list.isEmpty;
  
  bool get isNotEmpty => _list.isNotEmpty;
}