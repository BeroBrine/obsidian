*06-05-2025 09:16*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] 

# Find Eventual Safe States
- *Problem* *Statement*: 
	There is a directed graph of n nodes with each node labeled from 0 to n - 1. The graph is represented by a 0-indexed 2D integer array graph where graph[i] is an integer array of nodes adjacent to node i, meaning there is an edge from node i to each node in graph[i].
	
	A node is a terminal node if there are no outgoing edges. A node is a safe node if every possible path starting from that node leads to a terminal node (or another safe node).
	
	Return an array containing all the safe nodes of the graph. The answer should be sorted in ascending order.
#### Solution
- This question is very similar to the [[Cycle Detection In Directed Graph Using BFS (Kahn's Algo)]]
	- After reversing the edges of the graph using the code below. Just apply this algorithm 
```cpp
  void reverseEdges(vector<vector<int>> &graph, vector<vector<int>> &adj) {
    int n = graph.size();
    for (int i = 0; i < n; i++) {
      for (int neighbor : graph[i]) {
        adj[neighbor].push_back(i);
      }
    }
  }

```

#### How does this approach work?
- According to the question terminal nodes (no outgoing edges) , and nodes that only lead to terminal nodes on all paths are safe nodes. any node that is a part of cycle is not a safe node.
- By reversing the edges , first only the terminal nodes have indegree of 0. (First step for Kahn's Algorithm).
- Then performing the algorithm , we are essentialy checking that if the nodes indegree becomes 0 , it means that all path to this are from terminal node (as we started from it)
- This is the reason this algorithm works
	![[Pasted image 20250510073351.png]]
#### Full Code
```cpp

// @leet start
class Solution {
public:
  vector<int> eventualSafeNodes(vector<vector<int>> &graph) {
    int n = graph.size();
    vector<vector<int>> adj(n);
    reverseEdges(graph, adj);
    vector<int> indegree(n);
    calculateIndegree(adj, indegree);
    vector<int> ans;
    queue<int> q;
    for (int i = 0; i < n; i++) {
      if (indegree[i] == 0) {
        q.push(i);
      }
    }
    while (!q.empty()) {
      int node = q.front();
      q.pop();
      ans.push_back(node);
      for (int neighbor : adj[node]) {
        indegree[neighbor] -= 1;
        if (indegree[neighbor] == 0) {
          q.push(neighbor);
        }
      }
    }
    sort(ans.begin(), ans.end());
    return ans;
  }

  void reverseEdges(vector<vector<int>> &graph, vector<vector<int>> &adj) {
    int n = graph.size();
    for (int i = 0; i < n; i++) {
      for (int neighbor : graph[i]) {
        adj[neighbor].push_back(i);
      }
    }
  }

  void calculateIndegree(vector<vector<int>> &adj, vector<int> &indegree) {
    int n = adj.size();
    for (int i = 0; i < n; i++) {
      for (int neighbor : adj[i]) {
        indegree[neighbor] += 1;
      }
    }
  }
};
// @leet end
```


## References
- [striver sheet link](https://takeuforward.org/data-structure/find-eventual-safe-states-bfs-topological-sort-g-25/)
- [yt video link](https://www.youtube.com/watch?v=2gtg3VsDGyc&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/find-eventual-safe-states/)