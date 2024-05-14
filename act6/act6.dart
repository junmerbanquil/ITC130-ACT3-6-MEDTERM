class Stack<T> {
  List<T> _storage = [];

  void push(T element) {
    _storage.add(element);
  }
  T pop() {
    if (isEmpty()) {
      throw Exception('Cannot pop from an empty stack.');
    }
    return _storage.removeLast();
  }
  bool isEmpty() {
    return _storage.isEmpty;
  }
}
void main() {
  var stack = Stack<int>();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);
  stack.push(50);
  
  print('Popping from stack: ${stack.pop()}'); 
  print('Is stack empty? ${stack.isEmpty()}'); 
}
