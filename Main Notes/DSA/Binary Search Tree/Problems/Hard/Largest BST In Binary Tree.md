*16-04-2025 20:56*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[trees]] [[bst]] [[hard]]

# Largest BST In Binary Tree
- *Problem* *Statement*: 
	Given a binary tree root, return the maximum sum of all keys of any sub-tree which is also a Binary Search Tree (BST).
	
	Assume a BST is defined as follows:

	* The left subtree of a node contains only nodes with keys less than the node's key.
	
	* The right subtree of a node contains only nodes with keys greater than the node's key.
	
	* Both the left and right subtrees must also be binary search trees.
	![[Pasted image 20250417002819.png]]
	
### Solution
- In this , we are essentially doing [[Postorder]] traversal , because for each node we need it's left subtree and then right subtree processed first. 
	- On each node , we will have to validate that if including this node , is it a BST?
		- For this what we can check is that the max value from the left subtree must be smaller than the node's val and the minimum value from the right subtree must be greater than the node.
		- If this is the case , then including this node we are sure that this is a bst.
		- Now we need to tell some information to the parent node , for it's parent node what should be the minimum value it's expecting? We know that minimum value must lie in the left subtree. So the min value is the min of current node and the left's min.
		- Same is done for the right subtree , we are telling the parent that the max value from your subtree is the max of mine and the max value i received from my right subtree.
		- The condition of isBst eliminates the need to set the min and max value to such numbers so that for the parent node the condition is not evaluated. 
			- This ensures that only valid bsts are included in the calculation of the sum.


#### Code
```cpp

class Solution {
public:
  int maxSum = 0;

  struct Info {
    bool isBst;
    int sum;
    int min;
    int max;
  };
  int maxSumBST(TreeNode *root) {
    check(root);
    return maxSum;
  }

  Info check(TreeNode *node) {
    if (node == nullptr) {
      return {true, 0, INT_MAX, INT_MIN};
    }

    Info l = check(node->left);
    Info r = check(node->right);

    if (l.isBst and r.isBst and l.max < node->val and node->val < r.min) {
      int sum = l.sum + r.sum + node->val;
      maxSum = max(maxSum, sum);
      return {true, sum, min(node->val, l.min), max(node->val, r.max)};
    }
    return {false, 0, 0, 0};
  }
};

```







## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=X0oXMdtUDwo&ab_channel=takeUforward)
- [leetcode question link]()