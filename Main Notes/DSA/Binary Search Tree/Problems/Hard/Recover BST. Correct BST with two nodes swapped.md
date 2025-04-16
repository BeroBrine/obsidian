*16-04-2025 18:45*

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[bst]] [[hard]] 

# Recover BST. Correct BST with two nodes swapped
- *Problem* *Statement*: 
	You are given the root of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.


#### Approach 1 - Bruteforce Approach - O(2N + NlogN) and O(N) __ T&S complexity
- In this approach , we first traverse the tree and then sort the traversal. Now we perform an inorder traversal and for every node check in the sorted array that if this node is equal to the value in the array. It it is not , swap it and continue

##### Code
```cpp
class Solution {
public:
  void recoverTree(TreeNode *root) {
    vector<int> vec;
    inorder(root, vec);
    sort(vec.begin(), vec.end());
    int ptr = 0;
    // for (int i : vec) {
    // }
    check(root, ptr, vec);
  }

  void check(TreeNode *node, int &ptr, vector<int> &vec) {
    if (node == nullptr) {
      return;
    }
    check(node->left, ptr, vec);
    if (node->val != vec[ptr])
      node->val = vec[ptr];
    ptr++;
    check(node->right, ptr, vec);
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

```

#### Appraoch 2 - Optimized
- In this we optimize the inorder traversal and use the traversal itself to find the two nodes.
	- Performing an inorder traversal , we are looking for two nodes. We know that inorder is always increasing for a bst , so the first node we encounter who's previous is greater than the nodes itself. We mark the first pointer to the prev node and the second node to the current node. This takes care of two adjacent nodes being tracked.
	- We do this for the second node too and the second pointer is now at the second node which defaults.
	- When the traversal ends , just swap the value of the two. 
	- *Keep in mind the statement*
```cpp

if (prev and prev->val > root->val) {
  if (!first) {
	first = prev;
  }
  second = root;
}
```

```cpp
class Solution {
public:
  void recoverTree(TreeNode *root) {
    TreeNode *first = nullptr, *second = nullptr, *prev = nullptr;
    morris(root, first, second, prev);
    if (first && second) {
      swap(first->val, second->val);
    }
  }

  void morris(TreeNode *root, TreeNode *&first, TreeNode *&second,
              TreeNode *&prev) {
    while (root) {
      if (root->left == nullptr) {
        if (prev and prev->val > root->val) {
          if (!first) {
            first = prev;
          }
          second = root;
        }
        prev = root;
        root = root->right;
      } else {
        TreeNode *left = root->left;
        while (left->right and left->right != root) {
          left = left->right;
        }
        if (!left->right) {
          left->right = root;
          root = root->left;
        } else {
          left->right = nullptr;
          if (prev and prev->val > root->val) {
            if (!first) {
              first = prev;
            }
            second = root;
          }
          prev = root;
          cout << root->val << " ";
          root = root->right;
        }
      }
    }
  }
};

```

## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=ZWGW7FminDM&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/recover-binary-search-tree/)