
2025-03-27 16:40

*Status*:

*Tags*: [[dsa]] [[trees]] [[medium question]]

## Check If Same Tree
- *Problem* *Statement*: 
	Given the roots of two binary trees p and q, write a function to check if they are the same or not.
	Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
	![[Check If Same Tree 2025-03-27 16.44.22.excalidraw| 800x300]]	

#### Conditions
- The conditions in which the tree is not same is
	- If node1 || node2 becomes null , but one of them is not null. (structurally different)
		- Meaning that one node has become null but the other tree has a node at the place
	- If node1 -> val != node2 -> val 
#### My Approach
 - For each node , check it's value and then check move to it's right and left child

### Algo
-   












## References
- [striver sheet link](https://takeuforward.org/data-structure/check-if-two-trees-are-identical/)
- [yt video link](https://www.youtube.com/watch?v=BhuvF_-PWS0&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/same-tree/
)