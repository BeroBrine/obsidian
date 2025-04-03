*02-04-2025 21:56*

*Status*:

*Tags*: [[dsa]] [[trees]] [[hard]]

# Maximum Width Of Binary Tree
- *Problem* *Statement*: 
	Given the root of a binary tree, return the maximum width of the given tree.
	
	The maximum width of a tree is the maximum width among all levels.
	

- Width of a tree is the number of nodes between two nodes in a level.
		![[Maximum Width Of Binary Tree 2025-04-02 22.00.04.excalidraw]]
		-
		![[Pasted image 20250402220730.png]]
	- The width of the above tree is 8.
	
#### Algo
- We will index each node.
	- Starting from the root node , index it 0
	- *0 based indexing*
		- *left => 2i+1 {i being the index of the parent node}*
		- *right => 2i + 2 {i being the index of the parent node}*
	- *1 based indexing*
		- *left => 2i {i being the index of the parent node}*
		- *right => 2i+1 {i being the index of the parent node}*

- Using [[Level Order Traversal]].
	- make a pair of {node , index} and push it to the queue.
	- on each level. 
		- Track the max and min index in each level
		- After each level just subtract max - min + 1 and then compare it with max width
		
![[Pasted image 20250402223448.png]]

#### Code
```cpp
class Solution {
public:
  int widthOfBinaryTree(TreeNode *root) {
    if (!root)
      return 0; // Edge case: Empty tree

    queue<pair<TreeNode *, long long>> q;
    int width = 0;
    q.push({root, 0});

    while (!q.empty()) {
      int size = q.size();
      long long leftMost = q.front().second; // Normalize index
      long long first, last;

      for (int i = 0; i < size; ++i) {
        auto top = q.front();
        q.pop();
        TreeNode *node = top.first;
        long long index = top.second - leftMost; // Prevent overflow

        if (i == 0)
          first = index;
        if (i == size - 1)
          last = index;

        if (node->left) {
          q.push({node->left, 2 * index + 1});
        }
        if (node->right) {
          q.push({node->right, 2 * index + 2});
        }
      }

      width = max(width, (int)(last - first + 1));
    }

    return width;
  }
};

```

- The typecasting is done to fit the ans in leetcode constraints.



## References
- [striver sheet link](https://takeuforward.org/data-structure/maximum-width-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=ZbybYvcVLks&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/maximum-width-of-binary-tree/)