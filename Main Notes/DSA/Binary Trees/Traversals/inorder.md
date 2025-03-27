*2025-03-24 14:16*

*Status:*

*Tags*: [[traversals]] [[dsa]] [[trees]]
 
## Inorder
- In this traversal , it goes L N R. meaning it prints the current node after traversing till no left child is found.

```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
//
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
	vector<int> inorderTraversal(TreeNode *root) {
	    vector<int> vec;
	    inorder(root, vec);
	    return vec;
	}
	  void inorder(TreeNode *root, vector<int> &vec) {
	    if (root == nullptr) {
	      return;
	    }
	    inorder(root->left, vec);
	    vec.push_back(root->val);
	    inorder(root->right, vec);
    }
};
// @leet end
```


## Iterative 
- This solutions uses Stack data structure (LIFO).
- In this solution , we first traverse the every left child of the node. if the left becomes null , we print the node and then go to it's right and then check for every left child. 

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
  vector<int> inorderTraversal(TreeNode *root) {
    vector<int> vec;
    stack<TreeNode *> st;

    if (root == nullptr) {
      return vec;
    }

    int cnt = 0;
    TreeNode *node = root;
    while (true) {
      cnt++;
      if (node != nullptr) {
        st.push(node); // remember to not push 
				   // node-> left. node must be pushed
        node = node->left;

      } else {
        if (st.empty() == true)
          break;
        node = st.top();

        vec.push_back(node->val);

        st.pop();
        node = node->right;
      }
    }

    return vec;
  }
};
// @leet end
```
## References
- [striver sde sheet](https://takeuforward.org/data-structure/inorder-traversal-of-binary-tree/)
- [striver channel yt video](https://www.youtube.com/watch?v=Z_NEgBgbRVI&ab_channel=takeUforward)
## Questions
- Check the question section of [[Main Notes/DSA/Binary Trees/Traversals/Preorder|Preorder]]