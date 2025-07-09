*09-07-2025 18:55*

*Status*:

*Tags*: [[dsa]] [[linked list]]

# Detect Cycle In Linked List

##### Problem Statement
Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

Example 1:

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)
│ Input: head = [3,2,0,-4], pos = 1
│ Output: true
│ Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

Example 2:
![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)
│ Input: head = [1,2], pos = 0
│ Output: true
│ Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.

Example 3:
![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)

│ Input: head = [1], pos = -1
│ Output: false
│ Explanation: There is no cycle in the linked list.

 Constraints:
* The number of the nodes in the list is in the range [0, 10^4].
* -10^5 <= Node.val <= 10^5
* pos is -1 or a valid index in the linked-list.
##### Solution
- This has two approaches
###### Bruteforce
- The bruteforce consists





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
  bool hasCycle(ListNode *head) {
    if (head == nullptr)
      return false;
    ListNode *fast = head;
    ListNode *slow = head;

    int itr = 0;
    while (fast and fast->next) {

      fast = fast->next->next;
      slow = slow->next;

      if (fast == slow) {
        return true;
      }
    }
    return false;
  }
};
// @leet end
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/detect-a-cycle-in-a-linked-list/)
- [leetcode question link](https://leetcode.com/problems/linked-list-cycle/)
- ![yt video link](https://www.youtube.com/watch?v=354J83hX7RI&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=35)