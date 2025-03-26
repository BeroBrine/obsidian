2025-03-22 21:01

Status:

Tags: [[traversals]] [[dsa]] [[trees]]
## Preorder 
- Traversal in the form of Root Left Right

- First the node is printed , then traversal moves to the left , print the nodes until it encounters null on the left. then it backtracks and goes to the right of the previous node and continues the execution.

### Recursive
``` cpp
#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
	vector<int> preorderTraversal(TreeNode *root) {
	    vector<int> vec;
	    if (root == nullptr) {
	      return vec;
	    }
	    preorder(root, vec);
	    return vec;
	}
	void preorder(TreeNode *root, vector<int> &vec) {
	    if (root == NULL) {
	      return;
	    }
	    vec.push_back(root->val);
	    preorder(root->left, vec);
	    preorder(root->right, vec);
	}
};
```

### Iterative
- Uses stack data structure (LIFO)
	- The order in which elements are added is opposite.
	- First the node itself will be pushed , then the right will be pushed into the stack , then the left
		- This is due to the LIFO nature of stack.
	- The iteration is done as follow
		- Push the root node into the stack
		- Push the right child and left child (in-order).
		- When the next iteration begins , pop the top most element in the stack and then push it's right and left child into the stack.
		- Empty the stack.	
		
```cpp
// @leet start
#include <bits/stdc++.h>
using namespace std;

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
  vector<int> preorderTraversal(TreeNode *root) {
    vector<int> vec;
    stack<TreeNode *> st;

    if (root == nullptr) {
      return vec;
    }
    st.push(root);

    while (!st.empty()) {
	  auto root = st.top();
	  st.pop();
	  vec.push_back(root->val);
      if (root->right != nullptr) {
        st.push(root->right);
      }
      if (root->left != nullptr) {
        st.push(root->left);
      }
    }

    return vec;
  }
};
```



## References
- [striver youtube link](https://www.youtube.com/watch?v=RlUu72JrOCQ&ab_channel=takeUforward) 

## Question
- What is better? Iterative or Recursive? 
	- Iterative is better in terms of 
		- Memory 
			- In skewed trees, stack overflow may occur due to call stack limit may be exceeded.
			- using stack prevents this as heap size is much larger than call stack.
		- Avoiding Stack Overflow
			- Same as the reasons above.
		- [Tail-Recursive](https://www.google.com/search?client=ubuntu-sn&channel=fs&q=what+is+tail+recursive+function+) Optimization	
			- Some languages may not be optimized to handle tail recursive function.(Eg Rust)
			- Tail recursive functions are those that returns another recursive function when their call ends.