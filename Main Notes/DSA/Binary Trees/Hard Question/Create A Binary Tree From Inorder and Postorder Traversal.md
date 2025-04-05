*05-04-2025 00:39*

*Status*:

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
	










## References
- [striver sheet link](https://takeuforward.org/data-structure/construct-binary-tree-from-inorder-and-postorder-traversal/)
- [yt video link](https://www.youtube.com/watch?v=LgLRTaEMRVc&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)
- [[Requirements to construct a unique binary tree]]