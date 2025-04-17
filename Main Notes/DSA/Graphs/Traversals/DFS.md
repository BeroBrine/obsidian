*18-04-2025 00:01*

*Status*:

*Tags*: [[dsa]] [[traversals]] [[graph]]

# DFS
- Depth First Search
- This is very similar to the [[Inorder]] , [[Postorder]] , [[Preorder]] traversals of the binary tree.
	- Follows recursive pattern.
	- For each node , we are recursively picking up it's one neighbor and then calling the neighbor of this neighbor until all the nodes have been visited.
	- So when coming into the function we mark the node as visited and push it into a vec.
	- Then we pick it's neighbor up and then recursively call the dfs function for each neighbor , but only after checking that if the node has been already visited.
	
```cpp
class Solution {
  public:
    vector<int> dfs(vector<vector<int>>& adj) {
        // Code here
        int n = adj.size();
        int vis[n] = {0};
        vector<int> vec;
        dfs(0 , adj , vis , vec);
        return vec;
        
    }
    
    void dfs(int node , vector<vector<int>> &adj , int vis[], vector<int> &vec) {

        vis[node] = 1;
        vec.push_back(node);
        for(int i : adj[node]) {
            if(!vis[i]) {
                dfs(i , adj , vis , vec);
            }
        }
    }
};

```


## References
- [striver sheet link](https://takeuforward.org/data-structure/depth-first-search-dfs/)
- [yt video link](https://www.youtube.com/watch?v=Qzf1a--rhp8&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/depth-first-traversal-for-a-graph/1)