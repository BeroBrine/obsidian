*16-04-2025 18:36*

*Status*:

*Tags*: [[dsa]] [[bst]] [[trees]] 

# Two Sum For BST
- *Problem* *Statement*: 
	Given the root of a binary search tree and an integer k, return true if there exist two elements in the BST such that their sum is equal to k, or false otherwise.

#### Solution => My Approach
- For every nodes , check if the complement of k exists for it. Remember to not check for the nodes itself.

##### Code
```cpp
class Solution {
public:
  bool findTarget(TreeNode *root, int k) { return traverse(root, root, k); }

  bool traverse(TreeNode *node, TreeNode *root, int k) {
    if (node == nullptr)
      return false;

    int complement = k - node->val;
    if (search(root, node, complement)) {
      return true;
    }

    return traverse(node->left, root, k) || traverse(node->right, root, k);
  }

  bool search(TreeNode *root, TreeNode *exclude, int target) {
    while (root != nullptr) {
      if (root->val < target) {
        root = root->right;
      } else if (root->val > target) {
        root = root->left;
      } else {
        return root != exclude; // ensure we don't use the same node twice
      }
    }
    return false;
  }
};

```



## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=ssL3sHwPeb4&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)