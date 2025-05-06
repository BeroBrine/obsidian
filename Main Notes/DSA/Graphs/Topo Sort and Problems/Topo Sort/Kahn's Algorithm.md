*05-05-2025 21:09*

*Status*:

*Tags*: [[dsa]] [[graph]] [[Tags/topo sort|topo sort]] [[hard]] [[theory]]

# Kahn's Algorithm
- This algorithm is the BFS version of [[Main Notes/DSA/Graphs/Topo Sort and Problems/Topo Sort/Topo Sort|Topo Sort]]
	- Slightly modified version of BFS.
	- In this , instead of keeping a visited array , we keep indegree array which tracks the indegree of a node.
		- To create the indegree array , for each node , just add +1 to the indegree of it's neighbors
		
```cpp
    void createIndegree(int V, vector<vector<int>> &adj , vector<int> &indegree) {
        for(int i = 0 ; i < V ; i++) {
            for(int neighbor : adj[i]) {
                int edgeNo = indegree[neighbor];
                indegree[neighbor]  = edgeNo + 1;
            }
        }
    }
```
- We also keep a queue in which node with indegree 0 will be added.
- Now , there must be a node for indegree 0 , so this can be our starting point for the bfs as there is no v for these u. These can appear at the first. 
- Now take a node out of the queue , whatever neighbors it has , decrease their indegree by 1 , just like we are removing the edge from the node to it's neighbors.
- Then check if the indegree of the neighbor has become 0. If it becomes 0 , add it to the queue.

```cpp
class Solution {
  public:
    vector<int> topoSort(int V, vector<vector<int>>& edges) {
        vector<vector<int>> adj(V);
        vector<int> indegree(V);
        convert(edges , adj);
        createIndegree(V , adj , indegree);
        vector<int> topo;
        queue<int> q;
        for(int i = 0 ; i < V ; i++) {
            if(indegree[i] == 0) {
                q.push(i);
            }
        }
        while(!q.empty()) {
            int node = q.front();
            q.pop();
            topo.push_back(node);
            for(int neighbor : adj[node]) {
                indegree[neighbor] -= 1;
                if(indegree[neighbor] == 0) {
                    q.push(neighbor);
                }
            }
            
        }
        return topo;
    }
    

    
    void convert(vector<vector<int>> &edges , vector<vector<int>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            adj[u].push_back(v);
        }
    }
    
    void createIndegree(int V, vector<vector<int>> &adj , vector<int> &indegree) {
        for(int i = 0 ; i < V ; i++) {
            for(int neighbor : adj[i]) {
                int edgeNo = indegree[neighbor];
                indegree[neighbor]  = edgeNo + 1;
            }
        }
    }

};



```




## References
- [striver sheet link](https://takeuforward.org/data-structure/kahns-algorithm-topological-sort-algorithm-bfs-g-22/)
- [yt video link](https://www.youtube.com/watch?v=73sneFXuTEg&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/topological-sort/1)