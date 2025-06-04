*04-06-2025 08:23*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Articulation Point

##### Problem Statement
Given an undirected connected graph with V vertices and adjacency list adj. You are required to find all the vertices removing which (and edges through it) disconnects the graph into 2 or more components and return it in sorted manner.
Note: Indexing is zero-based i.e nodes numbering from (0 to V-1). There might be loops present in the graph.
![[Pasted image 20250604094036.png]]
##### Solution
- This question is similar to that of [[Bridges In Graph]]. 
	- The difference is between the
		- low[] -> this time we do not take the min of low for both nodes if the node's already visited.
			![[FT_2025-06-04 09:49:15.232.png]]
			- The reason is if 5(low of 7) take low of 2 which will be 1 (updated by when the recursion of 3 ended) , it will be updated to 1 , but we can see that for 5 there is no way to reach 1. 

		- The bridge condition
			- if(low[neighborNode] >= tin[node] and parent != -1) {}
				- The = because   



##### Handwritten Notes
![[Articulation point.pdf]]
##### Code
```cpp
class Solution {
    private: 
        int timer = 1;
        void dfs(int node , int parent , int tin[] , int low[] , vector<int> adj[] , vector<int> &vis , set<int> &set , int &child) {
            vis[node] = 1;
            tin[node] = low[node] = timer;
            timer++;
            
            for(int neighborNode : adj[node]) {
                if(neighborNode == parent) continue;
                if(!vis[neighborNode]) {
                    dfs(neighborNode , node , tin , low , adj , vis , set , child);
                    low[node] = min(low[node] , low[neighborNode]);
                    if(low[neighborNode] >= tin[node] and parent != -1) {
                        set.insert(node);
                    }
                    if(parent == -1) {
                        child++;
                    }
                    if(child > 1 and parent == -1) {
                        set.insert(node);
                    }
                }
                else {
                    low[node] = min(low[node] , tin[neighborNode]);
                }
            }
        }
  public:
    vector<int> articulationPoints(int V, vector<int> adj[]) {
        vector<int> ans;
        vector<int> vis(V , 0);
        set<int> s;
        int tin[V];
        int low[V];
        int child = 0;
        dfs(0 , -1  , tin, low , adj , vis , s, child);
        for(int it : s) {
            ans.push_back(it);
        }
        if(s.empty()) ans.push_back(-1);
        return ans;
        
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/articulation-point-in-graph-g-56/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?v=j1QDfU21iZk&ab_channel=takeUforward)