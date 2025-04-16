*16-04-2025 01:45*

*Status*:

*Tags*: [[dsa]] [[linked list]] [[medium question]]

# Convert Sorted Linked List to BST
- *Problem* *Statement*: 
	Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height-balanced binary search tree.


### Solution --> REDUNTANT UPDATE THIS
#### Approach 1
- The logic is similar to that of [[Create BST From Inorder Traversal]]
	- [[Find The Middle Of The Linked List]]
	- But keep in mind we need to track the left node of the middle node too so that we can attach the left of the root node to this node == slow_prev.
	- Create a root node with the middle of the linked list i.e slow->val. 
	- Make the left pointer of the slow_prev null.
	- Now for the left side we need to provide the start of the linked list until the root node itself - 1. 
	- For the right side , the start of the linked list is the slow->next.
	- *Keep in mind what needs to be passed to the recursive funtion.*

#### Code
```cpp
  TreeNode *sortedListToBST(ListNode *head) {
    if (head == nullptr) {
      return nullptr;
    }
    if (head->next == nullptr) {
      return new TreeNode(head->val);
    }

    ListNode *slow_prev = nullptr;
    ListNode *slow = head;
    ListNode *fast = head;

    while (fast && fast->next) {
      slow_prev = slow;
      slow = slow->next;
      fast = fast->next->next;
    }

    TreeNode *root = new TreeNode(slow->val);
    slow_prev->next = nullptr;
    root->left = sortedListToBST(head);
    root->right = sortedListToBST(slow->next);
    return root;
  }
```




#### Approach 2 -> Works for Merge 2 BSTs as well.

- In this , we first count the number of nodes in the list.
	- After that we say to the recurisve function to build the left subtree upto n /2.
	- The root will be the middle of the list i.e n/2 + 1.
	- The right subtree will be the n - n / 2 - 1.
	- So after building the left subtree , we assign the head to the root , move the head to the next elem , and the send this to the right subtree call.
	- *Remember to take the head pointer by reference.*

```cpp
  int countNodes(ListNode *root) {
    int n = 0;
    while (root) {
      n++;
      root = root->next;
    }
    return n;
  }
  TreeNode *DLLtoBST(ListNode *&head, int n) {
    if (head == NULL || n <= 0)
      return NULL;
    TreeNode *left = DLLtoBST(head, n / 2);
    TreeNode *root = new TreeNode(head->val);
    root->left = left;
    head = head->next;
    root->right = DLLtoBST(head, n - n / 2 - 1);
    return root;
  }


```



## References
- striver sheet link N/A
- [reference submission link](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/solutions/6515817/beats-100-best-interview-approach-notes/)
- [leetcode question link](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/)