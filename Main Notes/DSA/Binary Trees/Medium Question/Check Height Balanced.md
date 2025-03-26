
2025-03-26 14:41

*Status*: 

*Tags*: [[dsa]] [[medium question]] 

## Check Height Balanced
- *Problem* *Statement*: Given a binary tree, determine if it is height-balanced.

 - Balanced = For every node {Height(LeftSubtree) - Height(RightSubtree) <= 1}
 
	![[Drawing 2025-03-26 15.10.20.excalidraw|800x300]]
### Algo 
- For every node , we find the height of it's left subtree and the height of it's right subtree.([[Height Of Binary Tree]])
	- If the absolute difference of both is > 1. then it's definitely not balanced so we return false.
	- If it's balanced. We then check for it's left child and it's right child. Both of them must return true for the tree to be balanced. Even if one of them returns false. The whole function returns false in whole recursion.

```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
public:
  bool isBalanced(TreeNode *root) {
    if (root == nullptr) {
      return true;
    }
    return check(root);
  }

  bool check(TreeNode *root) {
    if (root == nullptr) {
      return true;
    }
    int lh = height(root->left);
    int rh = height(root->right);

    if (abs(lh - rh) > 1) {
      return false;
    }
    return check(root->left) && check(root->right);
  }
  int height(TreeNode *node) {
    if (node == nullptr) {
      return 0;
    }

    return 1 + max(height(node->left), height(node->right));
  }
};
// @leet end

```


## Edge Cases 
- *Cases*
	- Skewed Binary Tree -> Solved by using absolute difference.
				![[Check Height Balanced 2025-03-26 15.58.27.excalidraw]]
	- This tree -> solved by converting check function to visit every node. before it was checking for just the root node.
## References
- [striver sheet link](https://takeuforward.org/data-structure/check-if-the-binary-tree-is-balanced-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=Yt50Jfbd8Po&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/balanced-binary-tree/)