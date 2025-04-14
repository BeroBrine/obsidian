*14-04-2025 18:08*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]] [[medium question]]

# LCA In Binary Search Tree
- *Problem* *Statement*: 
	Similar problem as [[Lowest Common Ancestor]]. But this time it's in a BST.
	So devise an algorithm which runs in O(H) where H is the height of the tree.

### Solution.
- We use the property of BST.
	- If both of the values of p and q are less than the current node. We can be sure that they lie on the left side of the node and vice versa.
	- But if there is a node in which p lies on one side and q lies on another side. Then this must be the Lowest Common Ancestor as from here the path diverges.

#### Code
```cpp
class Solution {
public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    return helper(root, p, q);
  }

  TreeNode *helper(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (root == nullptr || root == p || root == q) {
      return root; // this is to check if we encounter any of the node first.
    }

    if (p->val < root->val and q->val < root->val) {
      return helper(root->left, p, q);
    } else if (p->val > root->val and q->val > root->val) {
      return helper(root->right, p, q);
    } else {
      return root;
    }
  }
};
```


## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=cX_kPV_foZc&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)