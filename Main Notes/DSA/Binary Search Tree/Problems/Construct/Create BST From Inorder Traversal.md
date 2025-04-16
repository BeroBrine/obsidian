*16-04-2025 01:48*

*Status*:

*Tags*: [[dsa]] [[bst]] [[trees]] 
# Create BST From Inorder Traversal
- *Problem* *Statement*: 
	Given an [[Inorder]] traversal of BST. Construct a height balanced BST.

### Solution
- Find the mid element of the list.
	- Recurisvely create the left side of the tree from the left array.
	- Recurisvely create the right side of the tree from the right array.

#### Code
```cpp
TreeNode* create_bst(int s , int e , vector<int> &in) {
    if(s>e){
        return nullptr;
    }
    int mid = (s+e)/2;
    TreeNode* root = new TreeNode(in[mid]);
    root->left = merge(s , mid-1 , in);
    root->right = merge(mid+1 , e , in);
    return root;
}

```


## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link]()