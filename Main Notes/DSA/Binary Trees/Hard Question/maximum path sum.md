
2025-03-27 01:09

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[hard]]

## maximum path sum
- *Problem* *Statement*: 
	A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.
	
	The path sum of a path is the sum of the node's values in the path.
	
	Given the root of a binary tree, return the maximum path sum of any non-empty path.
	![[maximum path sum 2025-03-27 01.13.26.excalidraw|800x300]]

	![[maximum path sum 2025-03-27 02.00.12.excalidraw|800x300]]

### Algo
 - For every node 
	 - We are calculating the max path sum for it's left subtree and right subtree.
	 - Then there is a global variable called maxi , which is being updated with the total path sum i.e val + l_height + r_height.
	 - *But we are returning val + max(l_height , r_height) to the parent node*
		 - Why? Because we need to tell the parent node which path to take so that it can maximize it's path sum
			 - If we returned 42 from the 20 node, the parent will not know for itself what path to take.
	- We are also checking that if any subtree returns negative , there's no use to include it in calculation as it's definitely not the path for the maximum sum. So we return 0 for that subtree. 

#### My approach
```cpp
class Solution {
public:
  int maxPathSum(TreeNode *root) {
    int maxi = INT_MIN;
    calculatePath(root, maxi);
    return maxi;
  }

  int calculatePath(TreeNode *root, int &maxi) {
    if (root == nullptr) {
      return 0;
    }
    int l_sum = calculateVal(root->left);
    int r_sum = calculateVal(root->right);
    int val = root->val;
    cout << "the l_sum is " << l_sum << " and the r_sum is " << r_sum
         << " for the node " << root->val << endl;
    maxi = max(maxi, max(l_sum + r_sum + val, val));
    return root->val + calculatePath(root->right, maxi) +
           calculatePath(root->left, maxi);
  }
  int calculateVal(TreeNode *root) {
    if (root == nullptr) {
      return 0;
    }
    return root->val + calculateVal(root->left) + calculateVal(root->right);
  }
};

```

 - The issue in the above approach was that each node was telling it's parent node that this is the maximum path sum including me. The parent node needs to know the path not the sum so it can maximize itself.

#### Correct Code
```cpp
class Solution {
public:
  int maxPathSum(TreeNode *root) {
    int maxi = INT_MIN;
    calculateVal(root, maxi);
    return maxi;
  }

  int calculateVal(TreeNode *root, int &maxi) {
    if (root == nullptr) {
      return 0;
    }
    int l_sum = max(0, calculateVal(root->left, maxi));
    int r_sum = max(0, calculateVal(root->right, maxi));
    int val = root->val;
    maxi = max(maxi, l_sum + r_sum + val);
    return root->val + max(l_sum, r_sum);
  }
};

```


## References
- [striver sheet link](https://takeuforward.org/data-structure/maximum-sum-path-in-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=WszrfSwMz58&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/binary-tree-maximum-path-sum/)