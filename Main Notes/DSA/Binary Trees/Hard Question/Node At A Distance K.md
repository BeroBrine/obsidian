*03-04-2025 21:28*

*Status*: [[revise]] [[quirky]] 

*Tags*: [[dsa]] [[trees]] [[hard]]

# Node At A Distance K
- *Problem* *Statement*: 
	Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.
	![[Pasted image 20250403213001.png]]

### Solution  
- First , as there is no parent pointer so we can traverse back from the target node for distance k. We create a hashmap that contains parent node of each node using [[Level Order Traversal]]
```cpp
void createParentHash(map<TreeNode *, TreeNode *> &map, TreeNode *root) {
    queue<TreeNode *> q;
    q.push(root);
    while (!q.empty()) {
      int size = q.size();
      for (int i = 0; i < size; ++i) {
        auto node = q.front();
        q.pop();
        if (node->left != nullptr) {
          q.push(node->left);
          map[node->left] = node;
        }
        if (node->right != nullptr) {
          q.push(node->right);
          map[node->right] = node;
        }
      }
    }
};
```

- After creating the parent_hash
	- We maintain a queue which stores the nodes that are radially outwards of the target node.
	- We also maintain a visited hash that keeps track of what nodes we have visited while moving radially outwards.








## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=i9ORlEy6EsI&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)