*02-06-2025 09:15*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Number Of Island 2
##### Problem Statement
You are given a n,m which means the row and column of the 2D matrix and an array of  size k denoting the number of operations. Matrix elements is 0 if there is water or 1 if there is land. Originally, the 2D matrix is all 0 which means there is no land in the matrix. The array has k operator(s) and each operator has two integer A[i][0], A[i][1] means that you can change the cell matrix[A[i][0]][A[i][1]] from sea to island. Return how many island are there in the matrix after each operation.You need to return an array of size k.
Note : An island means group of 1s such that they share a common side.

##### Solution
- As in the question we can see that after each query , and connection of components is to be seen , we use [[Disjoint Set Union By Rank And Size]] 
	- What are the nodes here?
		- for each cell we assign the row * m + col to it.
- We keep a visited array to keep track of what cells have been turned into islands.
	- We will keep a cnt variable , for every query and if the cell is not already turned into island , we treat the cell as a single island and increment the cnt.
	- We then start looking for cells on all 4 sides , if we find a cell that's an island and ultimateParent of newNode and oldNode is not same , the case in the below image , then we decrease the cnt variable and union the nodes.
		![[FT_2025-06-02 10:14:01.264.png]]
	


##### Handwritten Notes
![[No of islands 2.pdf]]
##### Code
```cpp
class Solution {
    vector<int> rank , parent;
  public:
    vector<int> numOfIslands(int n, int m, vector<vector<int>> &operators) {
        vector<vector<int>> vis(n , vector<int>(m , 0));
        int noNodes = n * m;
        rank.resize(noNodes + 1 , 0);
        parent.resize(noNodes + 1,  0);
        for(int i = 0 ; i < noNodes ; i++) parent[i] = i;
        int cnt = 0;
        vector<int> ans;
        int drow[] = {-1 , 0 , 1 , 0};
        int dcol[] = {0 , 1, 0, -1};
        for(auto it : operators) {
            int iRow = it[0];
            int iCol = it[1];
            for(int i = 0 ; i < n ; i++) {
                for(int j = 0 ; j < m ; j++) {
                    if(!vis[iRow][iCol]) {
                        vis[iRow][iCol] = 1;
                        cnt++;
                        for(int i = 0 ; i < 4 ; i++) {
                            int nrow = iRow + drow[i];
                            int ncol = iCol + dcol[i];
                            if(nrow < n and ncol < m and nrow >= 0 and ncol >= 0 and vis[nrow][ncol] == 1) {
                                int oldNode = iRow * m + iCol;
                                int newNode = nrow * m + ncol;
                                if(findParent(oldNode) != findParent(newNode)) {
                                    cnt--;
                                    unionByRank(oldNode , newNode);
                                }
                            }
                        }
                        
                    }

                }
                
            }
            ans.push_back(cnt);
        }
        return ans;

    }
    
    int findParent(int node) {
        if(node == parent[node]) return node;
        return parent[node] = findParent(parent[node]);
    }
    int unionByRank(int u , int v ) {
        int ult_u = findParent(u);
        int ult_v = findParent(v);
        
        if(rank[ult_u] < rank[ult_v]) {
            parent[ult_u] = ult_v;
        }
        else if(rank[ult_u] > rank[ult_v]) {
            parent[ult_v] = ult_u;
        }
        else {
            parent[ult_v] = ult_u;
            rank[ult_u]++;
        }
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/graph/number-of-islands-ii-online-queries-dsu-g-51/)
- [GFG question link](https://www.geeksforgeeks.org/problems/number-of-islands/1)
- ![yt video link](https://www.youtube.com/watch?v=Rn6B-Q4SNyA&ab_channel=takeUforward)