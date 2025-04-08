*07-04-2025 21:54*

*Status*:

*Tags*: [[dsa]] [[bst]] [[theory]]

# Binary Search Tree
- In this tree.
	- On the left , the child is lesser than that of parent node.
	- On the right , the child is greater than that of parent node.
	- *They cannot be same.*
- Entire left subtree should be BST.
- Entire right subtree should be BST.
	![[Pasted image 20250407215822.png]] 


#### Are duplicates are allowed in BST?
- Generally duplicates are not allowed
	- But if we want to allow them
		- Slightly modify the condition
			- L <= N < R
			- keep a track of cnt.
			- keep track of pair<TreeNode* , int>

- The height of bst is log(n).(base of 2).


## References
- [striver sheet link](https://takeuforward.org/binary-search-tree/introduction-to-binary-search-trees/)
- [yt video link](https://www.youtube.com/watch?v=p7-9UvDQZ3w&feature=youtu.be)