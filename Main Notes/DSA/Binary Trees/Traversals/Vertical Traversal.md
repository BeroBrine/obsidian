*01-04-2025 13:49*

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[traversals]]

## Vertical Traversal
- The traversal in this is in the form of left to right vertically. Printing nodes in the form of Top to Bottom. 
				![[Vertical Traversal 2025-04-01 15.09.53.excalidraw|400x400]] 

## Algo
- In this , map<int , map<int , multiset<int\>>> is used.
	- the first int tracks the vertical level.
	- for each vertical level , there can be many horizontal levels. 
		- and for each horizontal levels , there can be multiple node in it
	- If the horizontal level of the nodes is same , then we need to sort them.
		- Multiset is used to achieve this , it sorts the values as well as allows duplicates in it. 
		
- There is a queue which tracks the node , and it's vertical and horizontal level as well.
- In this , we modify the level traversal a bit. We don't use the legacy one because the queue is already tracking the level in the pair.
- When pushing the left child , we decrease the vertical level by 1 and increase the horizontal level by 1.
- When pushing the right child , we increase the vertical level by 1 and increase the horizontal level by 1.
- When the queue ends , meaning there are no more nodes.
	- We push the sets values in a vec and push the vec in ans vec after for each level the map the ends.



## Code
```cpp
class Solution {
public:
  vector<vector<int>> verticalTraversal(TreeNode *root) {
    vector<vector<int>> ans;
    map<int, map<int, multiset<int>>> nodes;
    queue<pair<TreeNode *, pair<int, int>>> q;
    q.push({root, {0, 0}});

    while (!q.empty()) {
      auto front = q.front();
      q.pop();
      auto node = front.first;
      int vertical_level = front.second.first;
      int horizontal_level = front.second.second;
      nodes[vertical_level][horizontal_level].insert(node->val);
      if (node->left != nullptr) {
        q.push({node->left, {vertical_level - 1, horizontal_level + 1}});
      }
      if (node->right != nullptr) {
        q.push({node->right, {vertical_level + 1, horizontal_level + 1}});
      }
    }

    for (auto i : nodes) {
      cout << "for the vert level " << i.first << endl;
      vector<int> n;
      for (auto j : i.second) {
        n.insert(n.end(), j.second.begin(), j.second.end());
      }
      ans.push_back(n);
    }

    return ans;
  }
};

```

#### My Approach
- What i was doing that i was correctly pushing the nodes into the queue and then in the vec using [[Level Order Traversal]] but the issue arised at same horizontal level nodes.
- I needed to sort them which i didn't do in my approach.

## References
- [striver sheet link](https://takeuforward.org/data-structure/vertical-order-traversal-of-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=q_a6lpbKJdw&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/)