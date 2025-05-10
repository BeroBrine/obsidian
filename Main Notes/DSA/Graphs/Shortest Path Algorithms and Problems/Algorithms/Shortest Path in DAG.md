*10-05-2025 19:30*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Shortest Path in DAG.
- *Problem* *Statement*: 
	Given a Directed Acyclic Graph of V vertices from 0 to n-1 and a 2D Integer array(or vector) edges[ ][ ] of length E, where there is a directed edge from edge[i][0] to edge[i][1] with a distance of edge[i][2] for all i.
	
	Find the shortest path from src(0) vertex to all the vertices and if it is impossible to reach any vertex, then return -1 for that vertex.

#### Solution
- This is same as that of [[Shortest Path in UG With Unit Weights]].
	- But we are given weights with each of the nodes so instead of adding 1 in the condition we just add the given dist.
```cpp
   vector<int> shortestPath(int V, int E, vector<vector<int>>& edges) {
        vector<vector<Info>> adj(V);
        convert(edges , adj);
        vector<int> dist(V, 1e9);
        dist[0] = 0;
        queue<int> q;
        q.push(0);
        while(!q.empty()) {
            int node = q.front();
            q.pop();
            for(Info info : adj[node]) {
                int neighbor = info.node;
                int dis = info.dist;
                if(dist[node] + dis < dist[neighbor]) {
                    dist[neighbor] = dist[node] + dis;
                    q.push(neighbor);                    
                }
            }
        }
        for(int i = 0 ; i < V ; i++) {
            if(dist[i] == 1e9) {
                dist[i] = -1;
            }
        }
        return dist;
    }
    
    void convert(vector<vector<int>> &edges , vector<vector<Info>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            int dist = edge[2];
            adj[u].push_back({v , dist});
        }
    }
```


## References
- [striver sheet link](https://takeuforward.org/data-structure/shortest-path-in-directed-acyclic-graph-topological-sort-g-27/)
- [yt video link](https://www.youtube.com/watch?v=ZUFQfFaU-8U&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=27)
- [leetcode question link](https://www.geeksforgeeks.org/problems/shortest-path-in-undirected-graph/1)