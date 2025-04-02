*01-04-2025 23:17*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[trees]] [[hard]]
 
# Lowest Common Ancestor
- *Problem* *Statement*: 
	- Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
	

### Ancestor
- The ancestor of two nodes , is a node which lies in the path of both of the two nodes and is at the deepest level

	![[Pasted image 20250401232459.png]]

	
- The bruteforce approach for this will be to get the path to the node through [[Root To Node Path In Binary Tree]] for both the given nodes.  
- This is unoptimal because the time complexity will be O(n) + O(n). We can eliminate additional time complexity.
## Algo
- Starting from the root node.
	- We check if the node is equal to nullptr or equal to either of the two nodes whose ancestor we need to find.
		- And we return the value of root. i.e if it was null it would be null , if it was p it would return p , if it was q it would return q.
	- *We traverse in the left first.*
	- we traverse in the right now.
	- IMP
		- now we check if at the current node. the left is null , if it is null return right.
		- if the right is null return left.
		- if none of them are null , that means this node is the ancestor as from the left it recieved a node and from the right it recieved a node. We return this node.

```cpp
class Solution {
public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (root == nullptr || root == p || root == q) {
      return root;
    }

    auto l = lowestCommonAncestor(root->left, p, q);
    auto r = lowestCommonAncestor(root->right, p, q);
    if (l == nullptr) {
      return r; 
    } else if (r == nullptr) {
      return l;
    } else {
      return root;
    }
  }
};

```



## References
- [striver sheet link](https://takeuforward.org/data-structure/lowest-common-ancestor-for-two-given-nodes/)
- [yt video link](https://www.youtube.com/watch?v=_-QHfMDde90&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)