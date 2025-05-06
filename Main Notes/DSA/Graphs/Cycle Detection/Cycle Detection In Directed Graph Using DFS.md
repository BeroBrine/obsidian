*30-04-2025 23:52*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[graph]] [[hard]]

# Cycle Detection In Directed Graph Using DFS
- *Problem* *Statement*: 
	Given a Directed Graph with V vertices (Numbered from 0 to V-1) and E edges, check whether it contains any cycle or not.
	The graph is represented as a 2D vector edges[][], where each entry edges[i] = [u, v] denotes an edge from verticex u to v.

#### Why another algorithm?
 - Why can't we use the algorithm used in [[Cycle Detection In Undirected Graph Using DFS]]? 
	 - Because in directed graph at one time only one path can be taken.
	 - If we apply the same algorithm of using the vis array , i.e , if the node is already visited and is not the parent node then there is a cycle.
		 - This one will fail because for eg. ![[Cycle Detection In Directed Graph Using BFS 2025-05-01 13.46.54.excalidraw]] 
		 - The path 1 has already visited the node at bottom right corner.
		 - When DFS comes from path 2 it sees that the bottom right corner node has been already visited and it says that there is a cycle , but we know there is none due to directed edges. 
		 - Hence the previous algorithm fails.


#### Solution
- In this , we are doing dfs so we obv need the vis 
	- First remember to convert the given edges array into adj list.
	- But we are also keeping a path_vis array.
	- Whenever we enter a node , we say that this is visited and it's included in this path.
		- But when we are coming back from the node , remember it's DFS (recursion) , we remove the node from the path. 
	- We do DFS here component like because from the 0th node , all nodes may not be reachable. 
	- We do the normal dfs and check if a node is visited or not. If it is visited we check if it's on the same path or not.
	- But if we still encounter a node that is on the path and is already visited , this mean that there is cycle present.

```cpp
class Solution {
  public:
    bool isCyclic(int V, vector<vector<int>> &edges) {
        vector<int> vis(V , 0);
        vector<int> path(V , 0);
        vector<vector<int>> adj(V);
        convert(edges , adj);
        for(int i = 0 ; i < V ; i++) {
            if(dfs(i , adj , vis , path)) {
                return true;
            }
        }
        return false;
        
    }
    
    bool dfs(int node , vector<vector<int>> &edges , vector<int> &vis , vector<int> &path) {
        vis[node] = 1;
        path[node] = 1;
        for(int neighbor : edges[node]) {
            if(!vis[neighbor]) {
                if(dfs(neighbor  ,edges , vis , path)) {
                    return true;
                }
                path[node] = 0;
            }
            else {
                if(path[node] == 1) {
                    return true;
                }
            }
        }
        return false;
    }
    
    void convert(vector<vector<int>> &edges , vector<vector<int>> &adj) {
        for(auto nodes : edges) {
            int u = nodes[0];
            int v = nodes[1];
            adj[u].push_back(v);
        }
    }
};

```




## References
- [striver sheet link](https://takeuforward.org/data-structure/detect-cycle-in-a-directed-graph-using-dfs-g-19/)
- [yt video link](https://leetcode.com/problems/course-schedule-ii/solutions/293048/detecting-cycle-in-directed-graph-problem/)
- [GFG question link](https://www.geeksforgeeks.org/problems/detect-cycle-in-a-directed-graph/1)