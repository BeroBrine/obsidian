*11-05-2025 16:07*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Print Shortest Path
- *Problem* *Statement*: 
	You are given a weighted undirected graph having n vertices numbered from 1 to n and m edges along with their weights. Find the shortest weight path between the vertex 1 and the vertex n,  if there exists a path, and return a list of integers whose first element is the weight of the path, and the rest consist of the nodes on that path. If no path exists, then return a list containing a single element -1.
	
	The input list of edges is as follows - {a, b, w}, denoting there is an edge between a and b, and w is the weight of that edge.
	
	Note: The driver code here will first check if the weight of the path returned is equal to the sum of the weights along the nodes on that path, if equal it will output the weight of the path, else -2. In case the list contains only a single element (-1) it will simply output -1. 

### Solution 
- This problem uses [[Dijkstra's Algorithm]] as it is an undirected weighted graph.

	- I applied the Set implementation
- We need to print the shortest path.
	- To achieve this , we are storing the parent in a vector where parent[u] yield the parent of u.
	- So whenever the dist get updated , store for that node who is the parent that is updating it's distance.


### How to get the parent's.

- In parent vector , on each index u it store the parent of that node u.
	- Initialize a node as the last node , because we will be backtracking 
	- Now get the parent of last node , push it in the vec , and then update the traversal node as the parent.
	- What this does is last node stores the node which made it's distance least as the parent , traversal node becomes the parent , and the loop continues till the traversal node is the parent of itself.

```cpp
while(node != parent[node]) {
	int par = parent[node];
	ans.push_back(par);
	node = parent[node];
}
```


#### Full Code

```cpp
//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;


// } Driver Code Ends

class Solution {
  public:
    vector<int> shortestPath(int n, int m, vector<vector<int>>& edges) {
        // Code here
        vector<vector<pair<int , int>>> adj(n+1);
        convert(edges , adj);
        set<pair<int , int>> st;
        vector<int> dist(n+1 , 1e9);
        vector<int> parent(n+1 , 0);
        parent[1] = 1;
        dist[1] = 0;
        st.insert({0 , 1});

        while(!st.empty()) {
            auto top = *(st.begin());
            int dis = top.first;
            int node = top.second;
            st.erase(top);
            for(auto it : adj[node]) {
                int edgeWt = it.second;
                int neighbor = it.first;
                if(dis + edgeWt < dist[neighbor]) {
                    if(dist[neighbor] == 1e9) {
                        dist[neighbor] = dis + edgeWt;
                        st.insert({dist[neighbor] , neighbor});
                        parent[neighbor] = node;
                    } else {
                        int prevDist = dist[neighbor];
                        dist[neighbor] = dis + edgeWt;
                        st.erase({prevDist , neighbor});
                        st.insert({dist[neighbor] , neighbor});
                        parent[neighbor] = node;
                    }
                }
            }

        }
        if(dist[n] == 1e9) {
            vector<int> ans;
            ans.push_back(-1);
            return ans;
        }
        int node = n;
        vector<int> ans;
        ans.push_back(n);
        while(node != parent[node]) {
            int par = parent[node];
            ans.push_back(par);
            node = parent[node];
        }
        ans.push_back(dist[n]);
        reverse(ans.begin() , ans.end());
        return ans;
    }
    
    void convert(vector<vector<int>> &edges  , vector<vector<pair<int , int>>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            int wt = edge[2];
            adj[u].push_back({v , wt});
            adj[v].push_back({u , wt});
        }
    }
};



// } Driver Code Ends
```




## References
- [striver sheet link](https://takeuforward.org/data-structure/dijkstras-algorithm-using-set-g-33/)
- [GFG question link](https://www.geeksforgeeks.org/problems/shortest-path-in-weighted-undirected-graph/1)
- ![yt video link](https://www.youtube.com/watch?v=rp1SMw7HSO8&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=36&ab_channel=takeUforward)
