*10-07-2025 20:51*

*Status*:

*Tags*: [[dsa]] [[linked list]]
# Find the Starting Point Of Cycle
##### Problem Statement
Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.

Do not modify the linked list.

Example 1:
![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

│ Input: head = [3,2,0,-4], pos = 1
│ Output: tail connects to node index 1
│ Explanation: There is a cycle in the linked list, where tail connects to the second node.

Example 2:

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)
│ Input: head = [1,2], pos = 0
│ Output: tail connects to node index 0
│ Explanation: There is a cycle in the linked list, where tail connects to the first node.

Example 3:
![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)
│ Input: head = [1], pos = -1
│ Output: no cycle
│ Explanation: There is no cycle in the linked list.

 Constraints:
* The number of the nodes in the list is in the range [0, 10^4].

* -10^5 <= Node.val <= 10^5

* pos is -1 or a valid index in the linked-list.

Follow up: Can you solve it using O(1) (i.e. constant) memory?
##### Solution
- This has two solutions 
###### Bruteforce
- This approach is similar to the [[Detect Cycle In Linked List#Bruteforce - TC->O(n) , SC->O(n)]]
	- Hash the sets and if the node is encountered again , return it. If there is none , return nullptr.

##### Optimal
- This one is based on the math equation in handwritten notes.
	- After fast and slow pointers meet at a point.
	- Reset the slow pointer to head and move both one at a time.
	- When both meet , they meet at the point where the loop starts



##### Handwritten Notes
![[FT_2025-07-10 21:00:51.968.png]]
##### Code
```cpp
class Solution {
public:
    ListNode *detectCycle(ListNode *head) {
        if(!head) return nullptr;
        ListNode* fast = head;
        ListNode* slow = head;

        bool isCycle = false;
        while(fast and fast->next) {
            fast = fast -> next -> next;
            slow = slow -> next;

            if(fast == slow) {
                isCycle = true;
                break;
            }

        }
        if(!isCycle) return nullptr;
        slow = head; 

        while(slow != fast) {
            slow = slow -> next;
            fast = fast -> next;
        }
        return slow;

    }

    ListNode* bruteForce(ListNode* head) {
        unordered_set<ListNode*> set;
        while(head) {
            if(set.find(head) != set.end()) {
                return head;
            }
            else {
                set.insert(head);
            }
            head = head-> next;
        }
        return nullptr;
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/starting-point-of-loop-in-a-linked-list/)
- [leetcode question link](https://leetcode.com/problems/linked-list-cycle-ii/)
- ![yt video link](https://www.youtube.com/watch?v=QfbOhn0WZ88&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=37)