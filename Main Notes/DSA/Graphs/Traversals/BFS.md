*17-04-2025 23:18*

*Status*:

*Tags*: [[dsa]] [[traversals]] [[graph]] 

# BFS
- Breadth First Search
- This is very similar to the [[Level Order Traversal]] in binary trees. 
	- But the difference is the starting node can be any node.
	- We track the level by counting the distance of node from the starting node.
	- We still use the queue data structure.
- We keep a queue , a visited array in this traversal.
	- Queue tracks the nodes in level order while visited tracks if the node has been already visited.
	- Keep in mind that if the nodes are 0 based indexing then the visited array is of n size and 1 based indexing the visited array is of n+1 size.
	- Push the starting node in the queue and mark it as visited.
	- Now until the queue is empty take the front node out push it in the bfs vec and then for it's neighbours check if they are visited or not. If they are not visited mark the neighbor visited and then push it into the queue.
	


```cpp
class Solution {
  public:
    // Function to return Breadth First Traversal of given graph.
    vector<int> bfs(vector<vector<int>> &adj) {
        int n = adj.size() ;
        queue<int> q;
        int vis[n] = {0};
        vis[0] = 1;
        q.push(0);
        vector<int> vec;
        while(!q.empty()) {
            int node = q.front();
            q.pop();
            vec.push_back(node);
            for(int i : adj[node]) {
                if(!vis[i]) {
                    vis[i] = 1;
                    q.push(i);
                }
            }
        }
        return vec;
        
    }
};

```










## References
- [striver sheet link](https://takeuforward.org/graph/breadth-first-search-bfs-level-order-traversal/)
- [yt video link](https://www.youtube.com/watch?v=-tgVpUgsQ5k&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/bfs-traversal-of-graph/1)