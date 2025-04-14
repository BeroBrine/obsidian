*05-04-2025 20:43*

*Status*: 

*Tags*: [[dsa]] [[hard]] [[trees]] [[linked list]]

# Flattern Binary Tree To Linked List
- *Problem* *Statement*: 
	Given the root of a binary tree, flatten the tree into a "linked list":
	* The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
	
	* The "linked list" should be in the same order as a preorder-traversal of the binary tree.

### Solution
#### Approach 1
- We keep a prev which will track what was the last node we visited --> init to nullptr.
- In this we are doing reverse postorder , we traverse till the last leaf node in the right subtree of the root node.
- We first traverse in the right and then in the left.
- After traversing what we do is , node->right points to prev and node->left = nullptr.
	- And then we assign prev to node.
 - This works for the left subtree as well because when we are at rightmost leaf node in the left subtree from the rootnode , prev is pointing to the right subchild of the root node.  
 
```cpp
class Solution {
public:
  void flatten(TreeNode *root) {
    TreeNode *prev = nullptr;
    helper(root, prev);
  }
  void helper(TreeNode *root, TreeNode *&prev) {
    if (root == nullptr) {
      return;
    }
    helper(root->right, prev);
    helper(root->left, prev);

    root->right = prev;
    root->left = nullptr;
    prev = root;
  }
};

```



#### Approach 2
- Just converts the recursion to iterative

```cpp
  void flatten(TreeNode *root) {
    stack<TreeNode *> st;
    st.push(root);
    while (!st.empty()) {
      auto curr = st.top();
      st.pop();

      if (curr->right) {
        st.push(curr->right);
      }
      if (curr->left) {
        st.push(curr->left);
      }

      if (!st.empty()) {
        curr->right = st.top();
      }
      curr->left = nullptr;
    }
  }
```

#### Approach 3 
- Similar to [[Morris Inorder Traversal]]
```cpp
class Solution {
public:
  void flatten(TreeNode *root) {
    TreeNode *curr = root;
    while (curr) {
      if (curr->left) {
        TreeNode *prev = curr->left;
        while (!prev->right) {
          prev = prev->right;
        }
        prev->right = curr->right;
        curr->right = curr->left;
      }
      curr = curr->right;
    }
  }
};

```






## References
- [striver sheet link](https://takeuforward.org/data-structure/flatten-binary-tree-to-linked-list/)
- [yt video link](https://www.youtube.com/watch?v=sWf7k1x9XR4&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/flatten-binary-tree-to-linked-list/description/)