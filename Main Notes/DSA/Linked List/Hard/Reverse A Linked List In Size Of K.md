*10-07-2025 09:08*

*Status*: First hard solved by me 📿

*Tags*: [[dsa]] [[linked list]]
# Reverse A Linked List In Size Of K

##### Problem Statement
Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

Example 1:
![img](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex1.jpg)
│ Input: head = [1,2,3,4,5], k = 2
│ Output: [2,1,4,3,5]

Example 2:
![img](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex2.jpg)
│ Input: head = [1,2,3,4,5], k = 3
│ Output: [3,2,1,4,5]

 Constraints:
* The number of nodes in the list is n.

* 1 <= k <= n <= 5000

* 0 <= Node.val <= 1000

Follow-up: Can you solve the problem in O(1) extra memory space?

##### Solution
- The prerequisite for this question is [[Reverse A Linked List]]
- We are given k , which is the group size.
	- We need to divide the linked list into parts
	- Parts = length of linked list / k
- Now for each part , we need to reverse it and connect it's tail to the head of the next list. 
- We know to reverse a linked list , we need it's tail to point to null. 
	- take a itr pointer which will point to the tail of the linked list that needs to be reversed.
	- To do this , move the itr pointer by k - 1 steps
		- It will now point to the tail of the list
		- We also need a pointer to the head of the list that need to be reversed
		- After we reach the tail node , store the next node and make the tail-> next point to null for reversal.
		- Reverse the list.
			- Now after reversing we are returning both it's head and tail 
				- The reason is we need the head of the first linked list that is reversed , it is our answer , and to also connect the tail of last linked list to the head of the current linked list.
				- To achieve this just have a bool firstIteration and point a pointer towards the head of the first linked list and then make the firstIteration false so the if statement is never executed again
			- After this , we know we want to connect the tail of the last linked list to the head of the new linked list , but for the first iteration , there is no tail to connect to , that's where firstIteration block comes into play 
			- For every other list , the next of the prevTail points to the head
			- After this update all the pointers
				- prevTail = tail of the current linked list 
				- The tail of the current linked list now points to the nextNode
				- now the pointer that was used to find the tail of the group becomes the nextNode that was stored before making the tail -> next = nullptr;
				- and the pointer that points to head of the group of nodes is also nextNode.
	- After all the parts are exhausted , return the newHead that was assigned after the first iteration.

##### Handwritten Notes
![[Reverse in groups of k.pdf]]
##### Code
```cpp
#include <utility>
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
  ListNode *reverseKGroup(ListNode *head, int k) {
    ListNode *lenItr = head;
    int len = findLength(lenItr);

    if (k <= 1 || k > len) {
      return head;
    }

    int parts = len / k;
    ListNode *itr = head;
    ListNode *newHead = nullptr;
    ListNode *prevTail = nullptr;
    bool firstIteration = true;

    ListNode *revHead = head;
    while (parts--) {
      for (int i = 0; i < k - 1; i++) {
        itr = itr->next;
      }
      ListNode *nextNode = itr->next;
      itr->next = nullptr;
      auto headTailPair = revList(revHead);
      ListNode *tail = headTailPair.second;
      ListNode *revListHead = headTailPair.first;
      if (firstIteration) {
        newHead = headTailPair.first;
        firstIteration = false;
      } else {
        prevTail->next = revListHead;
      }
      prevTail = tail;

      tail->next = nextNode;
      revHead = nextNode;
      itr = nextNode;
    }
    return newHead;
  }

  std::pair<ListNode *, ListNode *> revList(ListNode *node) {

    ListNode *curr = node;
    ListNode *prev = nullptr;
    std::pair<ListNode *, ListNode *> headTailPair;

    while (curr) {
      ListNode *temp = curr->next;
      curr->next = prev;
      prev = curr;
      curr = temp;
    }
    return {prev, node};
  }

  int findLength(ListNode *head) {
    int len = 0;
    while (head) {
      head = head->next;
      len++;
    }
    return len;
  }
};
// @leet end


```
## References
- [striver sheet link](https://takeuforward.org/data-structure/reverse-linked-list-in-groups-of-size-k/)
- [leetcode question link](https://leetcode.com/problems/reverse-nodes-in-k-group/)
- ![yt video link](https://www.youtube.com/watch?v=Of0HPkk3JgI&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=34)