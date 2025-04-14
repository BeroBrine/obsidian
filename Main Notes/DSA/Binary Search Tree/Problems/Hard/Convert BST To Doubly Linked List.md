*15-04-2025 01:38*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]] [[linked list]] [[hard]]

# Convert BST To Doubly Linked List
- *Problem* *Statement*: 
	You are provided with a Binary Search Tree (BST), all you have to do is to convert it into the sorted doubly linked list (DLL).

### Solution
- In this , what we are doing is similar to that of [[Flattern Binary Tree To Linked List]].
	- But we need to return DLL.
	- So we keep prev ptr which will track the last node.
	- Now we first recurse into the right. on the last node , we set it's right to prev which is initially null.
	- Now if prev is not null , we assign it's left to node. Setting both the ptrs , now moving left from the prev will yield the root node and moving right from the node will yield prev.
	- *Read The Code To Better Understand*

### Solution
```cpp
void convert(TreeNode<int> *root , TreeNode<int> *&node) {
    if(root == nullptr) {
        return;
    }

    convert(root->right , node);

    root ->right = node;
    if(node)
        node->left = root;
    node = root;

    convert(root->left , node);
    
}
 
TreeNode<int>* bstToSortedDLL(TreeNode<int> *root)
{
    TreeNode<int> *head = nullptr;
    convert(root , head);
    return head;
	
}
```








## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=18w8VduomfI&t=1658s&ab_channel=CodeHelp-byBabbar)
- [CodingNinjas question link](https://www.naukri.com/code360/problems/bst-to-sorted-dll_1263694)