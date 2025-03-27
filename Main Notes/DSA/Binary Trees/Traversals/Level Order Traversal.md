 2025-03-26 12:57

Status:

Tags: [[traversals]] [[dsa]] [[trees]]
## Level Order Traversal

- Uses Queue data structure (FIFO)
- Traverses the tree in level wise order. From Left to Right
- vector<vector<int\>> stores the level order traversal. 
### Algo
- Push the root node into the queue.
- Take the size of the queue, and declare a new empty vec
- In the next iteration , take all of the nodes out of the queue , push their left and right child respectively. once this ends, push all of the nodes that were taken out of the queue into the vec.
- Push the level order vec into the parent vec.
- Return the parent vec.

```cpp
#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
  vector<vector<int>> levelOrder(TreeNode *root) {
    vector<vector<int>> vec;
    queue<TreeNode *> queue;

    if (root == nullptr) {
      return vec;
    }

    queue.push(root);
    while (!queue.empty()) {
      int size = queue.size();
      vector<int> level;
      for (int i = 0; i < size; ++i) {
        auto node = queue.front();
        queue.pop();
        if (node->left != nullptr)
          queue.push(node->left);
        if (node->right != nullptr)
          queue.push(node->right);
        level.push_back(node->val);
      }
      vec.push_back(level);
    }
    return vec;
  }
};
```


## References
- [striver sde sheet](https://takeuforward.org/data-structure/level-order-traversal-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=EoAsWbO7sqg&ab_channel=takeUforward)