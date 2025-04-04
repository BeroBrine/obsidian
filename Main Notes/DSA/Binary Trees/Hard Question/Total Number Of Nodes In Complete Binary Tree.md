*04-04-2025 02:42*

*Status*: [[revise]]

*Tags*: [[dsa]] [[quirky]] [[trees]] [[hard]]

# Total Number Of Nodes In Complete Binary Tree
- *Problem* *Statement*: 
	Given the root of a complete binary tree, return the number of the nodes in the tree *in less than O(n) of time*

- Complete binary tree is a tree in which all levels are fully filled , except possibly the last level , which is filled from left to right.
- The number of nodes in complete binary tree , is 2^h - 1. Where h is the height of the complete binary tree. 
## Solution
- In this question , from starting node , we will check if it is a complete binary tree.
	- If the height of left nodes is equal to the height of right nodes from a node. It is a complete binary tree.
	- Code to compute the height of left and right tree.
	- If left_height == right_height -> then the tree is a complete binary tree and we can use the formula 2^h - 1 to directly compute the number of nodes for the subtree.
	- If the left_height != right_height -> then we need to recurse further and check for it's subchilds that if they form a complete binary tree.
		- We return + 1 to accomodate for the height of the current node we are standing upon.


#### Complete Code
```cpp
class Solution {
public:
  int countNodes(TreeNode *root) {
    if (root == nullptr) {
      return 0;
    }
    int lh = heightOfLeft(root->left);
    int rh = heightOfRight(root->right);
    if (lh == rh) {
      return (1 << lh) - 1; // complete tree
    } else {
      return 1 + countNodes(root->left) + countNodes(root->right); // check for the childs.
    }
  }

  int heightOfLeft(TreeNode *root) {
    if (root == nullptr) {
      return 1;
    }
    return 1 + heightOfLeft(root->left);
  }

  int heightOfRight(TreeNode *root) {
    if (root == nullptr) {
      return 1;
    }
    return 1 + heightOfRight(root->right);
  }
};

```








## References
- [striver sheet link](https://takeuforward.org/binary-tree/count-number-of-nodes-in-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=u-yWemKGWO0&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/count-complete-tree-nodes/description/)