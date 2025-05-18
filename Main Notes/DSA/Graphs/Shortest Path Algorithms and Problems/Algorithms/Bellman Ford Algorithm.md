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
	- Relaxation is 
		- if dist[u] + cost < dist[v] {
				dist[v] = cost + dist[u];
			  }
		- Keep in mind the node u must be reachable 
	- How to detect negative weight cycle?
		- On each iteration , negative weight will always keep increasing due to addition of negative weight which will keep decreasing the weight and algo will keep updating the array.
			- However  , we are sure that at V - 1 iteration , the min distance to all nodes is stored. 
			- If at the Vth iteration , the distance array still gets updated , i.e the relaxation happens again , it surely contains a negative weight cycle 
#### Full Code
```cpp
vector<int> bellmanFord(int V, vector<vector<int>>& edges, int src) {
        vector<int> dist(V , 1e8);
        dist[src] = 0;
        for(int i = 0; i < V - 1 ; i++) {
            for(auto it : edges) {
                int u = it[0];
                int v = it[1];
                int cost = it[2];
                if(dist[u] != 1e8 && dist[u] + cost < dist[v]) {
                    dist[v] = dist[u] + cost;
                }
            } 
        }
		// Nth iteration to test for negative weight cycles
            for(auto it : edges) {
                int u = it[0];
                int v = it[1];
                int cost = it[2];
                if(dist[u] != 1e8 && dist[u] + cost < dist[v]) {
                    return {-1};
                }
            }
            
        return dist;
        
        
    }
```





## References
- [striver sheet link](https://takeuforward.org/data-structure/bellman-ford-algorithm-g-41/)
- [leetcode question link]()
-  ![yt video link](https://www.youtube.com/watch?v=0vVofAhAYjc&ab_channel=takeUforward)