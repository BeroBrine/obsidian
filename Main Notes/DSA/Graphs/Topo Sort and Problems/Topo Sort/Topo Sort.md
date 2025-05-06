*05-05-2025 14:42*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] [[theory]] [[Tags/topo sort|topo sort]] 

# Topo Sort
- Topo Sort is the ordering of the nodes u and v , such that if there is a node between u and v , then u appears before v in the ordering.
- This can only be possible in *Directed Acyclic Graph*
	- In undirected , edge between u and v means edge between u and v and an edge between v and u.
		- The ordering will be u and v , but to denote the edge between v and u  , we will have to write v before u.
			- u before v and v before u is not possible in the same ordering.
	- In Cyclic graph , 1 --> 2 --> 3 --> 1 
		- 1 will appear before 2 but due to the cycle with 3, 1 cannot appear before 3.

#### Solution
- We will utilise stack in this
	- Perform a simple dfs for each node as it is directed. 
	- But before going back , push the node into the stack.
	- When the dfs ends , push the contents of the stack into a new array.
	

```cpp

class Solution {
  public:
    vector<int> topoSort(int V, vector<vector<int>>& edges) {
        vector<vector<int>> adj(V);
        vector<int> vis(V);
        convert(edges , adj);
        vector<int> topo;
        stack<int> st;

        for(int i = 0 ; i < V ; i++) {
            if(!vis[i]) {
                dfs(i , adj , vis , st);
            }
        }
        while(!st.empty()) {
            int node = st.top();
            st.pop();
            topo.push_back(node);
        }
        return topo;
    }
    
    void dfs(int node , vector<vector<int>> &adj , vector<int> &vis , stack<int> &st) {
        vis[node] = 1;
        for(int neighbor : adj[node]) {
            if(!vis[neighbor]) {
                dfs(neighbor , adj , vis , st);
            }
        }
        st.push(node);
    }
    
    void convert(vector<vector<int>> &edges , vector<vector<int>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            adj[u].push_back(v);
        }
    }
};


int check(int V, vector<int> &res, vector<vector<int>> adj) {

    if (V != res.size())
        return 0;

    vector<int> map(V, -1);
    for (int i = 0; i < V; i++) {
        map[res[i]] = i;
    }
    for (int i = 0; i < V; i++) {
        for (int v : adj[i]) {
            if (map[i] > map[v])
                return 0;
        }
    }
    return 1;
}
```



## References
- [striver sheet link](https://takeuforward.org/data-structure/topological-sort-algorithm-dfs-g-21/)
- [yt video link](https://www.youtube.com/watch?v=5lZ0iJMrUMk&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/topological-sort/1)