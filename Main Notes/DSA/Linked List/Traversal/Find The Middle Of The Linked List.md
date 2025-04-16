*16-04-2025 01:51*

*Status*:

*Tags*: [[dsa]] [[linked list]] [[traversals]]

# Find The Middle Of The Linked List
- Two Approach
	- Bruteforce is to find the length of the list and then if odd returning the n/2 + 1 elem and if even returning the n/2 elem.
	- Using the slow fast pointer approach

#### Slow Fast Ptr Approach
- In this we keep a slow ptr which will traverse the nodes one by one and a fast pointer which will traverse the nodes by 2.
- When the fast ptr becomes null i.e at the end of the list , we are sure that the slow pointer is pointing at the middle of the list.

- *Keep in mind the condition inside the while loop. If fast->next becomes null then fast->next->next will produce nullptr access error.*
##### Code
```cpp
ListNode* middle(ListNode* head) {
	if(head == nullptr) {
	return nullptr
	}
	ListNode* slow = head;
	ListNode* fast = head;
	while(fast && fast->next) {
		slow = slow->next;
		fast = fast->next->next;
	}
	return slow;
}
```








## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link]()