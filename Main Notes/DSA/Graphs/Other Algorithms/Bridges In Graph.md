*03-06-2025 23:02*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[graph]] [[hard]]

# Bridges In Graph

##### Problem Statement
There are n servers numbered from 0 to n - 1 connected by undirected server-to-server connections forming a network where connections[i] = [a_i, b_i] represents a connection between servers a_i and b_i. Any server can reach other servers directly or indirectly through the network.

A critical connection is a connection that, if removed, will make some servers unable to reach some other server.

Return all critical connections in the network in any order.



󰛨 Example 1:

![img](https://assets.leetcode.com/uploads/2019/09/03/1537_ex1_2.png)

│ Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
│ Output: [[1,3]]
│ Explanation: [[3,1]] is also accepted.

󰛨 Example 2:

│ Input: n = 2, connections = [[0,1]]
│ Output: [[0,1]]
##### Solution
- This question is also called Tarjan's algorithm. 
	- This uses a modified version of [[DFS]].
- *Look into handwritten notes*

- A bridge is an edge , if broken , will break the graph into 2 or more components.

- This algorithm maintains 2 arrays.
	- tin[] -> array which stores the "step" on which the node was visited in the dfs.
	- low[] -> array which stores the lowest "step" the node can be reached by adjacent nodes except parent node.
		- What this essentially tells that dfs reached me with tin[] step but i can definitely be reached in low[] steps by other node.	
		- Why not parent node? 
			- Because the bridge check will be done with the parent.
				- We want to see if there's any other way to reach the parent. 

- For each node.
	- Perform dfs for each node and store the "timer" or "step" it took to reach the node.
	- Mark the node as visited.
	- Perform dfs for adjacent nodes and skip for parent.
		- Now when the dfs ends for the adjacent nodes. 
			- The node asks it's neighbors except parent that hey what steps it took to reach you? 
				- If they are less than the low[] of the node itself , it stores it describing that i can be reached in this many steps too.
		- Now the check for bridge happens. 
			- It's obvious that if the no of steps it took to reach the node is smaller , i.e tin[] , than the lowest it took to reach the neighbor node ,i.e low[] ,  there is no other way to reach the neighbouring node from here.
			if(tin[node] > low[neighborNode]) -> it is a bridge.
	- Also if the node is already visited , we know that there cannot be bridge if the neighboring node is already visited. 
		- So just take it's low and move on
- Remember , low is very greedy

##### Handwritten Notes
![[Bridges in graph.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
private:
  int timer = 1;

private:
  void dfs(int node, int parent, int tin[], int low[],
           vector<vector<int>> &bridges, vector<vector<int>> &adj,
           vector<int> &vis) {
    vis[node] = 1;
    tin[node] = low[node] = timer;
    timer++;

    for (auto neighborNode : adj[node]) {
      if (neighborNode == parent)
        continue;
      if (!vis[neighborNode]) {
        dfs(neighborNode, node, tin, low, bridges, adj, vis);
        low[node] = min(low[neighborNode], low[node]);
        if (low[neighborNode] > tin[node]) {
          bridges.push_back({neighborNode, node});
        }
      } else {
        low[node] = min(low[neighborNode], low[node]);
      }
    }
  }

public:
  vector<vector<int>> criticalConnections(int n,
                                          vector<vector<int>> &connections) {

    vector<vector<int>> adj(n);
    for (auto it : connections) {
      int u = it[0];
      int v = it[1];
      adj[u].push_back(v);
      adj[v].push_back(u);
    }

    vector<vector<int>> bridges;
    vector<int> vis(n, 0);
    int tin[n];
    int low[n];
    dfs(0, -1, tin, low, bridges, adj, vis);
    return bridges;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/graph/bridges-in-graph-using-tarjans-algorithm-of-time-in-and-low-time-g-55/)
- [leetcode question link](https://leetcode.com/problems/critical-connections-in-a-network/description/)
- ![yt video link](https://www.youtube.com/watch?v=qrAub5z8FeA&feature=youtu.be)