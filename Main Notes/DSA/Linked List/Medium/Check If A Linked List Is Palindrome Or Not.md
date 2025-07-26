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
- There are two approach to this question
###### Bruteforce -> O(N) + O(N)
- Just make a new clone of the list and reverse it.
	- Compare both the heads of the original and the reversed cloned list.
		- If the heads do not match it is not a linked list.

###### Optimised -> O(N) + O(1)
- In this approach , what we are essentialy doing is [[Reverse A Linked List]] from the middle node of the list found with [[Find The Middle Of The Linked List]].
	- For this we need the previous node from the middle node 
		- To find this just add fast -> next -> next so the iteration will stop at last 2nd node.
			- Slow ptr will essentially be at the one minus middle node.
	- Now after this prev node is found , the middle node is prev -> next.
		- Reverse the linked list using this prev-> next. 
		- Connect with the previous linked list using slow -> next = newRevHead;
	- Now start comparing with the original head and the head of the reversedLinkedList which is the newRevHead.
	- If any value differ , just set the flag to false
		- Why are we not returning here , because we always persist the original data.
		- After the palindrome check , reverse the reversed half list and reconnect.
			- Essentially restoring the original form of the list again.

##### Handwritten Notes
![[]]
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
*
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
bool isPalindrome(ListNode *head) {
	auto itr = head;
	ListNode *fast = head;
	ListNode *slow = head;
	while (fast and fast->next and fast->next->next) {
	fast = fast->next->next;
	slow = slow->next;
	}
	ListNode *nextHead = slow->next;
	auto headTailPair = revLL(nextHead);
	ListNode *headOfRev = headTailPair.first;
	ListNode *headOfRevItr = headTailPair.first;
	ListNode *tailOfRev = headTailPair.second;
	slow->next = headOfRev;
	bool flag = true;
	while (headOfRev) {
	if (head->val != headOfRev->val)
		flag = false;
		head = head->next;
		headOfRev = headOfRev->next;
	}
	ListNode *newHead = revLL(headOfRevItr).first;
	slow->next = newHead;
	return flag;
}
int getLLlength(ListNode *head) {
	int len = 0;
	while (head) {
	head = head->next;
	len++;
	}
	return len;
}
pair<ListNode *, ListNode *> revLL(ListNode *head) {
	ListNode *curr = head;
	ListNode *prev = nullptr;
	while (curr) {
	ListNode *temp = curr->next;
	curr->next = prev;
	prev = curr;
	curr = temp;
	}
	return {prev, head};
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
// @leet end


```
## References
- [striver sheet link](https://takeuforward.org/data-structure/check-if-given-linked-list-is-plaindrome/)
- [leetcode question link](https://leetcode.com/problems/palindrome-linked-list/description/)
- ![yt video link](https://www.youtube.com/watch?v=-DtNInqFUXs&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=36)