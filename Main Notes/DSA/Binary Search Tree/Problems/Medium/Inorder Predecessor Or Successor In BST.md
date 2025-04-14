*14-04-2025 19:02*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]] [[medium question]]

# Inorder Predecessor Or Successor In BST
- *Problem* *Statement*: 
	Inorder predecessor is the node which is immediately before a node in the [[Inorder]] traversal and successor is the one immediately after the node. 



### Solution
- As performing inorder traversal of a BST takes O(n) where n is the number of nodes.
	- We will be utilizing the property of bst.
		- To find the successor of a node , while we are moving left we can say that this is the potentional predecessor of the element. But there can be the correct predecessor in the left tree. So we move to the left
		- Reverse goes for the predecessor.


```cpp
void find_successor(TreeNode* root , TreeNode* p , TreeNode* successor = nullptr) {
	TreeNode* node = root;
	while(node) {
		if(p->val < node->val) {
			successor = node;
			node = node->left;
		}
		else {
			node = node->right;	
		}
	}
}
```











## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=SXKAD2svfmI&feature=youtu.be)
- leetcode question link N/A (Premium and Couldn't find the GFG Link)