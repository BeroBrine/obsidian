*09-07-2025 14:54*

*Status*:

*Tags*: [[dsa]] [[linked list]]
# Find Intersection Point of Y Linked List
##### Problem Statement
Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

For example, the following two linked lists begin to intersect at node c1:

![img](https://assets.leetcode.com/uploads/2021/03/05/160_statement.png)

The test cases are generated such that there are no cycles anywhere in the entire linked structure.

Note that the linked lists must retain their original structure after the function returns.

Custom Judge:
The inputs to the judge are given as follows (your program is not given these inputs):

* intersectVal - The value of the node where the intersection occurs. This is 0 if there is no intersected node.
	
	* listA - The first linked list.
	
	* listB - The second linked list.
	
	* skipA - The number of nodes to skip ahead in listA (starting from the head) to get to the intersected node.
	
	* skipB - The number of nodes to skip ahead in listB (starting from the head) to get to the intersected node.

The judge will then create the linked structure based on these inputs and pass the two heads, headA and headB to your program. If you correctly return the intersected node, then your solution will be accepted.
 Example 1:

![img](https://assets.leetcode.com/uploads/2021/03/05/160_example_1_1.png)

│ Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
│ Output: Intersected at '8'
│ Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
│ From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
│ - Note that the intersected node's value is not 1 because the nodes with value 1 in A and B (2^nd node in A and 3^rd node in B) are different node references. In other words, they point to two different locations in memory, while the nodes with value 8 in A and B (3^rd node in A and 4^th node in B) point to the same location in memory.

Example 2:
![img](https://assets.leetcode.com/uploads/2021/03/05/160_example_2.png)
│ Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
│ Output: Intersected at '2'
│ Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect).
│ From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.

Example 3:
![img](https://assets.leetcode.com/uploads/2021/03/05/160_example_3.png)

│ Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
│ Output: No intersection
│ Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
│ Explanation: The two lists do not intersect, so return null.

 Constraints:

* The number of nodes of listA is in the m.

* The number of nodes of listB is in the n.

* 1 <= m, n <= 3 * 10^4

* 1 <= Node.val <= 10^5

* 0 <= skipA <= m

* 0 <= skipB <= n

* intersectVal is 0 if listA and listB do not intersect.

* intersectVal == listA[skipA] == listB[skipB] if listA and listB intersect.
Follow up: Could you write a solution that runs in O(m + n) time and use only O(1) memory?


##### Solution
- There are three approach 

###### Bruteforce TC -> O(n2) , SC -> O(1)
- In bruteforce approach , we just compare each node of the first list to each node of second list.
- When matching node is found , i.e both list contain a node at the same memory address (headA == headB) return the node

###### Hashing TC -> O(m + n) , SC -> O(m) 
- In hashing , we hash the nodes of the first list using unordered_set.
	- Then searching inside the set will O(1) 
	- For each node in the list 2 , search it inside the set and if there's a match just return it.
###### Positive Diff Approach
- In this approach 
	- We first find the length of both the linked list.
	- We find the positive difference between them
	- We move the head of the larger list till the positive diff
	- Now both heads of the linked list are at equal starting points.
	- Move both of the heads of the linked list and if both of the heads collide it's an intersection and return that node
##### Handwritten Notes
![[]]
##### Code
```cpp
#include <bits/stdc++.h>
struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};
using namespace std;
// @leet start
class Solution {
public:
  ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    ListNode *node = nullptr;
    bool found = false;
    auto ans = bruteforce(headA,headB); // O(n2)
    auto ans = hashing(headA, headB); // O(m+n) sp -> O(m)
    auto ans = postiveDiff(headA, headB); // O(m+n) sp O(1)
    return ans;
  }

  ListNode *bruteforce(ListNode *headA, ListNode *headB) {

    while (headA) {
      ListNode *temp = headB;
      while (temp) {

        if (temp == headA) {
          return temp;
        }
        temp = temp->next;
      }
      headA = headA->next;
    }
    return nullptr;
  }

  ListNode *hashing(ListNode *headA, ListNode *headB) {
    unordered_set<ListNode *> set;
    while (headA) {
      set.insert(headA);
      headA = headA->next;
    }
    while (headB) {

      if (set.find(headB) != set.end()) {
        return headB;
      }
      headB = headB->next;
    }
    return nullptr;
  }

  ListNode *postiveDiff(ListNode *headA, ListNode *headB) {
    int l1 = 0;
    auto temp1 = headA;
    auto temp2 = headB;
    while (temp1) {
      temp1 = temp1->next;
      l1++;
    }

    int l2 = 0;

    while (temp2) {
      temp2 = temp2->next;
      l2++;
    }

    int posiDiff = abs(l1 - l2);
    if (l1 > l2) {
      while (posiDiff) {
        headA = headA->next;
        posiDiff--;
      }
    } else {
      while (posiDiff) {
        headB = headB->next;
        posiDiff--;
      }
    }

    while (headA and headB) {
      if (headA == headB) {
        return headA;
      }
      headA = headA->next;
      headB = headB->next;
    }

    return nullptr;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/find-intersection-of-two-linked-lists/)
- [leetcode question link](https://leetcode.com/problems/intersection-of-two-linked-lists/description/)
- ![yt video link](https://www.youtube.com/watch?v=u4FWXfgS8jw&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=33)