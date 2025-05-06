*18-04-2025 13:22*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Flood Fill
- *Problem* *Statement*: 
	You are given an image represented by an m x n grid of integers image, where image[i][j] represents the pixel value of the image. You are also given three integers sr, sc, and color. Your task is to perform a flood fill on the image starting from the pixel image(sr)(sc).
	
	To perform a flood fill:

	1. Begin with the starting pixel and change its color to color.
	
	2. Perform the same process for each pixel that is directly adjacent (pixels that share a side with the original pixel, either horizontally or vertically) and shares the same color as the starting pixel.
	
	3. Keep repeating this process by checking neighboring pixels of the updated pixels and modifying their color if it matches the original color of the starting pixel.
	
	4. The process stops when there are no more adjacent pixels of the original color to update.
	Return the modified image after performing the flood fill.

##### Solution
- This is very similar to [[Rotten Oranges]].
- *According to the question , we need to change the cells adjacent to the given cell which has the same original color as the given cell.* 
- Create a struct to store the info about the cells.
```cpp
struct Info {
int row;
int col;
};
```
- Store the original color. 
- Create a visited array. Why do we need visited for this question?
	- We need to track which cells we have visited. Suppose there is no change then it'll cause infinite loop.  
- Push the given cell in the queue to perform [[BFS]]. 
	- Until the queue is empty , perform BFS.
	- Add the adjacent cells in the queue by utilizing drow and dcol.(Look in the Rotten Oranges question).
	- Check if the cell is of the original color and is not already visited.
	- If it is not visited and is of the original color , change the color and mark it as visited and then push it into the queue.
```cpp
while (!q.empty()) {
  Info front = q.front();
  q.pop();
  int row = front.row;
  int col = front.col;
  for (int i = 0; i < 4; i++) {
	int nrow = row + drow[i];
	int ncol = col + dcol[i];
	if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n and
		image[nrow][ncol] == original_color and vis[nrow][ncol] != 1) {
	  image[nrow][ncol] = color;
	  vis[nrow][ncol] = 1;
	  q.push({nrow, ncol});
	}
  }
}
```



#### Complete Code
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
  vector<vector<int>> floodFill(vector<vector<int>> &image, int sr, int sc,
                                int color) {

    queue<Info> q;
    int m = image.size();
    int n = image[0].size();
    int vis[m][n];
    memset(vis, 0, sizeof(vis));
    q.push({sr, sc});
    int original_color = image[sr][sc];
    image[sr][sc] = color;
    vis[sr][sc] = 1;
    int drow[] = {0, -1, 0, 1};
    int dcol[] = {-1, 0, 1, 0};
    while (!q.empty()) {
      Info front = q.front();
      q.pop();
      int row = front.row;
      int col = front.col;
      for (int i = 0; i < 4; i++) {
        int nrow = row + drow[i];
        int ncol = col + dcol[i];
        if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n and
            image[nrow][ncol] == original_color and vis[nrow][ncol] != 1) {
          image[nrow][ncol] = color;
          vis[nrow][ncol] = 1;
          q.push({nrow, ncol});
        }
      }
    }
    return image;
  }
};
// @leet end

```


## References
- [striver sheet link](https://takeuforward.org/graph/flood-fill-algorithm-graphs/)
- [yt video link](https://www.youtube.com/watch?v=C-2_uSRli8o&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/flood-fill/)