*09-07-2025 13:22*

*Status*:

*Tags*: [[dsa]] [[linked list]]

# Add Two Numbers

##### Problem Statement
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 Example 1:
 
![img](https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg)

│ Input: l1 = [2,4,3], l2 = [5,6,4]
│ Output: [7,0,8]
│ Explanation: 342 + 465 = 807.

 Example 2:
│ Input: l1 = [0], l2 = [0]
│ Output: [0]

 Example 3:
│ Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
│ Output: [8,9,9,9,0,0,0,1]
##### Solution
- In this question 
	- What we are essentially doing is adding the two values for each of the node of the both linked list
	- Because we do not know the value of the first node of the returned linked list. Create a dummy node and a tail , tail will be initialized with the dummy node , using this tail pointer we will be creating the required linked list
	- Create a variable called carry.
	- Now create a loop until l1 and l2 are not null.
		- Calc the sum of the val1 and val2.
			- Add the carry in it , initially the carry was 0.
			- After the sum , get the last digit which will be done by % 10. 
			- Find the carry by dividing by 10.
			- Create a new linked list node whose value will be lastDigit. 
			-  




##### Handwritten Notes
![[]]
##### Code
```cpp
struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};
// @leet start
class Solution {
public:
  ListNode *addTwoNumbers(ListNode *l1, ListNode *l2) {

    ListNode *dummy = new ListNode(0);
    ListNode *tail = dummy;
    int carry = 0;

    while (l1 and l2) {
      int val1 = l1->val;
      int val2 = l2->val;

      int sum = val1 + val2 + carry;
      int lastDigit = sum % 10;
      carry = sum / 10;

      ListNode *newNode = new ListNode(lastDigit);

      tail->next = newNode;
      tail = tail->next;
      l1 = l1->next;
      l2 = l2->next;
    }

    while (l1) {

      int val1 = l1->val;

      int sum = val1 + carry;
      int lastDigit = sum % 10;
      carry = sum / 10;

      ListNode *newNode = new ListNode(lastDigit);

      tail->next = newNode;
      tail = tail->next;
      l1 = l1->next;
    }

    while (l2) {

      int val2 = l2->val;

      int sum = val2 + carry;
      int lastDigit = sum % 10;
      carry = sum / 10;

      ListNode *newNode = new ListNode(lastDigit);

      tail->next = newNode;
      tail = tail->next;
      l2 = l2->next;
    }

    if (carry == 1) {
      ListNode *newNode = new ListNode(carry);
      tail->next = newNode;
      tail = tail->next;
    }

    ListNode *result = dummy->next;
    return result;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/add-two-numbers-represented-as-linked-lists/)
- [leetcode question link](https://leetcode.com/problems/add-two-numbers/)
- ![yt video link](https://www.youtube.com/watch?v=LBVsXSMOIk4&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=33&ab_channel=takeUforward)