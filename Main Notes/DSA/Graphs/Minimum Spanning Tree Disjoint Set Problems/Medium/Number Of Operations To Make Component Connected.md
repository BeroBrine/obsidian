*01-06-2025 15:28*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Number Of Operations To Make Component Connected
- *Problem* *Statement*: 
	There are n computers numbered from 0 to n - 1 connected by ethernet cables connections forming a network where connections[i] = [a_i, b_i] represents a connection between computers a_i and b_i. Any computer can reach any other computer directly or indirectly through the network.
	
	You are given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected.
	
	Return the minimum number of times you need to do this in order to make all the computers connected. If it is not possible, return -1.

	![img](https://assets.leetcode.com/uploads/2020/01/02/sample_1_1677.png)
	│ Input: n = 4, connections = [[0,1],[0,2],[1,2]]
	│ Output: 1
	│ Explanation: Remove cable between computer 1 and 2 and place between computers 1 and 3.


#### Solution
- We can use [[DFS]] and [[Disjoint Set Union By Rank And Size]] both here.
	- DFS is just find the number of connected components like [[Number Of Provinces]]
- In disjoint Set , what we can do is build the parent array by applying union by rank.
	- Then we can count how many nodes have itself as the same parent - 1.
		- The subtracted 1 is to account for the node that is the ultimate parent of the graph 

- Also we can return -1 , if there are edges less than n-1 , as there needs to be atleast n-1 "ropes" to connect all the computer

##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  vector<int> rank, parent;

public:
  int makeConnected(int n, vector<vector<int>> &connections) {
    int edges = connections.size();
    if (edges < n - 1)
      return -1;
    rank.resize(n, 0);
    parent.resize(n, 0);
    for (int i = 0; i < n; i++) {
      parent[i] = i;
    }
    for (auto it : connections) {
      int u = it[0];
      int v = it[1];
      unionByRank(u, v);
    }
    int operations = 0;
    for (int i = 0; i < n; i++) {
      if (parent[i] == i) {
        operations++;
      }
    }
    return operations - 1;
  }

  int findUltimateParent(int node) {
    if (node == parent[node]) {
      return node;
    }
    return parent[node] = findUltimateParent(parent[node]);
  }

  void unionByRank(int u, int v) {
    int ult_u = findUltimateParent(u);
    int ult_v = findUltimateParent(v);
    if (ult_u == ult_v)
      return;
    if (rank[ult_u] < rank[ult_v]) {
      parent[ult_u] = ult_v;
    } else if (rank[ult_v] < rank[ult_u]) {
      parent[ult_v] = ult_u;
    } else {
      parent[ult_v] = ult_u;
      rank[ult_u]++;
    }
  }
};
// @leet end

```
##### Handwritten Notes
![[number of operations.pdf]]
## References
- [striver sheet link](https://takeuforward.org/data-structure/number-of-operations-to-make-network-connected-dsu-g-49/)
- [leetcode question link](https://leetcode.com/problems/number-of-operations-to-make-network-connected/)
- ![yt video link](https://www.youtube.com/watch?v=FYrl7iz9_ZU&feature=youtu.be)