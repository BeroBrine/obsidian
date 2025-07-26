*26-07-2025 13:52*

*Status*:

*Tags*: [[dsa]] [[stack and queue]]

# Implement Stack using queue

##### Problem Statement
Implement stack using single queue
##### Solution
- We need to use a single queue to implement this  
	- But when pushing elements in a queue , it will always be at the end instead of front
	- So what we will have to do is , pop out all the elements that are there before adding new elements and then re add them at the back
	- This will ensure that the latest push is on the top
	- Rest all functions can be implemented using queue's built in functions
**Steps**
- s1 -> s2
- push the element in s1
- s2 -> s1

##### Handwritten Notes
![[Stack using queue.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class MyStack {
  queue<int> q;

public:
  MyStack() {}

  void push(int x) {
    q.push(x);
    int size = q.size();
    for (int i = 0; i < size - 1; i++) {
      int node = q.front();
      q.pop();
      q.push(node);
    }
  }

  int pop() {
    int node = q.front();
    q.pop();
    return node;
  }

  int top() { return q.front(); }

  bool empty() { return q.empty(); }
};

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack* obj = new MyStack();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->top();
 * bool param_4 = obj->empty();
 */
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/implement-stack-using-single-queue/)
- [leetcode question link](https://leetcode.com/problems/implement-stack-using-queues/description/)
- ![yt video link](https://www.youtube.com/watch?v=tqQ5fTamIN4&ab_channel=takeUforward)