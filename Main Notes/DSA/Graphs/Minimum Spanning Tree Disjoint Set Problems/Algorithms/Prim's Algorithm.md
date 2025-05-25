*25-05-2025 16:01*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] 
# Prim's Algorithm
- *Problem* *Statement*: 
	Given a weighted, undirected, and connected graph with V vertices and E edges, your task is to find the sum of the weights of the edges in the Minimum Spanning Tree (MST) of the graph. The graph is represented by an adjacency list, where each element adj[i] is a vector containing vector of integers. Each vector represents an edge, with the first integer denoting the endpoint of the edge and the second integer denoting the weight of the edge.


#### Solution
- This algorithm helps us to find [[Minimum Spanning Tree]].
	- It uses priority queue , which stores pair<int , pair<int , int>> and a vis array.
		- First one is the edge wt , second is the node and third one is the parent , parent is stored if we need to return the nodes in the tree.
	- Push the starting node in the queue but *don't mark it visited*. 
		- We will also not mark visited when pushing in the queue. 
	- We will get the top node and check it it's visisted or not , if it is continue , if it is not then add it's edgeWt and then get it's adjacent node and push it in the queue. 
	- The reason we are not doing vis when we are pushing it in the queue is
		- pq returns the shortest edge wt in the next iteration , so we get the least edge wt for the adj node of the parent node , this essentially mean get the adjNode with the least edge wt and then mark it visited , next time if the node appears again with another wt , algo will know that this node is already in the mst. 

	
##### Full Code
```cpp
class Solution {
  public:
    // Function to find sum of weights of edges of the Minimum Spanning Tree.
    int spanningTree(int V, vector<vector<int>> adj[]) {
        // code here
        priority_queue<pair<int , pair<int , int>> , vector<pair<int , pair<int , int>>> , greater<pair<int , pair<int , int>>>> pq;
        int ans = 0;
        vector<bool> vis(V , false);
        
        pq.push({0 , {0 , -1}});
        
        while(!pq.empty()) {
            auto front = pq.top();
            pq.pop();
            int edgeWt = front.first;
            int node = front.second.first;
            int parent = front.second.second;
            if(vis[node]) continue;
            else vis[node] = true;
            ans += edgeWt;
            for(auto itr : adj[node]) {
                int neighbor = itr[0];
                int wt = itr[1];
                if(!vis[neighbor]) {
                    pq.push({wt , {neighbor , node}});
                }
            }
        }
        return ans;
    }
};
```


## References
- [striver sheet link](https://takeuforward.org/data-structure/prims-algorithm-minimum-spanning-tree-c-and-java-g-45/)
- [GFG question link](https://www.geeksforgeeks.org/problems/minimum-spanning-tree/1)
- ![yt video link](https://www.youtube.com/watch?v=mJcZjjKzeqk&ab_channel=takeUforward)