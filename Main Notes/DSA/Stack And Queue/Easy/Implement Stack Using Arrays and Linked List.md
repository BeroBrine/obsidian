*26-07-2025 10:49*

*Status*:

*Tags*: [[dsa]] [[stack and queue]] 
# Implement Stack Using Arrays And Linked List

##### Problem Statement
We need to implement the stack data structure using arrays and linked list
##### Solution

**Arrays**
- Keep in mind the increment decrement of the topItr ptr; 
	- It should always be clamped to -1 when empty
	- Memory allocation for the array is a bit diff. 
	- For this approach we always need to have the size predefined
**Linked List**
- This approach uses linked list
	- See the code to understand.

##### Handwritten Notes
![[Stack implementation.pdf]]
##### Array Code
```cpp
#include <iostream>

class Stack {
  int topItr;
  int maxInd;
  int *arr;

public:
  Stack(int size) {
    arr = new int[size];
    this->topItr = -1;
    this->maxInd = size - 1;
  }

  void push(int data) {
    if (this->topItr > this->maxInd) {
      std::cout << "Limit Reached" << std::endl;
      return;
    }

    if (this->topItr == -1)
      this->topItr = 0;
    this->arr[topItr] = data;
    this->topItr++;
  }

  void pop() {
    if (this->topItr == -1) {
      std::cout << "There is no element to pop" << std::endl;
      return;
    }
    if (this->topItr >= 0) {
      this->topItr--;
    } else
      this->topItr = -1;
  }

  int top() {
    if (this->topItr == -1) {
      std::cout << "There is no element at top" << std::endl;
      return -1;
    }
    return this->arr[this->topItr - 1];
  }

  int size() {
    if (this->topItr == 0)
      return 1;

    return this->topItr;
  }
};

int main() {
  Stack st = Stack(5);
  st.push(4);
  st.push(4);
  st.push(4);
  st.push(4);
  st.push(4);
  st.push(4);
  st.push(4);
  st.push(1);
  std::cout << "The size is " << st.size() << std::endl;
  st.pop();
  st.pop();
  st.pop();
  st.pop();
  st.pop();

  return 0;
}

```

##### Linked List Code
```cpp
#include <iostream>
struct ListNode {
  int val;
  ListNode *next;
  ListNode(int val) {
    this->val = val;
    this->next = nullptr;
  }
};

class Stack {
  ListNode *top;
  int size;

public:
  Stack() {
    this->top = nullptr;
    this->size = 0;
  }

  void push(int data) {
    ListNode *temp = new ListNode(data);
    temp->next = this->top;
    this->top = temp;
    this->size += 1;
  }

  void pop() {
    if (!this->top)
      return;
    ListNode *temp = this->top;
    this->top = this->top->next;
    delete temp;
    this->size -= 1;
  }

  int getTop() {
    if (!this->top) {
      std::cout << "Empty Stack" << std::endl;
      return -1;
    }
    return this->top->val;
  }

  int getSize() { return this->size; }
};

int main() {
  Stack st = Stack();
  std::cout << "the size is " << st.getSize() << std::endl;
  st.push(5);
  st.push(3);
  std::cout << "the size is " << st.getSize() << std::endl;
  st.pop();
  std::cout << "the top is " << st.getTop() << std::endl;
  st.pop();
  std::cout << "the size is " << st.getSize() << std::endl;

  return 0;
}

```

## References
- [striver sheet link](https://takeuforward.org/data-structure/implement-stack-using-array/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?si=ofLt8Zt1ZvhikZ6w&v=tqQ5fTamIN4&feature=youtu.be)