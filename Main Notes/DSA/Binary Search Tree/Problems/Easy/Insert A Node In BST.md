*08-04-2025 20:18*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]]

# Insert A Node In BST
- You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

- Find where it can be inserted an d insert
	- Always at leaf position.



### Solution
-  In this , we are just moving left and right till desired leaf node and if it is we insert it there.
	- If there is a node in which it is smaller than the val but it has no right child we attach the val node to it's right and vice versa.

#### Code
```cpp
class Solution {
public:
  TreeNode *insertIntoBST(TreeNode *root, int val) {
    if (root == nullptr)
      return new TreeNode(val);
    TreeNode *node = root;
    while (true) {
      if (val > node->val) {
        if (node->right != nullptr) {
          node = node->right;
        } else {
          node->right = new TreeNode(val);
          break;
        }
      } else {
        if (node->left != nullptr) {
          node = node->left;
        } else {

          node->left = new TreeNode(val);
          break;
        }
      }
    }
    return root;
  }
};

```










## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=FiFiNvM29ps&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/insert-into-a-binary-search-tree/description/)