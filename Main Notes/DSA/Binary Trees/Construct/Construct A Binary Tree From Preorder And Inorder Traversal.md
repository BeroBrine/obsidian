*05-04-2025 12:50*

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[hard]] [[Construct Binary Tree]]
# Construct A Binary Tree From Preorder And Inorder Traversal
- *Problem* *Statement*: 
	Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

#### This is same as of [[Create A Binary Tree From Inorder and Postorder Traversal]]

- The only difference being that instead of root from the end of the array, we are taking it from the first of the array due to it being preorder(Root Left Right).


### Remember The Pointers
- Left
	- inorder ptrs -> is , index - 1;
	- preorder ptrs -> ps + 1 , ps + numsRight;
- Right
	- inorder ptrs -> index+1 , ie
	- preorder ptrs -> ps + numsRight , ps + numsLeft + 1; 


#### Full Code
```cpp
class Solution {
public:
  TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    map<int, int> map;
    for (int i = 0; i < inorder.size(); i++) {
      map[inorder[i]] = i;
    }
    return build(inorder, 0, inorder.size() - 1, preorder, 0,
                 preorder.size() - 1, map);
  }

  TreeNode *build(vector<int> &inorder, int is, int ie, vector<int> &preorder,
                  int ps, int pe, map<int, int> &map) {
    if (is > ie || ps > pe) {
      return nullptr;
    }
    int root_node_val = preorder[ps];
    cout << "the root_node_val is " << root_node_val << endl;
    TreeNode *root = new TreeNode(root_node_val);
    int index = map[root_node_val];
    int numsRight = index - is;
    root->left =
        build(inorder, is, index - 1, preorder, ps + 1, ps + numsRight, map);
    root->right =
        build(inorder, index + 1, ie, preorder, ps + numsRight + 1, pe, map);

    return root;
  }
};

```





## References
- [striver sheet link](https://takeuforward.org/data-structure/construct-binary-tree-from-inorder-and-postorder-traversal/)
- [yt video link](https://www.youtube.com/watch?v=LgLRTaEMRVc&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)