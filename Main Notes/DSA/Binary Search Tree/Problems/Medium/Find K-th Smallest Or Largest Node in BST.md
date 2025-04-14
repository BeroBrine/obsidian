*09-04-2025 22:23*

*Status*:

*Tags*: [[dsa]] [[bst]] [[trees]] [[medium question]]
 
# Find K-th Smallest Or Largest Node in BST
- *Problem* *Statement*: 
	Given the root of a binary search tree, and an integer k, return the k^th smallest value (1-indexed) of all the values of the nodes in the tree.


#### Solution
- Perform an [[Inorder]] traversal of the binary tree.
	- Reverse if max is required.
- Inorder of binary tree will always give nodes in ascending order.
- Return the kth element from the inorder list.
- I have performed [[Morris Inorder Traversal]] for this question
##### Code
```cpp
class Solution {
public:
  int kthSmallest(TreeNode *root, int k) {
    vector<int> vec;
    inorder(root, vec);
    int index_zero = --k;
    return vec[k];
  }
  void inorder(TreeNode *node, vector<int> &vec) {
    while (node) {
      if (node->left == nullptr) {
        vec.push_back(node->val);
        node = node->right;
      } else {
        TreeNode *prev = node->left;
        while (prev->right && prev->right != node) {
          prev = prev->right;
        }
        if (prev->right == nullptr) {
          prev->right = node;
          node = node->left;
        } else {
          prev->right = nullptr;
          vec.push_back(node->val);
          node = node->right;
        }
      }
    }
  }
};

```







## References
- [striver sheet link](https://takeuforward.org/data-structure/kth-largest-smallest-element-in-binary-search-tree/)
- [yt video link](https://www.youtube.com/watch?v=9TJYWh0adfk&feature=youtu.be)
- [leetcode question link]()