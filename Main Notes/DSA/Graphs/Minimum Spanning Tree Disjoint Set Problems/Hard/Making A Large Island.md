*02-06-2025 10:17*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Making A Large Island

##### Problem Statement
You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

Return the size of the largest island in grid after applying this operation.

An island is a 4-directionally connected group of 1s.

󰛨 Example 1:
│ Input: grid = [[1,0],[0,1]]
│ Output: 3
│ Explanation: Change one 0 to 1 and connect two 1s, then we get an island with area = 3.
##### Solution
- This question uses [[Disjoint Set Union By Rank And Size]]. 
	- *It is important to use union by size here because we need the size of each component.* 
- The matrix to node conversion is similar to that of [[Number Of Island 2]]. i,e row * no of col + col;
	- We first build the graph by traversing and checking if there's a one then start building the graph by checking in it's 4 directions where is 1. 
	- After this , we convert 0's and check the if there's a graph on the side.
		- If there is one , push it's ultimate parent in a set.
		- Why set?
			- This is an edge case. 
			![[FT_2025-06-03 09:51:46.970.png]]
			
- After completing the traversal for one cell , take out the ultimate parents from the set and add their size to get the maxi.
- The size of the graph will be (connected comp) + 1 for itself.

##### Handwritten Notes
![[Making a large island.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  vector<int> size, parent;

public:
  int largestIsland(vector<vector<int>> &grid) {
    int n = grid.size();
    size.resize(n * n, 1);
    parent.resize(n * n, 0);
    for (int i = 0; i < n * n; i++)
      parent[i] = i;

    int drow[] = {-1, 0, 1, 0};
    int dcol[] = {0, 1, 0, -1};
    // connect already exisiting graph
    for (int row = 0; row < n; row++) {
      for (int col = 0; col < n; col++) {
        if (grid[row][col] == 1) {
          for (int i = 0; i < 4; i++) {
            int nrow = row + drow[i];
            int ncol = col + dcol[i];
            if (nrow >= 0 and ncol >= 0 and ncol < n and nrow < n and
                grid[nrow][ncol] == 1) {
              int oldNode = row * n + col;
              int newNode = nrow * n + ncol;
              unionBySize(oldNode, newNode);
            }
          }
        }
      }
    }
    int maxi = INT_MIN;
    int flag = false;
    for (int row = 0; row < n; row++) {
      for (int col = 0; col < n; col++) {
        if (grid[row][col] == 0) {
          int flag = true;
          set<int> set;
          for (int i = 0; i < 4; i++) {
            int nrow = row + drow[i];
            int ncol = col + dcol[i];
            if (nrow >= 0 and ncol >= 0 and ncol < n and nrow < n and
                grid[nrow][ncol] == 1) {
              int newNode = nrow * n + ncol;
              int ult_newNode = findUParent(newNode);
              cout << ult_newNode << endl;
              set.insert(ult_newNode);
            }
          }
          int sum = 0;
          for (auto it : set) {
            sum += size[it];
          }
          maxi = max(sum, maxi);
        }
      }
    }

    maxi++;
    for (int i = 0; i < n * n; i++) {
      maxi = max(maxi, size[findUParent(i)]);
    }

    return maxi;
  }

  int findUParent(int node) {
    if (node == parent[node]) {
      return node;
    }

    return parent[node] = findUParent(parent[node]);
  }

  void unionBySize(int u, int v) {
    int ult_u = findUParent(u);
    int ult_v = findUParent(v);
    if (ult_u == ult_v)
      return;
    if (size[ult_u] < size[ult_v]) {
      parent[ult_u] = ult_v;
      size[ult_v] += size[ult_u];
    } else {
      parent[ult_v] = ult_u;
      size[ult_u] += size[ult_v];
    }
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/making-a-large-island-dsu-g-52/)
- [leetcode question link](https://leetcode.com/problems/making-a-large-island/description/)
- ![yt video link](https://www.youtube.com/watch?v=lgiz0Oup6gM&feature=youtu.be)