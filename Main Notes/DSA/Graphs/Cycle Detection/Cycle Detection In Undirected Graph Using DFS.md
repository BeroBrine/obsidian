*18-04-2025 19:04*

*Status*:

*Tags*: [[dsa]] [[trees]] [[hard]]

# Cycle Detection In Undirected Graph Using DFS
-  This is similar to the [[Cycle Detection In Undirected Graph Using BFS]] but with the [[DFS]] traversal. 


#### Just read the code and you'll understand.
```cpp
class Solution {
    struct Info {
        int node;
        int parent;
    };
  public:
    bool isCycle(int V, vector<vector<int>>& edges) {
        vector<vector<int>> adj(V);
        vector<int> vis(V , 0);
        convert(edges , adj);
        bool flag = false;
        for(int i = 0 ; i < V ; i++) {
            if(!vis[i]) {
                 dfs({i , -1} , adj , vis , flag);
            }
        }
        return flag;
    }
    
    void convert(vector<vector<int>> &edges , vector<vector<int>> &adj) {
        for(auto edge: edges){
            int u = edge[0];
            int v = edge[1];
            adj[u].push_back(v);
            adj[v].push_back(u);

        }
    }
    
    void dfs(Info info , vector<vector<int>> &adj , vector<int> &vis , bool &flag) {
        int node = info.node;
        int parent = info.parent;
        vis[node] = 1;
        
        for(int neighbor:adj[node]) {
            if(neighbor != parent) {
                if(!vis[neighbor]) {
                    vis[neighbor] = 1;
                    dfs({neighbor , node} , adj , vis , flag);
                }  else {
                    flag = true;
                    return;
                }
            }
            
        }
        
    }
    

 


};
```









## References
- [striver sheet link](https://takeuforward.org/data-structure/detect-cycle-in-an-undirected-graph-using-dfs/)
- [yt video link](https://www.youtube.com/watch?v=zQ3zgFypzX4&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/detect-cycle-in-an-undirected-graph/0)