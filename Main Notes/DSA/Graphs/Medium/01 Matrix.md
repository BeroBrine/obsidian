*19-04-2025 12:56*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[graph]] [[medium question]]

# 01 Matrix
- *Problem* *Statement*: 
	Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
	
	The distance between two cells sharing a common edge is 1.

##### Solution
- This question is very similar to that of [[Rotten Oranges]].
	- We need to find the distance of the nearest 0 for each cell.
		- What we can do is start [[BFS]] from all the 0's at once and they will go fill out the rest of the cells.
		- This works by utilizing the visited array.
		- Each cell is visited by some 0 and that 0 sets the distance of it from himself.
		- And because we are utilizing the ncol and nrow we are sure that the nearest 0 will visit it first.
		- So , whenever we get the front of the queue , get the dist from it and set it for the col and row it specifies.

##### Code
```cpp
class Solution {
  struct Info {
    int row;
    int col;
    int dist;
  };

public:
  vector<vector<int>> updateMatrix(vector<vector<int>> &mat) {
    int m = mat.size();
    int n = mat[0].size();
    vector<vector<int>> dist(m, vector<int>(n));
    vector<vector<int>> vis(m, vector<int>(n, 0));

    queue<Info> q;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 0) {
          q.push({i, j, 0});
          vis[i][j] = 1;
        }
      }
    }
    int drow[] = {-1, 0, 1, 0};
    int dcol[] = {0, -1, 0, 1};

    while (!q.empty()) {
      Info front = q.front();
      q.pop();
      int row = front.row;
      int col = front.col;
      int dis = front.dist;
      dist[row][col] = dis;
      for (int i = 0; i < 4; i++) {
        int nrow = row + drow[i];
        int ncol = col + dcol[i];
        if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n and
            !vis[nrow][ncol]) {
          vis[nrow][ncol] = 1;
          int new_dist = dis + 1;
          q.push({
              nrow,
              ncol,
              new_dist,
          });
        }
      }
    }
    return dist;
  }
};

```





## References
- [striver sheet link](https://takeuforward.org/graph/distance-of-nearest-cell-having-1/)
- [yt video link](https://www.youtube.com/watch?v=edXdVwkYHF8&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/01-matrix/)