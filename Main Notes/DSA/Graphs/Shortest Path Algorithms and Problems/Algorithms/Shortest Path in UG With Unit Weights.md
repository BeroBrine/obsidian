*10-05-2025 18:22*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Shortest Path in UG With Unit Weights
- *Problem* *Statement*: 
	You are given an adjacency list, adj of Undirected Graph having unit weight of the edges, find the shortest path from src to all the vertex and if it is unreachable to reach any vertex, then return -1 for that vertex.

#### Solution
- We need to find the smallest distance of each node from source node.
	- To do this , we initialize an array  of dist which contains all the distance with distance 1e9
	- Perform a simple [[BFS]].
		- But the condition here is that if distance uptil this node + 1 is less than the distance it took from any other node to reach to this node.
			- We need to update this distance.
			- We are then adding the neighbor to this queue because we need to update the distance of next nodes to use this smaller distance if they are already visited

```cpp
    vector<int> shortestPath(vector<vector<int>>& adj, int src) {
        int n = adj.size();
        vector<int> dist(n , 1e9);
        queue<int> q;
        dist[src] = 0;
        q.push(src);
        
        while(!q.empty()) {
            int node = q.front();
            q.pop();
            for(int neighbor : adj[node]) {
                if(dist[node] + 1 < dist[neighbor])  {
                    dist[neighbor] = dist[node] + 1;
                    q.push(neighbor);
                }
            }
        }
        for(int i = 0 ; i < n ; i++) {
            if(dist[i] == 1e9) {
                dist[i] = -1;
            }
        }
        return dist;
    }
```




## References
- [striver sheet link](https://takeuforward.org/data-structure/shortest-path-in-undirected-graph-with-unit-distance-g-28/)
- [yt video link](https://www.youtube.com/watch?v=C4gxoTaI71U&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=29&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/shortest-path-in-undirected-graph-having-unit-distance/1)