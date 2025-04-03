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
	- *We also maintain a visited hash that keeps track of what nodes we have visited while moving radially outwards.*
	- At each iteration  , we take the full queue (because these are the nodes which are at a distance dist from the target node.), and for each node we push it's parent node (which we find from the parent vec) , left child and right child , mark them visited and then push into the queue. 
	- When dist becomes == to k , we stop the iteration and the nodes contained in the queue are the nodes that are a distance of k from the target nodes.
	- Empty the queue and push it to a vec and then return it.

```cpp
  vector<int> distanceK(TreeNode *root, TreeNode *target, int k) {
    if (root == nullptr) {
      vector<int> vec;
      return vec;
    }

    map<TreeNode *, TreeNode *> parent_map;
    vector<int> vec;
    map<int, int> visited;
    queue<TreeNode *> q;
    int dist = 0;
    createParentHash(parent_map, root);

    q.push(target);
    while (dist != k) {

      int size = q.size();
      for (int i = 0; i < size; ++i) {
        auto q_node = q.front();
        q.pop();
        visited[q_node->val] = 1;
        TreeNode *parent_node = nullptr;
        if (parent_map.find(q_node) != parent_map.end()) {
          parent_node = parent_map[q_node];
        }
        TreeNode *left_child = q_node->left;
        TreeNode *right_child = q_node->right;
        if (parent_node != nullptr && visited[parent_node->val] != 1) {
          visited[parent_node->val] = 1;
          q.push(parent_node);
        }
        if (left_child != nullptr && visited[left_child->val] != 1) {

          visited[left_child->val] = 1;
          q.push(left_child);
        }

        if (right_child != nullptr && visited[right_child->val] != 1) {
          cout << "pushing the right node  " << right_child->val << endl;
          visited[right_child->val] = 1;
          q.push(right_child);
        }
      }
      dist++;
    }

    while (!q.empty()) {
      auto node = q.front();
      q.pop();
      vec.push_back(node->val);
    }

    return vec;
  }


```






## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=i9ORlEy6EsI&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)