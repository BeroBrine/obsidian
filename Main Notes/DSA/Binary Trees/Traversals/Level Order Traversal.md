2025-03-26 12:57

Status:

Tags:

## Level Order Traversal

- Uses Queue data structure (FIFO)
- Traverses the tree in level wise order. From Left to Right
- vector<vector<int\>> stores the level order traversal. 
### Algo
- Push the root node into the queue.
- Push the left and right child respectively of the node into the queue.
- When all of the child of the node are pushed , push the node into a vector.
- In the next iteration , take all of the nodes out of the queue , push their left and right child respectively. once this ends, push all of the nodes that were taken out of the queue into the vec.
- Push the level order vec into the parent vec.
- Return the parent vec.



## References
- [striver sde sheet](https://takeuforward.org/data-structure/level-order-traversal-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=EoAsWbO7sqg&ab_channel=takeUforward)