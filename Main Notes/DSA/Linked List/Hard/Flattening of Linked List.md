*24-07-2025 18:47*

*Status*:

*Tags*: [[dsa]] [[linked list]] [[hard]] 
# Flattening of Linked List

##### Problem Statement
Given a linked list containing n head nodes where every node in the linked list contains two pointers:
(i) next points to the next node in the list.
(ii) bottom pointer to a sub-linked list where the current node is the head.
Each of the sub-linked lists nodes and the head nodes are sorted in ascending order based on their data.
Your task is to flatten the linked list such that all the nodes appear in a single level while maintaining the sorted order.

Note:
1. ↓ represents the bottom pointer and -> represents the next pointer.
2. The flattened list will be printed using the bottom pointer instead of the next pointer.
![[Pasted image 20250724192528.png]]
##### Solution
- This question uses [[Merge 2 Sorted Linked List]].
	- In this question we can observe that we need to merge the bottom lists of the two nodes.
- What we can do is recursively merge the lists and then attach their heads/bottom to the next node.
- Starting with the last 2 nodes , we can merge the bottom lists , and then return the new head of the merged lists to the previous node 

- To achieve this
	- Recurse till root -> next is null
	- Then return this node to the previous recursive call , then merge the two nodes , return the new head

- **Remember in this question we have to merge by bottom pointers , as we are making one long list which traverses in the bottom (written in the question)**
##### Handwritten Notes
![[Flatten linked list.pdf]]
##### Code
```cpp
/* Node structure  used in the program

struct Node{
    int data;
    struct Node * next;
    struct Node * bottom;

    Node(int x){
        data = x;
        next = NULL;
        bottom = NULL;
    }

};
*/

class Solution {
  public:
    // Function which returns the  root of the flattened linked list.
   
    Node *mergeTwoList(Node* a , Node* b) {
        if(!a) return b;
        if(!b) return a;
        
        Node* tail = nullptr;
        Node* head = nullptr;
        while(a and b) {
            if(a->data <= b->data) {
                if(!head) {
                    head = a;
                    tail = a;
                    a = a->bottom;
                } else {
                    tail -> bottom = a;
                    tail = tail -> bottom;
                    a = a -> bottom;
                }
            }
            else {
                if(!head) {
                    head = b;
                    tail = b;
                    b = b->bottom;
                } else {
                    tail -> bottom = b;
                    tail = tail -> bottom;
                    b = b -> bottom;
                }
            }
        }
        while(a) {
            tail ->bottom= a;
            tail  = tail -> bottom;
            a = a -> bottom;
        }
        
        while(b) {
            tail -> bottom  = b;
            tail = tail ->bottom;
            b = b -> bottom;
        }
        
        return head;
        
    }
    
    Node* flatten(Node* root) {
        if(!root ) return nullptr;
        Node* newHead = nullptr;
		// recurse till root-> next exists
        if(root->next) {
            newHead = flatten(root->next);
        }
		// merge the head
        Node* mergeHead = mergeTwoList(newHead , root);
        return root;
    }
    
};
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/flattening-a-linked-list/)
- [GFG question link](https://www.geeksforgeeks.org/problems/flattening-a-linked-list/1)
- ![yt video link]()