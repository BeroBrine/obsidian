*10-07-2025 16:43*

*Status*:

*Tags*: [[dsa]] [[linked list]]

# Check If A Linked List Is Palindrome Or Not

##### Problem Statement
Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

Example 1:
![img](https://assets.leetcode.com/uploads/2021/03/03/pal1linked-list.jpg)
│ Input: head = [1,2,2,1]
│ Output: true

Example 2:
![img](https://assets.leetcode.com/uploads/2021/03/03/pal2linked-list.jpg)

│ Input: head = [1,2]
│ Output: false



 Constraints:
* The number of nodes in the list is in the range [1, 10^5].

* 0 <= Node.val <= 9



Follow up: Could you do it in O(n) time and O(1) space?







##### Solution
- 





##### Handwritten Notes
![[]]
##### Code
```cpp
class Solution {
public:
  bool isPalindrome(ListNode *head) {
    auto itr = head;
    int len = getLLlength(itr);

    if (len == 1)
      return true;
    bool evenLen = len % 2 == 0 ? true : false;

    ListNode *fast = head;
    ListNode *middleNode = head;
    while (fast->next->next) {
      fast = fast->next->next;
      middleNode = middleNode->next;
    }
    ListNode *nextHead = middleNode->next;
    if (evenLen) {
      ListNode *dummy = new ListNode(-1);
      middleNode->next = dummy;
      dummy->next = nextHead;
      middleNode = middleNode->next;
    }

    ListNode *tailPtr = revLL(middleNode);

    while (head != tailPtr) {
      if (head->val != tailPtr->val)
        return false;
      head = head->next;
      tailPtr = tailPtr->next;
    }

    return true;
  }

  int getLLlength(ListNode *head) {
    int len = 0;
    while (head) {
      head = head->next;
      len++;
    }
    return len;
  }

  ListNode *revLL(ListNode *head) {
    ListNode *curr = head;
    ListNode *prev = nullptr;

    while (curr) {
      ListNode *temp = curr->next;
      curr->next = prev;
      prev = curr;
      curr = temp;
    }
    return prev;
  }

  bool bruteforce(ListNode *head) {

    ListNode *newListHead = new ListNode(0);
    newListHead->next = head;
    ListNode *itr = head;
    ListNode *prevItr = newListHead;
    ListNode *curr = head;
    ListNode *prev = nullptr;

    while (itr) {
      ListNode *temp = new ListNode(itr->val);
      prevItr->next = temp;
      prevItr = temp;
      itr = itr->next;
    }
    auto actualHead = newListHead->next;
    delete newListHead;

    ListNode *revHead = reverseLL(actualHead);
    ListNode *revItr = revHead;
    while (head and revHead) {
      if (head->val != revHead->val)
        return false;
      head = head->next;
      revHead = revHead->next;
    }

    return true;
  }

  void printList(ListNode *itr) {
    while (itr) {
      cout << itr->val << ' ';
      itr = itr->next;
    }
    cout << endl;
  }

  ListNode *reverseLL(ListNode *head) {
    ListNode *curr = head;
    ListNode *prev = nullptr;

    while (curr) {
      ListNode *temp = curr->next;
      curr->next = prev;

      prev = curr;
      curr = temp;
    }
    return prev;
  }
};


```
## References
- [striver sheet link](https://takeuforward.org/data-structure/check-if-given-linked-list-is-plaindrome/)
- [leetcode question link](https://leetcode.com/problems/palindrome-linked-list/description/)
- ![yt video link](https://www.youtube.com/watch?v=-DtNInqFUXs&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=36)