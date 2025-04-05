*05-04-2025 00:39*

*Status*: [[revise]]

*Tags*: [[dsa]] [[hard]] [[trees]] 

# Create A Binary Tree From Inorder and Postorder Traversal
- *Problem* *Statement*: 
	Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.
	![[Pasted image 20250405004301.png]]

#### Intuition.
-  The last node in the postorder is the root of the entire tree. -> 3
	- inorder provides with the left and right nodes
		- So 9 is on the left subtree and 15 , 20 , 7 is on the right subtree.
	- The number of nodes in the inorder on the left are for eg, N.
		- Then the postorder of the left subtree will be the first N elements of postorder array.
		- And the remaining elements will be the postorde of the right subtree.
- Create a hashmap which will store the index of the elements in the inorder array.

### Algo
- Create a hashmap and store all the indexes of the elements in the inorder array.
- Keep 2 pointers for the end and start of both the arrays.
- Pick the last element in the postorder array
	- This will be the root node.
	- Find it's  








```cpp
class Solution {
public:
  TreeNode *buildTree(vector<int> &inorder, vector<int> &postorder) {
    map<int, int> map;
    for (int i = 0; i < inorder.size(); ++i) {
      map[inorder[i]] = i;
    }

    int inorder_length = inorder.size();
    int postorder_length = postorder.size();
    return build(0, inorder_length - 1, 0, postorder_length - 1, inorder,
                 postorder, map);
  }

  TreeNode *build(int i_inorder, int i_inorder_max, int i_postorder,
                  int i_postorder_max, vector<int> &inorder,
                  vector<int> &postorder, map<int, int> &map) {

    if (i_inorder > i_inorder_max || i_postorder > i_postorder_max) {
      return nullptr;
    }

    int root_index = map[postorder[i_postorder_max]];
    TreeNode *root = new TreeNode(postorder[i_postorder_max]);
    int numsLeft = root_index - i_inorder;

    root->left = build(i_inorder, root_index - 1, i_postorder,
                       i_postorder + numsLeft - 1, inorder, postorder, map);
    root->right = build(root_index + 1, i_inorder_max, i_postorder + numsLeft,
                        i_postorder_max - 1, inorder, postorder, map);

    return root;
  }
};

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/construct-binary-tree-from-inorder-and-postorder-traversal/)
- [yt video link](https://www.youtube.com/watch?v=LgLRTaEMRVc&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)
- [[Requirements to construct a unique binary tree]]