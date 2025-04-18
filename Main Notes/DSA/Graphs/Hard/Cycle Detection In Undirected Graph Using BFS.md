*18-04-2025 14:28*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Cycle Detection In Undirected Graph Using BFS
- *Problem* *Statement*: 
	- Given an **undirected graph** with **V** vertices and **E** edges, represented as a 2D vector **edges[][]**, where each entry **edges[i] = [u, v]** denotes an edge between vertices **u** and **v**, determine whether the graph contains a **cycle** or not. 

#### Solution
- For a cycle to be detected , there is certainly a node on which there are 2 paths.
- Perform [[BFS]] starting from a node. One of the path will surely visit the node and when the other path comes to visit the node and if it sees it's already visited , then it indicates there is a cycle..   
- The data structure used will be a struct which will contain the node and it's parent node.
- For the GFG question , the given input is the edge array denoting an edge between u and v. Convert this into the adj list using below function
- **Just make sure that you assign the space as V.**
```cpp

void convert(vector<vector<int>> &edges , vector<vector<int>> &adj){
	for(auto edge: edges) {
		int u = edge[0];
		int v = edge[1];
		
		adj[u].push_back(v);
		adj[v].push_back(u);
	}
}
```

- **VERY IMP-> Handle the case of disconnected components**
```cpp

bool isCycle(int V, vector<vector<int>>& edges) {
	int n = edges.size();
	vector<vector<int>> adj(V);
	int vis[V] = {0};
	convert(edges , adj);
	for(int i = 0 ; i < V ; i++) {
		if(!vis[i]) {
			if(bfs(i , adj , vis)) return true;
		}
	}
	return false;
}
```

- Perform the BFS traversal. We are storing parent for the reason because it's already marked as false and will give **false** true if we do not use the parent.
```cpp
bool bfs(int start, vector<vector<int>>& adj, int vis[]) {
	queue<Info> q;
	q.push({start, -1});
	vis[start] = 1;

	while (!q.empty()) {
		Info front = q.front(); q.pop();
		int node = front.node;
		int parent = front.parent;

		for (int neighbor : adj[node]) {
			if (neighbor != parent) {
				if (!vis[neighbor]) {
					vis[neighbor] = 1;
					q.push({neighbor, node});
				} else {
					return true;
				}
			}
		}
	}
	return false;
}
    
```






#### Full Code

```cpp
class Solution {
    struct Info {
        int node;
        int parent;
    };
  public:
    bool isCycle(int V, vector<vector<int>>& edges) {
        int n = edges.size();
        vector<vector<int>> adj(V); // USE V 
        int vis[V] = {0};
        convert(edges , adj);
        for(int i = 0 ; i < V ; i++) {
            if(!vis[i]) {
                if(bfs(i , adj , vis)) return true;
            }
        }
        return false;
    }
    

    bool bfs(int start, vector<vector<int>>& adj, int vis[]) {
        queue<Info> q;
        q.push({start, -1});
        vis[start] = 1;
    
        while (!q.empty()) {
            Info front = q.front(); q.pop();
            int node = front.node;
            int parent = front.parent;
    
            for (int neighbor : adj[node]) {
                if (neighbor != parent) {
                    if (!vis[neighbor]) {
                        vis[neighbor] = 1;
                        q.push({neighbor, node});
                    } else {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    
	void convert(vector<vector<int>> &edges , vector<vector<int>> &adj){
        for(auto edge: edges) {
            int u = edge[0];
            int v = edge[1];
            
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
    }


};
```







## References
- [striver sheet link](https://takeuforward.org/data-structure/detect-cycle-in-an-undirected-graph-using-bfs/)
- [yt video link](https://www.youtube.com/watch?v=BPlrALf1LDU&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/detect-cycle-in-an-undirected-graph/0)