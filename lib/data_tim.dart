import 'package:project_uas/class_tim.dart';

class Node {
  Tim data;
  Node? next;

  Node(this.data);
}
class DataTim {
  /* Single Linked List */
  Node? head;

  bool isEmpty() {
    return head == null;
  }

  void insertFront(Tim data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  void printList() {
    if (isEmpty()) {
      print('Belum ada tim.');
    } else {
      Node? current = head;
      while (current != null) {
        final d = current.data;
        print('$d.namaTim');
        current = current.next;
      }
    }
  }
}

Tim? cariTim(DataTim dataTim, String namaTim) {
  Node? current = dataTim.head;
  while (current != null) {
    if (current.data.namaTim.toLowerCase() == namaTim.toLowerCase()) {
      return current.data;
    }
    current = current.next;
  }
  return null;
}


