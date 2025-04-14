*08-04-2025 20:39*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[trees]] [[bst]] [[medium question]]

# Delete A Node In Binary Search Tree
- *Problem* *Statement*: 
	Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
	
	Basically, the deletion can be divided into two stages:
	1. Search for a node to remove.
	
	2. If the node is found, delete the node.

#### Solution
- Let's understand by code
	- if the node to be deleted is less than the current node. It is surely on the left side.
		- But why root->left?
			- It is because we need to play with the pointer of the parent node itself. Returning recursively will attach the node to the parent's left
	- Same for the right side. 
	- Now if the node is found , we first check that if there's a node we are trying to attach the parent node with. If there is no left we just attach the parent to the node's right tree and it'll work because the right tree will always be smaller than the parent node.
	- Same goes for the left side.
	- Now if there exists a right tree as well left tree.
		- *We find the least node from the right tree.* Why? Because replacing the current node with it will ensure that the left subtree is always less and the right subtree is always greater.
		- We replace it with the leftmost leaf node in the right tree.
		- After replacing , we need to delete the leaf node we replaced it with.
		- So for this node's right ptr , we recursively call the deleteNode function with the key being the leaf node val.
		- For the leaf node the function reaches the if(!root->left) return root->right;
			- Now because leaf nodes both left and right consists of nullptr. It'll return nullptr 
			- So the parent's left ptr becomes nullptr which mean's it deletes the leaf node.
	- After processing all of this , we return the root
##### It will handle the edge case of deleting the root node as well as we replace the least node from the right subtree with it and then delete the leaf node.



```cpp
class Solution {
public:
  TreeNode *deleteNode(TreeNode *root, int key) {
    if (root == nullptr) {
      return root;
    }
    if (key < root->val) {
      root->left = deleteNode(root->left, key);
    } else if (key > root->val) {
      root->right = deleteNode(root->right, key);
    } else {
      if(!root->left) return root->right;
      if(!root->right) return root->left;
      // Node Found
      TreeNode *sub = getMin(root->right);
      root->val = sub->val;
      root->right = deleteNode(root->right, sub->val);
    }
    return root;
  }
  TreeNode *getMin(TreeNode *node) {
    while (node && node->left) {
      node = node->left;
    }
    return node;
  }
};

```









## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=kouxiP_H5WE&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/delete-node-in-a-bst/)