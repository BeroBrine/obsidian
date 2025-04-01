*01-04-2025 21:11*

*Status*:

*Tags*: [[dsa]] [[trees]] [[views]]
# Right View
- The right view of a tree is 
	-![[Right View 2025-04-01 21.13.48.excalidraw|800x300]] 
-	
## Algo [My Approach]
- Same as that of [[Top View]] and [[Bottom View]].
	- Just the change is that instead of tracking vertical_level , i am tracking the horizontal level.

### Code
```cpp
class Solution {
public:
  vector<int> rightSideView(TreeNode *root) {
    vector<int> vec;
    map<int, int> map;
    queue<pair<TreeNode *, int>> q;

    if (root == nullptr) {
      return vec;
    }
    q.push({root, 0});
    while (!q.empty()) {
      auto pair = q.front();
      q.pop();
      auto node = pair.first;
      int level = pair.second;
      map[level] = node->val;
      if (node->left != nullptr)
        q.push({node->left, level + 1});

      if (node->right != nullptr)
        q.push({node->right, level + 1});
    }
    for (auto i : map) {
      vec.push_back(i.second);
    }

    return vec;
  }
};


```

## References
- [striver sheet link](https://takeuforward.org/data-structure/right-left-view-of-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=KV4mRzTjlAk&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/binary-tree-right-side-view/)