*30-04-2025 23:03*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Bipartite Graph
- *Problem* *Statement*: 
	There is an undirected graph with n nodes, where each node is numbered between 0 and n - 1. You are given a 2D array graph, where graph[u] is an array of nodes that node u is adjacent to. More formally, for each v in graph[u], there is an undirected edge between node u and node v. The graph has the following properties:
	* There are no self-edges (graph[u] does not contain u).
	
	* There are no parallel edges (graph[u] does not contain duplicate values).
	
	* If v is in graph[u], then u is in graph[v] (the graph is undirected).
	
	* The graph may not be connected, meaning there may be two nodes u and v such that there is no path between them.
	A graph is bipartite if the nodes can be partitioned into two independent sets A and B such that every edge in the graph connects a node in set A and a node in set B.
	
	Return true if and only if it is bipartite.

#### Solution
- In this problem.
	- Remember that any graph containing odd number of nodes in a cycle can never be bipartite.

- To solve this question ,we will be doing [[BFS]] and think of the visited array as the colored array. 
	- This question has disconnected components so keep in mind of that.
	- For each node , we are keeping it's color given by it's parent node. 
	- We check if the node is already colored or not , if it's -1 that means it's not colored and it's colored(visited) by the parent node with opposite color.
	- But if it's already colored , we check that if the neighbor node color is same or different than the current node.
	- If it's opposite no problem
	- But if it's same then the graph is not bipartite and return false.

#### REMEMBER
- When we are doing deeper traversal through dfs. Make sure to NOT ignore the return value
```cpp
if (!dfs({neighbor, new_color}, graph, col)) {
	  return false;
};
```
- If this is not done in the bfs function then the return value will be ignored and may result in false value.

#### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  struct Info {
    int node;
    int color;
  };

public:
  bool isBipartite(vector<vector<int>> &graph) {
    int n = graph.size();
    vector<int> col(n, -1);
    for (int i = 0; i < n; i++) {
      if (col[i] == -1) {
        if (!dfs({i, 0}, graph, col)) {
          return false;
        };
      }
    }
    return true;
  }

  bool dfs(Info info, vector<vector<int>> &graph, vector<int> &col) {
    int node = info.node;
    int color = info.color;
    col[node] = color;
    for (int neighbor : graph[node]) {
      if (col[neighbor] == -1) {
        int new_color = color == 1 ? 0 : 1;
        if (!dfs({neighbor, new_color}, graph, col)) {
          return false;
        };
      } else {
        int neighbor_color = col[neighbor];
        if (neighbor_color == color) {
          return false;
        }
      }
    }
    return true;
  }
};

// @leet end

```


## References
- [striver sheet link](https://takeuforward.org/graph/bipartite-graph-dfs-implementation/)
- [yt video link](https://www.youtube.com/watch?v=KG5YFfR0j8A&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/is-graph-bipartite/)
- [[Bipartite Graph Theory]]