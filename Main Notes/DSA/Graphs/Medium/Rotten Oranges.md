*18-04-2025 12:19*

*Status*:

*Tags*: [[dsa]] [[medium question]] [[graph]]

# Rotten Oranges
- *Problem* *Statement*: 
	You are given an m x n grid where each cell can have one of three values:
	
	* 0 representing an empty cell,
	
	* 1 representing a fresh orange, or
	
	* 2 representing a rotten orange.
	
	Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
	
	Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
	

#### Solution
- For this question , for each rotten orange , the fresh oranges connected to it will rot simultaneously. i.e at a distance of 1 on all 4 side.
	- From this we can judge that we will be applying [[BFS]] traversal.

- For each orange , we need to know it's row and col and the time it was rotten at.
	- So create a struct Info which will store all of this
```cpp
  struct Info {
    int row;
    int col;
    int time;
  };

```

- We will maintain vis matrix which will tell us that this orange is already rotten.

- The question states that if there are any oranges left return -1.
	- To tackle this , we will count the fresh oranges while we are looking for rotten oranges.
- Now , according to BFS traversal we need a queue which will start from the starting point.
	- What is the starting point here? All the rotten oranges that were given.
	- So loop over the row and matrix and if cell == 2. Push the row and col with time 0 in the queue and mark it as visited. 

```cpp
for (int i = 0; i < m; ++i) {
  for (int j = 0; j < n; ++j) {
	if (grid[i][j] == 2) {
	  q.push({i, j, 0});
	  vis[i][j] = 1;
	}
	if (grid[i][j] == 1) {
	  cntFresh++;
	}
  }
}
```


- Now perform the BFS traversal.
	- Take out the front node and then extract row col and time from it.
- Compare the time with the max time.
- Now we need to push the neighbouring fresh oranges in the 4 direction
- To get the all 4 rows , the delta row , delta col array is used.
- At the index 0 , the new row becomes row + 0 , new col becomes col + -1. Meaning the left neighbour of the rotten orange. 

```cpp
int drow[] = {-1, 0, 1, 0};
int dcol[] = {0, +1, 0, -1};
int nrow = row + drow[i];
int ncol = col + dcol[i];

```

- We also need to check for the conditions so that nrow and ncol don't go out of bounds.
- Check if the neighbouring orange is already rotten or not by checking in the vis array and check if the neighbouring node is a fresh orange from the grid array (the neighbouring value can be 0).
- If the orange is fresh then push it into the queue with time + 1 and mark it as visited. 
- Increase the rotten orange cnt by 1. This will be used to compare that all oranges are rotten or not with the help of cntFresh we made earlier.
```cpp

while (!q.empty()) {
  Info front = q.front();
  q.pop();
  int row = front.row;
  int col = front.col;
  int time = front.time;
  tm = max(time, tm);
  for (int i = 0; i < 4; ++i) {
	int nrow = row + drow[i];
	int ncol = col + dcol[i];
	if (nrow >= 0 && ncol >= 0 && nrow < m && ncol < n &&
		vis[nrow][ncol] != 1 && grid[nrow][ncol] != 0) {
	  cnt++;
	  vis[nrow][ncol] = 1;
	  int new_time = time + 1;
	  q.push({
		  nrow,
		  ncol,
		  new_time,
	  });
	}
  }
}
```



##### Remember.
- Remember to memset the vis array to 0.

```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  struct Info {
    int row;
    int col;
    int time;
  };

public:
  int orangesRotting(vector<vector<int>> &grid) {
    int m = grid.size();
    int n = grid[0].size();
    int vis[m][n];
    memset(vis, 0, sizeof(vis));
    queue<Info> q;
    int cntFresh = 0;

    for (int i = 0; i < m; ++i) {
      for (int j = 0; j < n; ++j) {
        if (grid[i][j] == 2) {
          q.push({i, j, 0});
          vis[i][j] = 1;
        }
        if (grid[i][j] == 1) {
          cntFresh++;
        }
      }
    }
    int drow[] = {-1, 0, 1, 0};
    int dcol[] = {0, +1, 0, -1};

    int tm = 0;
    int cnt = 0;
    while (!q.empty()) {
      Info front = q.front();
      q.pop();
      int row = front.row;
      int col = front.col;
      int time = front.time;
      tm = max(time, tm);
      // cout << "for the orange (" << row << "," << col << ")" << " the time is
      // "
      //      << time << endl;
      for (int i = 0; i < 4; ++i) {
        int nrow = row + drow[i];
        int ncol = col + dcol[i];
        if (nrow >= 0 && ncol >= 0 && nrow < m && ncol < n &&
            vis[nrow][ncol] != 1 && grid[nrow][ncol] != 0) {
          cnt++;
          vis[nrow][ncol] = 1;
          int new_time = time + 1;
          q.push({
              nrow,
              ncol,
              new_time,
          });
        }
      }
    }
    // cout << "rotted are " << cnt << " but total fresh were " << cntFresh
    //      << endl;
    if (cnt != cntFresh)
      return -1;
    return tm;
  }
};
// @leet end

```


## References
- [striver sheet link]()
- [yt video link]()
- [leetcode question link]()