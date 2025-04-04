*2025-03-26 12:55*
 
Status: [[revise]]

Tags: [[medium question]] [[dsa]] [[trees]]
## Height Of Binary Tree
- Two approaches. 
	- Recursive (Generally used)
		- O(height of the tree) -> worst case scenario of a skewed tree
	- Level Order -> height is the number of levels.
		- O(N) -> worst case when last level of the tree is completely filled

- Recursive approach 
	- In this , whenever a new node is encountered by the function. It's height is added and the function recurses further finding the height of the subtree. we take the max of height of left subtree and the right subtree
	- 1 + max(func(node->left , node->right));
	- if the node is null , it has no height and 0 is returned. if it is a node , it adds 1 and then traverses to the left and right subchild and the recursion goes on.

```cpp
#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
  int maxDepth(TreeNode *root) { return helper(root); }

  int helper(TreeNode *node) {
    if (node == nullptr) {
      return 0;
    }
    return 1 + max(helper(node->left), helper(node->right));
  }
};
```


## References
- [striver sheet link](https://takeuforward.org/data-structure/maximum-depth-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=eD3tmO66aBA&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/binary-tree-level-order-traversal/)