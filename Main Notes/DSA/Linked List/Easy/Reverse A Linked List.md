*07-07-2025 21:12*

*Status*:

*Tags*: [[dsa]] [[linked list]]

# Reverse A Linked List
##### Problem Statement
Given the head of a singly linked list, reverse the list, and return the reversed list.

 Example 1:
![img](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)
│ Input: head = [1,2,3,4,5]
│ Output: [5,4,3,2,1]

 Example 2:
![img](https://assets.leetcode.com/uploads/2021/02/19/rev1ex2.jpg)
│ Input: head = [1,2]
│ Output: [2,1]

 Example 3:
│ Input: head = []
│ Output: []



 Constraints:
* The number of nodes in the list is the range [0, 5000].

* -5000 <= Node.val <= 5000
##### Solution
- For this question 
	- We keep three pointers to iteratively reverse the linked list.
		- Prev , Curr , Next
		- Curr is init to head and prev is nullptr
		- While curr is not null
			- store the next node in next
			- point the next of curr to prev
			- update the prev to curr
			- update the curr to next
	- This will keep reversing the curr -> next ptr until it becomes null at which point the loop will break 
	- Keep in mind that curr is null now , but the prev still stores the last node.
	- So prev is the new head of the reversed linked list.


##### Handwritten Notes
![[FT_2025-07-07 21:25:57.297.png]]
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
  ListNode *reverseList(ListNode *head) {

    if (head == nullptr) {
      return head;
    }

    ListNode *next = head;
    ListNode *prev = nullptr;

    while (next != nullptr) {
      ListNode *aheadNode = next->next;
      next->next = prev;
      prev = next;
      next = aheadNode;
    }

    return prev;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/reverse-a-linked-list/)
- [leetcode question link](https://leetcode.com/problems/reverse-linked-list/)
- ![yt video link](https://www.youtube.com/watch?v=iRtLEoL-r-g&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=28&ab_channel=takeUforward)