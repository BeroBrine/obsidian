*19-04-2025 19:30*

*Status*: 

*Tags*: [[dsa]] [[graph]] [[hard]] 

# Number Of Enclaves
- *Problem* *Statement*: 
	You are given an m x n binary matrix grid, where 0 represents a sea cell and 1 represents a land cell.
	
	A move consists of walking from one land cell to another adjacent (4-directionally) land cell or walking off the boundary of the grid.
	
	Return the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves.
	![[Pasted image 20250419193152.png]]
	
##### Solution 
- This question is exact same as that of [[Surrounded Regions]]

##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
public:
  int numEnclaves(vector<vector<int>> &grid) {
    int m = grid.size();
    int n = grid[0].size();
    vector<vector<bool>> vis(m, vector<bool>(n, false));

    for (int i = 0; i < n; i++) {
      if (grid[0][i] == 1 and !vis[0][i]) {
        dfs(0, i, grid, vis);
      }
    }

    for (int i = 0; i < n; i++) {
      if (grid[m - 1][i] == 1 and !vis[m - 1][i]) {
        dfs(m - 1, i, grid, vis);
      }
    }

    for (int i = 0; i < m; i++) {
      if (grid[i][0] == 1 and !vis[i][0]) {
        dfs(i, 0, grid, vis);
      }
    }

    for (int i = 0; i < m; i++) {
      if (grid[i][n - 1] == 1 and !vis[i][n - 1]) {
        dfs(i, n - 1, grid, vis);
      }
    }
    int cnt = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1 and !vis[i][j]) {
          cnt++;
        }
      }
    }
    return cnt;
  }

  void dfs(int row, int col, vector<vector<int>> &grid,
           vector<vector<bool>> &vis) {
    vis[row][col] = true;
    int m = grid.size();
    int n = grid[0].size();
    int drow[] = {-1, 0, 1, 0};
    int dcol[] = {0, 1, 0, -1};

    for (int i = 0; i < 4; i++) {
      int nrow = row + drow[i];
      int ncol = col + dcol[i];
      if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n and
          !vis[nrow][ncol] and grid[nrow][ncol] == true) {
        vis[nrow][ncol] = true;
        dfs(nrow, ncol, grid, vis);
      }
    }
  }
};

```


## References
- [striver sheet link](https://takeuforward.org/graph/number-of-enclaves/)
- [yt video link](https://www.youtube.com/watch?v=rxKcepXQgU4&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/number-of-enclaves/)