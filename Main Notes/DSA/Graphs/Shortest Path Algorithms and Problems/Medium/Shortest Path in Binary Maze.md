*14-05-2025 20:56*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]] 

# Shortest Path in Binary Maze
- *Problem* *Statement*: 
	Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.
	
	A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:
	
    All the visited cells of the path are 0.
    All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
	The length of a clear path is the number of visited cells of this path.


### Solution
- This is a simple implementation of [[Dijkstra's Algorithm]].
- Just keep in mind the condition of if the starting node is not 0 or if the end node is not 0 then return -1 as there is no way to reach the end node in both of these conditions.
#### Full Code
```cpp
int shortestPathBinaryMatrix(vector<vector<int>> &grid) {
    int n = grid.size();
    if (grid[0][0] != 0 or grid[n - 1][n - 1] != 0) {
      return -1;
    }
    vector<vector<int>> dist(n, vector<int>(n, 1e9));
    // if (grid[0][0] != 0 or grid[n - 1][n - 1] != 0) {
    //   return -1;
    // }
    set<pair<int, pair<int, int>>> set;

    set.insert({1, {0, 0}});
    dist[0][0] = 1;
    vector<pair<int, int>> directions = {{0, -1}, {-1, 0},  {0, 1},
                                         {1, 0},  {-1, -1}, {-1, 1},
                                         {1, -1}, {1, 1}

    };
    while (!set.empty()) {
      auto p = *(set.begin());
      int dis = p.first;
      auto info = p.second;
      int row = info.first;
      int col = info.second;
      set.erase(p);
      for (auto direction : directions) {
        int drow = direction.first;
        int dcol = direction.second;
        int nrow = row + drow;
        int ncol = col + dcol;
        if (nrow < n and ncol < n and nrow >= 0 and ncol >= 0 and
            grid[nrow][ncol] == 0) {
          if (dis + 1 < dist[nrow][ncol]) {
            set.erase({dist[nrow][ncol], {nrow, ncol}});
            dist[nrow][ncol] = dis + 1;
            set.insert({dist[nrow][ncol], {nrow, ncol}});
          }
        }
      }
    }
    return dist[n - 1][n - 1] != 1e9 ? dist[n - 1][n - 1] : -1;
  }
};
```








## References
- [striver sheet link](https://takeuforward.org/data-structure/g-36-shortest-distance-in-a-binary-maze/)
- [leetcode question link](https://leetcode.com/problems/shortest-path-in-binary-matrix/description/)
- ![yt video link](https://www.youtube.com/watch?v=U5Mw4eyUmw4&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=37&ab_channel=takeUforward)