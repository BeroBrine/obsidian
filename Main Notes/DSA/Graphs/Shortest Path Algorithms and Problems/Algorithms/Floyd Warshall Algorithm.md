*18-05-2025 12:32*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Floyd Warshall Algorithm
- This algorithm is multi source shortest path algorithm
	- From every node , we need to find the shortest path to every other node.

- The intuition is to get the distance *via* every node.
 -  In this we keep a cost matrix , at cost{i}{j} denotes the cost of i -> j. 
	- We need to find for each node , distance to a node via every node. 
	- At the end it will calculate the minimum distance for each node
- How do we detect negative edge cycles.
	- We know that self loop at one node should always be 0. But after the algorithm has finished , if there is a node for which cost to reach itself is negative , there must be a negative weight cycle that has caused this.

###### The check to see if cost != 1e9 is there if th node is reachable or not , as this algo assumes that all of the nodes are connected initially , so we have to explicitly tell that if this node is disconnected , don't include it in the equation.   
### Full Code
```cpp
void floydWarshall(vector<vector<int>> &cost) {
        // Code here
        int n = cost.size();
        for(int via = 0 ; via < n ; via++) {
            for(int i = 0 ; i < n ; i++) {
                for(int j = 0 ; j < n ; j++) {
                    if(cost[i][via] != 1e8 and cost[via][j] != 1e8 ) {
                        cost[i][j] = min(cost[i][j] , cost[i][via] + cost[via][j]);
                    }
                    
                }
            }
        } 
    }
```


## References
- [striver sheet link](https://takeuforward.org/data-structure/floyd-warshall-algorithm-g-42/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?v=YbY8cVwWAvw&ab_channel=takeUforward)