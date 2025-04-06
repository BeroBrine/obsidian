
*01-04-2025 21:29*

*Status*:

*Tags*: [[dsa]] [[trees]] [[follow up]] [[medium question]]

# Mirrored Tree
- *Problem* *Statement*: 
	- Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
		![[Pasted image 20250401213209.png]]

## Recusrively [My Approach]
- In this approach , starting from the root node. 
	- Test if the value of left child of the node and the right child of the node is same or not
	- For eg , of node 2 (left), check if it's left child is equal to that of node2 (right) right child
	- Test this for both the childs. comparing them to their mirrored part.
	- If one of them returns a false , all of them should return a 


```cpp
class Solution {
public:
  bool isSymmetric(TreeNode *root) { return test(root->left, root->right); }
  bool test(TreeNode *node1, TreeNode *node2) {
    if (node1 == nullptr && node2 == nullptr) {
      return true;
    }
    if (node1 == nullptr || node2 == nullptr) {
      return false;
    }
    if (node1->val != node2->val) {
      return false;
    }
    return test(node1->left, node2->right) && test(node1->right, node2->left);
  }
};

```

## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link](https://leetcode.com/problems/symmetric-tree/)

## Follow Ups
- Convert to Iterative Version