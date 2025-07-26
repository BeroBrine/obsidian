*26-07-2025 19:05*

*Status*:

*Tags*: [[dsa]] [[stack and queue]] 

# Valid Parantheses

##### Problem Statement
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:
	Open brackets must be closed by the same type of brackets.
	Open brackets must be closed in the correct order.
	Every close bracket has a corresponding open bracket of the same type.


 
Example 1:


Input: s = "()"

Output: true


Example 2:


Input: s = "()[]{}"

Output: true


Example 3:


Input: s = "(]"

Output: false


Example 4:


Input: s = "([])"

Output: true


Example 5:


Input: s = "([)]"

Output: false


 
Constraints:
	1 <= s.length <= 104
	s consists of parentheses only '()[]{}'.
**Note:- ([)] is not a valid string**
![[Pasted image 20250726191628.png]]

##### Solution
**Bruteforce Approach** -> O(n * n) + recursion stack space 
- In this we recursively remove valid pairs from the strings. 
	- If there are none left , then it is a valid string
	- If there are no pairs to remove and the string is still not empty , then it is a invalid string
	
**Optimal Approach**
- This approach uses a stack. 
	- What we are essentially doing is checking if the brackets are closed in the correct order
		- First opened , last closed.
	- So when we encounter a opening bracket  , we push it on top of the stack.
	- When we encounter a closing bracket , we first check if the stack was empty (for the case if the string is starting with closing bracket).
		- If it's empty , return false. 
	- Now we need to check if the stack top's contain the opening bracket for the current closed bracket , if it does , pop it out and continue
		- But if it doesn't return false as there are brackets in incorrect order. 
	
	- After all of this , if the stack is empty it means that the whole string contained valid pairs and return true.
	- But if the stack isn't empty then return false. 

##### Handwritten Notes
![[]]
##### Brute Code
```cpp
class Solution {
public:
  bool isValid(string s) {
    if (s.empty()) return true;

    for (int i = 1; i < s.length(); ++i) {
      if (isMatchingPair(s[i - 1], s[i])) {
        string reduced = s.substr(0, i - 1) + s.substr(i + 1);
        return isValid(reduced);
      }
    }

    return false;
  }

  bool isMatchingPair(char open, char close) {
    return (open == '(' && close == ')') ||
           (open == '{' && close == '}') ||
           (open == '[' && close == ']');
  }
};

```

##### Optimised Code
```cpp
#include <bits/stdc++.h>
#include <iostream>
using namespace std;
// @leet start
class Solution {
public:
  bool isValid(string s) {
    if (s.size() == 1)
      return false;
    stack<char> st;
    bool closingBracketEncountered = false;

    for (char ch : s) {
      if (isOpeninBracket(ch)) {
        st.push(ch);
        continue;
      }
      if (isClosingBracket(ch)) {
        if (st.empty())
          return false;
        char top = st.top();
        char oppBracket = getOppositeBracket(ch);
        if (oppBracket == top) {
          st.pop();
          continue;
        } else {
          return false;
        }
      }
    }
    return st.empty();
  }

  bool isOpeninBracket(char ch) {
    if (ch == '(' || ch == '{' || ch == '[') {
      return true;
    }
    return false;
  }

  bool isClosingBracket(char ch) {
    if (ch == ')' || ch == '}' || ch == ']') {
      return true;
    }
    return false;
  }

  char getOppositeBracket(char ch) {
    if (ch == ')')
      return '(';
    if (ch == '}')
      return '{';
    if (ch == ']')
      return '[';
    // this will never be executed as the stirng is valid
    return '_';
  }
};
// @leet end

```

## References
- [striver sheet link](https://takeuforward.org/data-structure/check-for-balanced-parentheses/)
- [leetcode question link](https://leetcode.com/problems/valid-parentheses/)
- ![yt video link](https://www.youtube.com/watch?si=UoyKpFn4Q3nf5h2R&v=xwjS0iZhw4I&feature=youtu.be)