*26-07-2025 13:46*

*Status*:

*Tags*: [[dsa]] [[stack and queue]] 

# Queue using LL

##### Problem Statement
Implement queue using linked list

##### Solution
- We will keep two pointer
	- start and end 
		- Both pointing to null initially
		- on pushing , use end to track the tail
		- on pop , use start to pop the element out
	- If it's the first insertion , then make sure to init start and end with the first node

##### Handwritten Notes
![[Queue ll.pdf]]
##### Code
```cpp
#include <iostream>
struct ListNode {
  ListNode *next;
  int val;

  ListNode(int val) {
    this->val = val;
    this->next = nullptr;
  }
};

class Queue {
  ListNode *start;
  ListNode *end;
  int size;

public:
  Queue() {
    this->start = nullptr;
    this->end = nullptr;
    this->size = 0;
  }

  void push(int data) {
    ListNode *temp = new ListNode(data);
    if (this->size == 0) {
      this->start = temp;
      this->end = temp;
    }
    end->next = temp;
    end = temp;
    this->size += 1;
  }

  void pop() {
    if (!this->start)
      return;
    ListNode *temp = this->start;
    this->start = this->start->next;
    delete temp;
    this->size -= 1;
  }

  int front() {
    if (!this->start)
      return -1;

    return this->start->val;
  }

  int getSize() { return this->size; }
};

int main() {
  Queue q = Queue();

  q.push(5);
  q.push(5);
  q.push(5);
  std::cout << q.getSize() << std::endl;
  q.pop();
  q.pop();
  q.pop();
  q.pop();
  std::cout << q.getSize() << std::endl;
}

```
## References
- [striver sheet link]()
- [leetcode question link]()
- ![yt video link]()