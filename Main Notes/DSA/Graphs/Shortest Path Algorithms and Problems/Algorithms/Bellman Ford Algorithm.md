*18-05-2025 10:05*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] 

# Bellman Ford Algorithm
- This algorithm is used to find minimum distance to node which was the limitation of [[Dijkstra's Algorithm]].
	- This also helps us to detect negative weight cycle.
- This work by relaxing the edges N - 1 times. Where N is the number of nodes.
	- Why N - 1 times?
		- Because in each iteration a node which was updated in the previous iteration , will update all the adjacent nodes with it.
		- At n - 1th iteration , we are sure that all of the edges are relaxed atleast one time which means all the negative edges have been taken in account. 
		- Also because in the worst case, the shortest path to some node might involve N - 1 edges (i.e., touching all other nodes in a chain).


#### Full Code
```cpp
```





## References
- [striver sheet link](https://takeuforward.org/data-structure/bellman-ford-algorithm-g-41/)
- [leetcode question link]()
-  ![yt video link](https://www.youtube.com/watch?v=0vVofAhAYjc&ab_channel=takeUforward)