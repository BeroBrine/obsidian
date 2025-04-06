*01-04-2025 21:42*

*Status*:

*Tags*: [[dsa]] [[trees]] [[hard]] [[follow up]]

# Root To Node Path In Binary Tree
- *Problem* *Statement*: 
	- Given a Binary Tree, you need to find all the possible paths from the root node to all the leaf nodes of the binary tree.
		![[Pasted image 20250401214417.png]]

### Algo [My Approach]
- I need to find every possible path to leaf node.
	- I will require two vecs 
		- One for path
		- One for storing when a path is complete
	- When reaching a node  , push it to the path vec.
	- Check if it's a leaf node. If it is , push the path vec to the ans vec.
	- If it's not a leaf node , go to it's *left subchild first* --> VERY IMP.
	- When coming back , pop the node from the vec so that same vec can be used for the next path.
	- Then go for the right subchildrens and do the same popping out with them.

 
```cpp
class Solution {
  public:
    vector<vector<int>> Paths(Node* root) {
        vector<vector<int>> ans;
        vector<int> path;
        get_paths(root , path , ans);
        return ans;
    }
    
    void get_paths(Node* node , vector<int> &path , vector<vector<int>> &ans) {
        path.push_back(node->data);
        if(node -> left == nullptr && node->right == nullptr) {
            ans.push_back(path);
            return;
        }
        if(node -> left != nullptr) {
            get_paths(node->left , path , ans);
            path.pop_back();
        }
        if(node->right != nullptr) {
            get_paths(node->right , path  , ans);
            path.pop_back();
        }
    }
};
```

## References
- [striver sheet link](https://takeuforward.org/data-structure/print-root-to-node-path-in-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=fmflMqVOC7k&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/root-to-leaf-paths/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=root-to-leaf-paths)

## Follow up
- Check out the question of path to a specific node. (it's in the striver yt video)