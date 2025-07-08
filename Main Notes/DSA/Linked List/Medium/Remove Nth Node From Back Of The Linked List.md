*07-07-2025 21:53*

*Status*:

*Tags*: [[dsa]] [[linked list]] [[medium question]]

# Remove Nth Node From Back Of The Linked List

##### Problem Statement
Given the head of a linked list, remove the n^th node from the end of the list and return its head.



Example 1:

![img](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)

│ Input: head = [1,2,3,4,5], n = 2
│ Output: [1,2,3,5]

 Example 2:
│ Input: head = [1], n = 1
│ Output: []

 Example 3:
│ Input: head = [1,2], n = 1
│ Output: [1]

 Constraints:
* The number of nodes in the list is sz.

* 1 <= sz <= 30

* 0 <= Node.val <= 100

* 1 <= n <= sz
##### Solution
- There are two approaches
	- o(2n) -> Bruteforce
		- In this approach find the length of the linked list by traversing it
			- Then traverse until length - n node (curr)
				- Store the curr -> next in dummy node
				- point the curr -> next = curr -> next -> next
				- delete the dummy node i.e curr -> next.
	- Optimal -> One pass -> O(n)
		- Keep two pointers fast and slow and point them to head
			- Traverse the fast pointer till n nodes
			- Now the fast pointer is at n node
				- Remaining nodes at front of fast pointer are length - n node.
				- We want the slow pointer to be at length - n node.
				- So after this we traverse both the slow and fast pointer together and when fast pointer is on the last node (fast -> next == nullptr) , the slow pointer is at length - n node which we need
				- now just repeat the assign and delete step.
	- Edge Cases
		- Keep in mind if the n is equal to the length of linked list , then we need to remove the head of the list
			- In the optimal approach , if the fast ptr becomes null , then we need to remove the head , so just return head -> next; 

##### Handwritten Notes
![[Remove nth node.pdf]]
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
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
  ListNode *removeNthFromEnd(ListNode *head, int n) {

    if (!head->next) {
      return nullptr;
    }

    ListNode *slow = head;
    ListNode *fast = head;

    for (int i = 1; i <= n; i++) {
      fast = fast->next;
    }

    if (fast == nullptr) {
      return head->next;
    }

    while (fast->next) {

      fast = fast->next;
      slow = slow->next;
    }

    ListNode *toDelete = slow->next;
    slow->next = slow->next->next;
    delete toDelete;

    return head;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/remove-n-th-node-from-the-end-of-a-linked-list/)
- [leetcode question link](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
- ![yt video link](https://www.youtube.com/watch?v=Lhu3MsXZy-Q&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=30)