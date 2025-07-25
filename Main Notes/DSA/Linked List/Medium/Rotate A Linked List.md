*24-07-2025 19:34*

*Status*:

*Tags*: [[dsa]] [[linked list]] [[medium question]]

# Rotate A Linked List

##### Problem Statement

Given the head of a linked list, rotate the list to the right by k places.

Example 1:


Input: head = [1,2,3,4,5], k = 2
Output: [4,5,1,2,3]

Example 2:

Input: head = [0,1,2], k = 4
Output: [2,0,1]

Constraints:
	The number of nodes in the list is in the range [0, 500].
	-100 <= Node.val <= 100
	0 <= k <= 2 * 109

##### Solution
- This question has two solutions

###### Bruteforce -> O(k * n)
- What we need to do is go the last 2nd node(prev) , which mean it's next will be tail , make the tail -> next point to head , then last prev->next to nullptr 
- Now reassign the pointers 
	- head = tail;
	- prev = head; 
- **But this solution will fail on large number of k ** 
	- To solve this , we can clamp down the value of k with the help of length of linked list.
	- Suppose k = 10 , and len is 5 , then we practically are at the original linked list after performing 10 rotations (10 % 5 = 0) , so we basically don't need to do rotations
	- Similarly for k = 11 , we only need to do one rotation as after 10 it will be on the original positions
	- So the number of iterations are k % len
	- This gets accepted on leetcode as it takes atmost O(n-1 * n) = O(n * n)

###### Optimised Solution -> O(N)
- The clamping of k still applies in this approach
	- Suppose clamp = k % len
- But if we see that if we move len - clamp steps from the head , and then make the next node new head of the list , and the node we are standing on as the tail , we get the desired rotated list
	- To achieve this first make a circular linked list by attaching the tail to head
	- Then move len - clamp (subtract 1 for 0 - indexing). Make the next node head , and the curr -> next = nullptr (meaning it is the tail now) 
	- Return the head.


##### Handwritten Notes
![[Rotate a linked list.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

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
  ListNode *rotateRight(ListNode *he, int k) {
    if (!he)
      return nullptr;

    if (!he->next)
      return he;

    int len = findLength(he);
    int iter = len - (k % len);
    iter--; // making it 0 indexed

    ListNode *head = he;
    ListNode *tail = he;

    while (tail->next) {
      tail = tail->next;
    }

    // creating a circular linked list
    tail->next = head;

    ListNode *breakOff = head;
    while (iter != 0) {
      breakOff = breakOff->next;
      iter--;
    }
    head = breakOff->next;
    breakOff->next = nullptr;

    return head;
  }

  ListNode *bruteforce(ListNode *head, int iter) {

    while (iter--) {

      ListNode *prev = head;

      while (prev->next->next) {
        prev = prev->next;
      }
      ListNode *lastNode = prev->next;
      prev->next = nullptr;
      lastNode->next = head;
      head = lastNode;
    }
    return head;
  }

  int findLength(ListNode *he) {
    int len = 0;
    ListNode *itr = he;
    while (itr) {
      itr = itr->next;
      len++;
    }
    return len;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/rotate-a-linked-list/)
- [leetcode question link](https://leetcode.com/problems/rotate-list/)
- ![yt video link](https://www.youtube.com/watch?v=9VPm6nEbVPA&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=40&ab_channel=takeUforward)