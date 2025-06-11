*05-06-2025 10:26*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Kosaraju's Algorithm

##### Problem Statement
Given an adjacency list, adj of Directed Graph, Find the number of strongly connected components in the graph.
##### Solution
- This alogotithm is only applicable on Directed cyclic graph.
- This algorithm is used to find strongly connected components. 
	- Strongly connected components are those in which every pair of nodes is reachable.
	- Single node is counted as an SCC.
- The intuition in this algorithm is
	- If we see the graph and reverse it's edges for now.  
	- SCC1 -> SCC2 -> SCC3 -> SCC4
- So we can reverse the edges and then perform dfs and we can find the SCC 
- But the cavaet is maybe the starting point is in another SCC.
	- To counter this we first perform dfs to get the actual finishing order. 
##### Steps
- Perform dfs on the graph and store the finishing order in a stack.
- Reverse the edges of the graph
- Then perform the dfs on the stack

- Pop out the elems from the stack and check if they are visited or not.
- Whenever a new dfs call is made , we are entering another SCC
##### Handwritten Notes
![[Kosaraju algo.pdf]]
##### Code
```cpp
class Solution {
  public:
    int kosaraju(vector<vector<int>> &adj) {
        int n = adj.size();
        vector<int> vis(n , 0);
        stack<int> st;
        
        for(int i = 0 ; i < n ; i++) {
            if(!vis[i]) {
                dfs(i , adj , vis , st);    
            }
                
        }
        
        vector<vector<int>> revAdj = reverseEdges(adj);
        
        int cnt = 0;
        for(int i = 0 ; i < n ; i++) {
            vis[i] = 0;
        }
        while(!st.empty()) {
            int node = st.top();
            st.pop();
            if(!vis[node]) {
                cnt++;
                dfsWithoutStack(node , revAdj , vis);   
            }
        }
        
        return cnt;
        
    }
    
    void dfs(int node , vector<vector<int>> &adj , vector<int> &vis, stack<int> &st) {
        vis[node] = 1;
        for(auto it : adj[node]) {
            if (!vis[it]) {
                dfs(it , adj , vis, st);
            }
        }
        st.push(node);
    }
    
    void dfsWithoutStack(int node , vector<vector<int>> &adj , vector<int> &vis) {
        vis[node] = 1;
        for(auto it : adj[node]) {
            if (!vis[it]) {
                dfsWithoutStack(it , adj , vis);
            }
        }
    }
    
    
    
    vector<vector<int>> reverseEdges(vector<vector<int>> &adj) {
        int n = adj.size();
        vector<vector<int>> revAdj(n);
        for(int i = 0 ; i < n ; i++) {   
            for(auto it : adj[i]) {
                revAdj[it].push_back(i);   
            }
        }
        return revAdj;
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/graph/strongly-connected-components-kosarajus-algorithm-g-54/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?v=R6uoSjZ2imo&feature=youtu.be)        //cout << "visited " << node << " from the dfs func " << endl;
ghhhhhhhh