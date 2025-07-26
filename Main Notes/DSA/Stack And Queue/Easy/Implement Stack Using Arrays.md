*26-07-2025 10:49*

*Status*:

*Tags*: [[dsa]] [[stack and queue]] 
# Implement Stack Using Arrays

##### Problem Statement
We need to implement the stack data structure using arrays
##### Solution
- Keep in mind the increment decrement of the topItr ptr; 
	- It should always be clamped to -1 when empty
	- Memory allocation for the array is a bit diff. 


##### Handwritten Notes
![[]]
##### Code
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
## References
- [striver sheet link](https://takeuforward.org/data-structure/implement-stack-using-array/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?si=ofLt8Zt1ZvhikZ6w&v=tqQ5fTamIN4&feature=youtu.be)