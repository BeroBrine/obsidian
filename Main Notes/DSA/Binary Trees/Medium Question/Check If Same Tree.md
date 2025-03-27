2025-03-27 16:40

*Status*: [[complete]]

*Tags*: [[dsa]] [[trees]] [[medium question]]

## Check If Same Tree
- *Problem* *Statement*: 
	Given the roots of two binary trees p and q, write a function to check if they are the same or not.
	
	*Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.*
	![[Check If Same Tree 2025-03-27 16.44.22.excalidraw| 800x300]]	

#### Conditions
- The conditions in which the tree is not same is
	- If node1 || node2 becomes null , but one of them is not null. (structurally different)
		- Meaning that one node has become null but the other tree has a node at the place
	- If node1 -> val != node2 -> val 
#### My Approach
 - For each node , check it's value and then check move to it's right and left child 

### Algo
-  For node p in tree 1 and for node q in tree 2
	- Check if p and q are null at the same time, if true then both of the nodes are surely identical.
	- if p || q is null. then it means the tree is not identical and we need to return false
	- if value of both the nodes are not same , then also we will return false.

### Code
```cpp
class Solution {
public:
  bool isSameTree(TreeNode *p, TreeNode *q) { return checkTree(p, q); }

  bool checkTree(TreeNode *p, TreeNode *q) {
    if (p == nullptr && q == nullptr) {
      return true;
    }
    if (p == nullptr || q == nullptr) {
      return false;
    }
    if (p->val != q->val) {
      return false;
    }
    return checkTree(p->left, q->left) && checkTree(p->right, q->right);
  }
};
```

## References
- [striver sheet link](https://takeuforward.org/data-structure/check-if-two-trees-are-identical/)
- [yt video link](https://www.youtube.com/watch?v=BhuvF_-PWS0&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/same-tree/)