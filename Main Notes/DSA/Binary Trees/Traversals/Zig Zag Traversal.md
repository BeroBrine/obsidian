*27-03-2025 17:08*

*Status*:

*Tags*: [[dsa]] [[trees]] [[traversals]]
## Zig Zag Traversal
- This traversal goes from L-R , then the next traversal goes from R-L.
- Uses [[Level Order Traversal]]
	![[Zig Zag Traversal 2025-03-27 18.55.35.excalidraw|800x300]]	
	

#### My Approach
- I was using the approach of if the level is even (L-R) i.e we need to add the nodes of the next level in reverse. I was pushing the child nodes in order of first the child node and then the left node.
- If the next level needed to be printed in R-L , i was pushing the child nodes in the order of first the left child and then the right child.
- To keep the track of what the next level traversal will be.
	- Kept a level_traversal variable which even suggested that the next level should be in R-L
	- If it was odd , then the next level should be printed in L-R.
- The issue with this approach was that it worked fine for binary trees. i.e every node had 2 children
	- But this failed for node which had one children (on a level) because the children pushed into the queue did not have adjacent nodes. So , on the level the nodes were not reversed. 
	![[Zig Zag Traversal 2025-03-27 19.08.44.excalidraw | 800x300]]	
### Algo
- Follows the same traversal as [[Level Order Traversal]]
	- But when we are on a level whose traversal we need is from R-L.
		- We reverse the level vec before pushing to the ans vec.
	- To track which level to reverse it's nodes for.
		- We keep a flag initialized to false , whenever we reverse the level vec , we set the flag to false
		- If the level needs to be printed from L-R , we set the flag to false.
	- We then push the level_vec into the ans vec.

## Code
```cpp
#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
  vector<vector<int>> zigzagLevelOrder(TreeNode *root) {
    vector<vector<int>> ans;
    if (root == nullptr) {
      return ans;
    }
    queue<TreeNode *> q;
    q.push(root);
    bool flag = false;
    while (!q.empty()) {
      int size = q.size();
      vector<int> level;
      for (int i = 0; i < size; i++) {
        auto node = q.front();
        q.pop();
        level.push_back(node->val);
        if (node->left != nullptr) {
          q.push(node->left);
        }
        if (node->right != nullptr) {
          q.push(node->right);
        }
      }
      if (flag == true) {
        reverse(level.begin(), level.end());
        flag = false;
      } else {
        flag = true;
      }
      ans.push_back(level);
    }
    return ans;
  }
};
// @leet end

```

## References
- [striver sheet link](https://takeuforward.org/data-structure/zig-zag-traversal-of-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=3OXWEdlIGl4&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)