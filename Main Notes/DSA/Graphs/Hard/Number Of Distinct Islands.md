*27-04-2025 22:23*

*Status*: [[revise]] 

*Tags*: [[dsa]] [[hard]] [[graph]]

# Number Of Distinct Islands
- *Problem* *Statement*: 
	Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of 'W's (Water) and 'L's (Land). Find the number of islands.

	Note: An island is either surrounded by water or the boundary of a grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.

#### Solution
- This problem is same as that of the one in [[Number Of Provinces]] but for matrix.
	- Perform BFS or DFS for each of the 1 found. All connected ones will be marked as visited. The number of times the bfs or dfs is done from the parent function is the number of island.
	- Keep in mind the directions
```cpp
vector<pair<int, int>> directions = {
	{-1, 0}, // up
	{1, 0},  // down
	{0, -1}, // left
	{0, 1},  // right
	{-1, -1}, // top-left
	{-1, 1},  // top-right
	{1, -1},  // bottom-left
	{1, 1}    // bottom-right
};

for (auto pair : directions) {
	int dr = pair.first;
	int dc = pair.second;
	int nrow = row + dr;
	int ncol = col + dc;
	if (nrow >= 0 && ncol >= 0 && nrow < n && ncol < m &&
		!vis[nrow][ncol] && grid[nrow][ncol] == 'L') {
		dfs(nrow, ncol, grid, vis);
	}
}
```






```cpp
#include <bits/stdc++.h>
using namespace std;



class Solution {
public:
int countIslands(vector<vector<char>>& grid) {
	int n = grid.size();
	int m = grid[0].size();
	int cnt = 0;
  vector<vector<bool>> vis(n , vector<bool>(m , false));
  for(int i = 0 ; i < n ; i++) {
	  for(int j = 0 ; j < m ; j++) {
		  if(!vis[i][j] and grid[i][j] == 'L') {
			 cnt++;
			 dfs(i , j , grid , vis);
		 }
	  }
  }
  return cnt;
	
}

void dfs(int row , int col , vector<vector<char>> &grid , vector<vector<bool>> &vis ) {
	int n = grid.size();
	int m = grid[0].size();
	vis[row][col] = true;
	vector<pair<int, int>> directions = {
		{-1, 0}, // up
		{1, 0},  // down
		{0, -1}, // left
		{0, 1},  // right
		{-1, -1}, // top-left
		{-1, 1},  // top-right
		{1, -1},  // bottom-left
		{1, 1}    // bottom-right
	};

	for (auto pair : directions) {
		int dr = pair.first;
		int dc = pair.second;
		int nrow = row + dr;
		int ncol = col + dc;
		if (nrow >= 0 && ncol >= 0 && nrow < n && ncol < m &&
			!vis[nrow][ncol] && grid[nrow][ncol] == 'L') {
			dfs(nrow, ncol, grid, vis);
		}
	}

}

}
// } Driver Code Ends
```



## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link]()