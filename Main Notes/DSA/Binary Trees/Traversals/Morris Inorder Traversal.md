*05-04-2025 18:31*

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[traversals]]

# Morris Inorder Traversal 
- Better version of [[Inorder]] traversal.
- This algorithm has O(n) time complexity but constant space complexity.
- Uses the concept of *Threaded Binary Tree.*
	![[Pasted image 20250405200806.png|800x400]]
### Algo
- In this , we are eliminating back tracking to the root node itself. 
	- In this what we are doing is , for each node , we are going to the *right most node in it's left subtree* and making it's right ptr to point towards to the root node.
	-  Two cases
		- If the node does not have left child
			- Push it in the array and traverse to the right.
		- If the node does have a left child
			- Then we thread the rightmost node in this tree to the root node.

### Threading the tree
- When we reach on the rightmost node of the left subtree.
	- Mark it's right to the root node

- Now the question arises that how will we know about when do we recurse to the right from the root node. 
	- We do this by checking that if the node already has a thread
		- If it has , delete the thread and then move to the right.
		- This works because we are pushing nodes with the help of the curr ptr and threading nodes on the basis of prev ptr.

- The below code gets executed when the left child is null.
- We can see that if there is no thread , make one and then traverse to the left child.
	- And if there is one , cut it and then traverse to the right child.

##### Threading nodes code
```cpp
TreeNode *prev = curr->left;
while (prev->right && prev->right != curr) {
  prev = prev->right;
}
if (prev->right == nullptr) {
  prev->right = curr;
  vec.push_back(curr->val);
  curr = curr->left;
} else {
  prev->right = nullptr;
  curr = curr->right;
}
```



#### Code
```cpp
vector<int> preorderTraversal(TreeNode *root) {
    vector<int> vec;
    TreeNode *curr = root;
    while (curr) {
      if (curr->left == nullptr) {
        vec.push_back(curr->val);
        curr = curr->right;
      } else {
        TreeNode *prev = curr->left;
        while (prev->right && prev->right != curr) {
          prev = prev->right;
        }
        if (prev->right == nullptr) {
          prev->right = curr;
          vec.push_back(curr->val);
          curr = curr->left;
        } else {
          prev->right = nullptr;
          curr = curr->right;
        }
      }
    }
    return vec;
  }

```











## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link]()