2025-03-24 14:09

Status: [[ongoing]]

Tags: [[traversals]] [[dsa]]

## Postorder
- Traversal in the form of Left Right Node
- The recursion will occur until left subtree , then if it encounters a node which has no left child , it'll go into the right node and check for it's left child , if it has left it'll continue till left.
- It'll continue until it encounters a node which has no child.
- It then will print it and then go back to it's last node and check for it's right node. If it finds one it'll go to it and if not ,
  it'll print it.

```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start

// struct TreeNode {
//   int val;
//   TreeNode *left;
//   TreeNode *right;
//   TreeNode() : val(0), left(nullptr), right(nullptr) {}
//   TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
//   TreeNode(int x, TreeNode *left, TreeNode *right)
//       : val(x), left(left), right(right) {}
// };
class Solution {
public:
  vector<int> postorderTraversal(TreeNode *root) {
    vector<int> vec;
    postorder(root, vec);
    return vec;
  }

  void postorder(TreeNode *node, vector<int> &vec) {
    if (node == nullptr) {
      return;
    }

    postorder(node->left, vec);
    postorder(node->right, vec);
    vec.push_back(node->val);
  }
};
// @leet end
```

## Using 2 stacks
- This traversal uses 2 stacks
	- In this , the first stack contains the L R N traversal as usual , i.e , go to the root , push it in stack , push it's left and right child respectively.
	- After this, 

```cpp
```





## References
- [striver sde sheet link](https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2/)
- [striver channel yt video (without stack)](https://www.youtube.com/watch?v=COQOU6klsBg&ab_channel=takeUforward)
- [with stack yt video](https://www.youtube.com/watch?v=2YBhNLodD8Q&ab_channel=takeUforward)