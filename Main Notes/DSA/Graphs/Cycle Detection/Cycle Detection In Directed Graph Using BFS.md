*06-05-2025 08:19*

*Status*:

*Tags*: [[dsa]] [[Tags/topo sort|topo sort]] [[hard]] [[graph]]

# Cycle Detection In Directed Graph Using BFS
- *Problem* *Statement*: 
	Given a Directed Graph with V vertices (Numbered from 0 to V-1) and E edges, check whether it contains any cycle or not.
	The graph is represented as a 2D vector edges[][], where each entry edges[i] = [u, v] denotes an edge from verticex u to v.


#### Solution
- We will be using [[Kahn's Algorithm]] in this.
	- We know that Kahn's algo can only be applied on DAGs
	- But this is a Directed Cyclic Graph
	- We will still apply the Kahn's algo here.  
		- But the trick is that when the algo reaches the node which has a cyclic dependency , it's indegree can never be 0. That means the queue will be empty without adding all the V nodes to the array. 
	- This means that if topo.size() < V. It contains a cycle.

```cpp
class Solution {
  public:
    bool isCyclic(int V, vector<vector<int>> &edges) {
        vector<vector<int>> adj(V);
        vector<int> indegree(V);
        convert(edges , adj);
        createIndegree(V , adj , indegree);
        queue<int> q;
        vector<int> topo;
        for(int i = 0  ; i < V ; i++) {
            if(indegree[i] == 0) {
                q.push(i);
            }
        }
        
        while(!q.empty()) {
            int node = q.front();
            q.pop();
            topo.push_back(node);
            for(int neighbor : adj[node]) {
                indegree[neighbor] -=1;
                if(indegree[neighbor] == 0) {
                    q.push(neighbor);
                }
            }
        }
        if(topo.size() < V) {
            return true;
        }
        return false;
        
    }
```

## References
- N/A sheet link
- [yt video link](https://www.youtube.com/watch?v=iTBaI90lpDQ&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/detect-cycle-in-a-directed-graph/1)