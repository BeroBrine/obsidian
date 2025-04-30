
2025-03-26 17:13

*Status*: [[revise]]

*Tags*: [[trees]] [[dsa]]  [[medium question]] 

## Diameter Of Tree
- *Problem* *Statement*: 
	Given the root of a binary tree, return the length of the diameter of the tree.
	
	The diameter of a binary tree is the length of the longest path between any two nodes in a tree. *This path may or may not pass through the root.*
	
	The length of a path between two nodes is represented by the number of edges between them.

	![[Diameter Of Tree 2025-03-26 17.16.24.excalidraw]]
	
	

### Algo
- For every node we calculate it's diameter.
	- Diameter is calculated by height(node->left) + height(node->right). We are not adding 1 for the current node as the diameter is counted in edges , not in nodes. 
		- Height is calculated by [[Height Of Binary Tree]]
	- This diameter gets compared to a value i.e max which is passed from the parent function. i.e it's atomic
	- after the recurstion completes . the max value contains the value of diameter of the tree.


### My Approach

```cpp
#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
  int diameterOfBinaryTree(TreeNode *root) {
    int max = INT_MIN;
    calculate_diameter(root, max);
    return max;
  }

  int calculate_diameter(TreeNode *root, int &maxi) {
    if (root == nullptr) {
      return 0;
    }

    int lh = height(root->left);
    int rh = height(root->right);

    int diam = lh + rh;
    maxi = max(maxi, diam);
    return 1 + calculate_diameter(root->left, maxi) +
           calculate_diameter(root->right, maxi);
  }
  int height(TreeNode *node) {
    if (node == nullptr)
      return 0;

    return 1 + max(height(node->left), height(node->right));
  }
};

```



## References
- [striver sheet link](https://takeuforward.org/data-structure/calculate-the-diameter-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=Rezetez59Nk&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/diameter-of-binary-tree/)
