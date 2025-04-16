*15-04-2025 23:53*

*Status*:

*Tags*: [[dsa]] [[linked list]]

# Merge 2 Sorted Linked List
- *Problem* *Statement*: 
	You are given the heads of two sorted linked lists list1 and list2.
	
	Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
	
	Return the head of the merged linked list.

### Solution
- Take 2 pointers head and tail.
	- These will be initialized to the smaller head of both the linked list and move the head of the linked list in which it is initialized to Eg if list1 head is smaller , head and tail will become list1 and list1 will be moved next.
	
	- Now compare if list1->val < list2->val , if this is the case then we know that the list2 node must occurr later in the linked list , so what we do is tell the tail that this node is your next node , so tail -> next = list1 and then tail becomes list1 and list1 is moved further 
	- But if this is not the case , then we know that this node must occurr after the tail , wherever the tail is , so we append this node in front of the tail i.e tail -> next = list2 , tail becomes now list2 and list2 is moved further because we still need to compare for the list1 node. 
	- Now comes the case that if the list are not equal , so what we do is check which one of the list head is not null , for eg list2 is empty now but list1 remains , we still need to attach the list1 nodes to the final linked list. So we repeat the tail -> next = list1 , tail = list1 , list1 = list1 -> next , so that the nodes are appended. 
	- *Remember the base cases*
### Code
```cpp
  ListNode *mergeTwoLists(ListNode *list1, ListNode *list2) {
    ListNode *head = nullptr;
    ListNode *tail = nullptr;
    if (!list1 and !list2) {
      return head;
    }
    if (!list1) {
      return list2;
    }
    if (!list2) {
      return list1;
    }
    while (list1 and list2) {
      if (list1->val <= list2->val) {
        if (!head) {
          head = list1;
          tail = list1;
          list1 = list1->next;

        } else {
          tail->next = list1;
          tail = list1;
          list1 = list1->next;
        }

      } else {
        if (!head) {
          head = list2;
          tail = list2;
          list2 = list2->next;

        } else {
          tail->next = list2;
          tail = list2;
          list2 = list2->next;
        }
      }
    }
    while (list1) {
      tail->next = list1;
      tail = list1;
      list1 = list1->next;
    }
    while (list2) {
      tail->next = list2;
      tail = list2;
      list2 = list2->next;
    }
    return head;
  }

```


## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=18w8VduomfI&t=1698s&ab_channel=CodeHelp-byBabbar)
- [leetcode question link](https://leetcode.com/problems/merge-two-sorted-lists/)