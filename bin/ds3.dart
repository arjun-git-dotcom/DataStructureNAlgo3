import 'dart:collection';

class Node {
  int value;
  Node? left;
  Node? right;
  Node(this.value, [this.left, this.right]);
}

class BinarySearchtree {
  Node? root;
  insert(int value) {
    root = _insert(root, value);
  }

  _insert(Node? root, int value) {
    if (root == null) {
      root = Node(value);
      return root;
    }
    if (root.value > value) {
      root.left = _insert(root.left, value);
    }
    if (root.value < value) {
      root.right = _insert(root.right, value);
    }

    return root;
  }

  delete(int value) {
    root = _delete(root, value);
  }

  _delete(Node? root, value) {
    if (root == null) {
      return root;
    }

    if (root.value > value) {
      root.left = _delete(root.left, value);
    } else if (root.value < value) {
      root.right = _delete(root.right, value);
    } else {
      if (root.left == null) {
        return root.right;
      }

      if (root.right == null) {
        return root.left;
      } else {
        if (root.left != null && root.right != null) {
          root.value = minValue(root.right);
          root.right = _delete(root.right, root.value);
        }
      }
    }
    return root;
  }

  minValue(Node? root) {
    while (root?.left != null) {
      root = root?.left;
    }
    return root?.value;
  }

  traversal(Node? root) {
    if (root != null) {
      print(root.value);
      traversal(root.left);
      traversal(root.right);
    }
  }

  findSmallest(Node root) {
    while (root.left != null) {
      root = root.left!;
    }
    return root.value;
  }

  findLargest(Node root) {
    while (root.right != null) {
      root = root.right!;
    }
    return root.value;
  }

  height(Node? root) {
    if (root == null) {
      return 0;
    }
    int leftheight = height(root.left);
    int rightheight = height(root.right);
    return (leftheight > rightheight ? leftheight : rightheight) + 1;
  }

  isBst(Node? root) {
    Queue queue = Queue();
    queue.add(root);
    while (queue.isNotEmpty) {
      var current = queue.removeLast();

      if (current == null) {
        continue;
      }
      if (current.left != null && current.left.value > current.value) {
        return false;
      } else {
        queue.add(current.left);
      }
      if (current.right != null && current.right.value < current.value) {
        return false;
      } else {
        queue.add(current.right);
      }
    }
    return true;
  }

  isBalanced() {
    int diff = height(root?.left) - height(root?.right);
    if (diff.abs() <= 1) {
      return true;
    } else {
      return false;
    }
  }

  issymmetric(Node root1, Node root2) {}
}

void main() {
  BinarySearchtree bst = BinarySearchtree();
  bst.insert(5);
  bst.insert(3);
  bst.insert(1);
  bst.insert(4);
  bst.insert(10);
  var a = bst.height(bst.root);
  print(a);

  // bst.delete(33000);
  // var a = bst.findLargest(bst.root!);
  // print(a);

  //  bst.traversal(bst.root);
  // var h = bst.height(bst.root!);
  // // print(h);
  // var b = bst.isBst(bst.root);
  // var isb = bst.isBalanced();
  // print(isb);
  // print(b);
}
