*19-04-2025 18:13*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[graph]] [[hard]]

# Surrounded Regions
- *Problem* *Statement*: 
	You are given an m x n matrix board containing letters 'X' and 'O', capture regions that are surrounded:
	
	* Connect: A cell is connected to adjacent cells horizontally or vertically.
	
	* Region: To form a region connect every 'O' cell.
	
	* Surround: The region is surrounded with 'X' cells if you can connect the region with 'X' cells and none of the region cells are on the edge of the board.
	To capture a surrounded region, replace all 'O's with 'X's in-place within the original board. You do not need to return anything.
	![[Pasted image 20250419183747.png]]

#### Solution
- The intituion is that any 'O' that is at the boundary can never be surrounded. Any O connected with the boundary O can also be never surrounded.
- So , we perform [[DFS]] from the boundary O and marking all O that are connected with this O.
	Remember to write the condition of only traversing 'O'

##### All Boundary Traversal
```cpp


// First row
for (int i = 0; i < n; i++) {
  if (board[0][i] == 'O' and !vis[0][i]) {
	dfs({0, i}, board, vis);
  }
}

// Last row
for (int i = 0; i < n; i++) {
  if (board[m - 1][i] == 'O' and !vis[m - 1][i]) {
	dfs({m - 1, i}, board, vis);
  }
}
// First Column
for (int i = 0; i < m; i++) {
  if (board[i][0] == 'O' and !vis[i][0]) {
	dfs({i, 0}, board, vis);
  }
}

// Last Column
for (int i = 0; i < m; i++) {
  if (board[i][n - 1] == 'O' and !vis[i][n - 1]) {
	dfs({i, n - 1}, board, vis);
  }
}
```


- *We keep a vis array that tracks which O are marked with the boundary BFS.*
- If any O that are not marked by traversal from any boundary O are surely trapped.
- So in the end we mark all the O that were not visited 

##### Marking all 'O' that were not marked
```cpp

for (int i = 0; i < m; i++) {
  for (int j = 0; j < n; j++) {
	if (board[i][j] == 'O' and !vis[i][j]) {
	  board[i][j] = 'X';
	}
  }
}
```


##### Full Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  struct Info {
    int row;
    int col;
  };

public:
  void solve(vector<vector<char>> &board) {
    int m = board.size();
    int n = board[0].size();
    vector<vector<bool>> vis(m, vector<bool>(n, false));

    for (int i = 0; i < n; i++) {
      if (board[0][i] == 'O' and !vis[0][i]) {
        dfs({0, i}, board, vis);
      }
    }

    for (int i = 0; i < n; i++) {
      if (board[m - 1][i] == 'O' and !vis[m - 1][i]) {
        dfs({m - 1, i}, board, vis);
      }
    }

    for (int i = 0; i < m; i++) {
      if (board[i][0] == 'O' and !vis[i][0]) {
        dfs({i, 0}, board, vis);
      }
    }

    for (int i = 0; i < m; i++) {
      if (board[i][n - 1] == 'O' and !vis[i][n - 1]) {
        dfs({i, n - 1}, board, vis);
      }
    }
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == 'O' and !vis[i][j]) {
          board[i][j] = 'X';
        }
      }
    }
  }

  void dfs(Info info, vector<vector<char>> &board, vector<vector<bool>> &vis) {
    int row = info.row;
    int col = info.col;
    int m = board.size();
    int n = board[0].size();
    vis[row][col] = true;

    int drow[] = {-1, 0, 1, 0};
    int dcol[] = {0, -1, 0, 1};
    for (int i = 0; i < 4; i++) {
      int nrow = row + drow[i];
      int ncol = col + dcol[i];
      if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n and
          !vis[nrow][ncol] and board[nrow][ncol] == 'O') {
        dfs({nrow, ncol}, board, vis);
      }
    }
  }
};
// @leet end

```




## References
- [striver sheet link](https://takeuforward.org/graph/surrounded-regions-replace-os-with-xs/)
- [yt video link](https://www.youtube.com/watch?v=BtdgAys4yMk&ab_channel=takeUforward)
- [leetcode question link](https://leetcode.com/problems/surrounded-regions/)