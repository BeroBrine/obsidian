*10-08-2025 17:40*

*Status*: [[revise]]

*Tags*: [[dsa]] [[stack and queue]] [[medium question]]

# Implement Min Stack

##### Problem Statement
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:
	MinStack() initializes the stack object.
	void push(int val) pushes the element val onto the stack.
	void pop() removes the element on the top of the stack.
	int top() gets the top element of the stack.
	int getMin() retrieves the minimum element in the stack.


You must implement a solution with O(1) time complexity for each function.

 
Example 1:


Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2


 
Constraints:
	-231 <= val <= 231 - 1
	Methods pop, top and getMin operations will always be called on non-empty stacks.
	At most 3 * 104 calls will be made to push, pop, top, and getMin.




##### Solution
- 





##### Handwritten Notes
![[]]
##### Bruteforce Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class MinStack {
  struct Info {
    int topElem;
    int minElem;
  };

private:
  stack<Info> st;

public:
  MinStack() {}

  void push(int val) {

    if (st.empty()) {
      st.push({val, val});
      return;
    }

    Info elem = st.top();
    int minElem = elem.minElem;

    val < minElem ? st.push({val, val}) : st.push({val, minElem});
  }

  void pop() { st.pop(); }

  int top() { return st.top().topElem; }

  int getMin() { return st.top().minElem; }
};

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(val);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */
// @leet end

```

##### Optimised Code
```cpp

```

## References
- [striver sheet link](https://takeuforward.org/data-structure/implement-min-stack-o2n-and-on-space-complexity/)
- [leetcode question link](https://leetcode.com/problems/min-stack/)
- ![yt video link](https://www.youtube.com/watch?v=NdDIaH91P0g)