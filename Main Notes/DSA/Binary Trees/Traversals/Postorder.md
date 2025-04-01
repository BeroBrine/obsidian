*2025-03-24 14:09*

*Status*: [[ongoing]]

*Tags*: [[traversals]] [[dsa]] [[trees]]
## Postorder
- Traversal in the form of Left Right Node
- The recursion will occur until left subtree , then if it encounters a node which has no left child , it'll go into the right node and check for it's left child , if it has left it'll continue till left.
- It'll continue until it encounters a node which has no child.
- It then will print it and then go back to it's last node and check for it's right node. If it finds one it'll go to it and if not ,
  it'll print it.

```cpp
#include <bits/stdc++.h>
using namespace std;
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
```

## Using 2 stacks
- This traversal uses 2 stacks
	- In this , the first stack contains the L R N traversal as usual , i.e , go to the root , push it in stack , push it's left and right child respectively.
	- After this, in the next traversal , push the top of the stack1 to the stack2
	- After st1 is empty , pop out all the elements from the st2 and push them to a vec. the vec will contain the postorder traversal.

```cpp
#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
  vector<int> postorderTraversal(TreeNode *root) {
    vector<int> vec;
    stack<TreeNode *> st1;
    stack<TreeNode *> st2;

    if (root == nullptr) {
      return vec;
    }
    st1.push(root);

    while (!st1.empty()) {
      auto top_node = st1.top();
      st1.pop();
      st2.push(top_node);

      if (top_node->left != nullptr) {
        st1.push(top_node->left);
      }
      if (top_node->right != nullptr) {
        st1.push(top_node->right);
      }
    }

    while (!st2.empty()) {
      auto top_node = st2.top();
      st2.pop();
      vec.push_back(top_node->val);
    }

    return vec;
  }
};

```

## Using 1 stack
- This uses 1 stack only.
	- In this we first take two var curr and temp.
		- when curr is not null. we push it's left child and curr becomes curr->left.
		- if whenever curr becomes null. we look to stack.
			- we assign temp as the right child of the top most node in stack
				- Now two conditions can occurr, if the temp is not null , curr is assigned as temp
				- if temp is null. meaning there's no right child at the top of the stack too(remember we already checked for left child in the if statement where curr is being assigned) .
					- Then what we do is pop the top element in the stack , assign it to temp , and then push it to vec(contains postorder traversal).
						- After this , we check if(!st.empty() && temp == st.top() -> right). 
							- Let's explain the condition.
							- Temp before this condition is the top most element which has been popped. so now st.top() returns the previous element that was present before temp.
							- This check that if the temp was the right child of the previous node. if it was , that means the right recursion of the node has ended and it should be included in the post order
							- if this condition is false. that means there is a right child of the parent node pending(we are at node which is a left subchild but there are no children of the node itself.).
							- So , now curr is null , temp is assigned to the right child of the top most element in stack. it cannot be null because if it was the if condition of temp == st.top() -> right must have been executed. so temp becomes some value. this some value then becomes curr and the loop continues.
				 

```cpp

#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
  vector<int> postorderTraversal(TreeNode *root) {
    vector<int> vec;
    stack<TreeNode *> st;

    if (root == nullptr) {
      return vec;
    }
    TreeNode *curr = root;
    TreeNode *temp = nullptr;

    while (curr != nullptr || !st.empty()) {
      if (curr != nullptr) {
        st.push(curr);
        curr = curr->left;
      } else {
        temp = st.top()->right;
        if (temp == nullptr) {
          temp = st.top();
          st.pop();

          vec.push_back(temp->val);

          while (!st.empty() && temp == st.top()->right) { // this condition checks for if the right recursion has ended or not
            temp = st.top();
            st.pop();

            vec.push_back(temp->val);
          }

        } else {
          curr = temp;
        }
      }
    }
    return vec;
  }
};

```


## References
- [striver sde sheet link](https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2/)
- [striver channel yt video (without stack)](https://www.youtube.com/watch?v=COQOU6klsBg&ab_channel=takeUforward)
- [with 2 stack yt video](https://www.youtube.com/watch?v=2YBhNLodD8Q&ab_channel=takeUforward)
- [with 1 stack yt video](https://www.youtube.com/watch?v=NzIGLLwZBS8&ab_channel=takeUforward)