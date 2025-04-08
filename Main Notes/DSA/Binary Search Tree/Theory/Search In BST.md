*07-04-2025 22:02*

*Status*:

*Tags*: [[dsa]] [[bst]] [[trees]] [[theory]]
 
# Search In BST
- We utilize the property of bst in which left is always smaller than the parent node and right is always bigger than the parent node.
- If val greater than the current node , then it's sure that the val is residing in the right subtree of the current node so we recurse to the right.
- If val less than the current node , then it's sure that the val is residing in the left subtree of the current node so we recurse to the left.


#### Code
```cpp
TreeNode *searchBST(TreeNode *root, int val) {
if (root == nullptr) {
  return root;
}
if (root->val == val) {
  return root;
}
if (root->val < val) {
  return searchBST(root->right, val);
} else
  return searchBST(root->left, val);
}

```









## References
- [striver sheet link](https://takeuforward.org/data-structure/search-in-a-binary-search-tree-2/)
- [yt video link](https://www.youtube.com/watch?v=KcNt6v_56cc&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/search-in-a-binary-search-tree/)
