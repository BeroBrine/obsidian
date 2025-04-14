*14-04-2025 17:41*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]] [[medium question]]

# Valid BST Or Not
- *Problem* *Statement*: 
	Given the root of a binary tree, determine if it is a valid binary search tree (BST).
	
	A valid BST is defined as follows:

	* The left subtree of a node contains only nodes with keys less than the node's key.
	
	* The right subtree of a node contains only nodes with keys greater than the node's key.
	
	* Both the left and right subtrees must also be binary search trees.

### Solution
- We know that inorder traversal of binary tree will always yield values in increasing order.
	- If we use [[Morris Inorder Traversal]] , we can eliminate space complexity and then check if the tree is strictly increasing or not.
	- We also check for duplicate values because if they are duplicate inorder will yield them sequentally.  
	- Keep in mind that in the LC question , the node val can be INT_MIN or INT_MAX. So to compare things , keep the comp_val as LONG_MIN
	- *Also , don't break early if the flag becomes false , i.e it is not a bst. Because the thread made by morris traversal may still be there and if future code refernces this tree it'll stack overflow due to infinite loop.*
### Code
```cpp
class Solution {
public:
  bool isValidBST(TreeNode *root) {
    TreeNode *node = root;
    long last_val = LONG_MIN;
    bool flag = true;
    while (node) {
      if (node->left == nullptr) {
        if (last_val >= node->val) {
          flag = false;
        }
        last_val = node->val;
        node = node->right;
      } else {
        TreeNode *prev = node->left;
        while (prev->right and prev->right != node) {
          prev = prev->right;
        }
        if (!prev->right) {
          prev->right = node;
          node = node->left;
        } else {
          prev->right = nullptr;
          if (last_val >= node->val) {
            flag = false;
          }
          last_val = node->val;
          node = node->right;
        }
      }
    }
    return flag;
  }
};
```

## References
- striver sheet link N/A
- [yt video link](https://youtu.be/f-sj7I5oXEI)
- [leetcode question link](https://leetcode.com/problems/validate-binary-search-tree/)