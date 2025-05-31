*25-05-2025 18:16*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Disjoint Set By Rank
- This algo finds if a node belongs to a component or not in constant time. Used in dynamic graphs
	- BFS/DFS does that in linear O(N+E) time

- Functionality
	- Find parent 
	- Union -> By Rank and Size

- This algorithm keeps a rank and parent array.
	- Initially all of the nodes parent are themselves and the rank is 0. 

- This main offerring of the algorithm is the ultimate parent.
	- Ultimate parent of a node is the top most parent that even it's parent is connected to.

- The steps are as follows for union of two nodes *u* and *v*.
	- First find the ultimate parents of u and v.
	- Find the ranks of ultimate parents of both.
	- Always connect the smaller rank to the larger one (in this case rank 2 is greater than rank 1).
		- If ranks are similar connect anyone to anyone but keep in mind to increase the rank. 
- If rank of ultimate parent of v is less than that of rank of u.
	- That means ultimate parent needs to go get attached to v.
	- so parent[ult_v] = ult_u;
	Vice Versa

- How do we check if 2 nodes belong to the same component?
	- We find their ultimate parents and then compare , if they are same they belong to the same component and if not they do not belong to the same component.
- But wait , finding parent takes O(logn) time.
	- How is it constant?

- *Path Compression*
	- In this , we essentially say to all the nodes in an array that hey your parent is the ultimate parent , before this we stored the parent for each , the parent may or may not me ultimate parent
	![[FT_2025-05-31 14:23:54.461.png]]
	- In the picture , to find the ultimate parent of 4 we  did p[4] = 2 , p[2] = 1 , p[1] = 1.
		- p[u] = u -> so this is the ultimate parent
	- Path compression does p[4] = 1 , p[2] = 1 , p[1] = 1.
		- So getting the ultimate parent of 4 is just one instruction
- However we do not decrease the ranks in this case because it's not height , if we decrease it may skew the further results. (look at notes for better explanation)
#### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

class DisjointSets {
  vector<int> parent, rank;

public:
  DisjointSets(int n) {
    rank.resize(n + 1, 0);
    parent.resize(n + 1, 0);
    for (int i = 0; i <= n; i++) {
      parent[i] = i;
    }
  }

  int findUltimateParent(int node) {
    if (node == parent[node]) {
      return node;
    }
    // compressing the path
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

  void printRank() {
    for (auto itr : rank) {
      cout << itr << ' ';
    }
    cout << "\n";
  }
};

int main() {

  DisjointSets *set = new DisjointSets(7);

  set->unionByRank(1, 2);
  set->unionByRank(2, 3);
  set->unionByRank(4, 5);

  set->unionByRank(6, 7);
  set->unionByRank(5, 6);

  bool test = set->findUltimateParent(1) == set->findUltimateParent(6);
  cout << " does 1 , 6 belong to the same component " << test << endl; // 0

  set->unionByRank(3, 7);

  bool test1 = set->findUltimateParent(1) == set->findUltimateParent(6);
  cout << " does 1 , 6 belong to the same component " << test1 << endl; // 1

  set->printRank();
}

```




#### Handwritten Note
![[Disjoint sets union by rank.pdf]]

## References
- [striver sheet link](https://takeuforward.org/data-structure/disjoint-set-union-by-rank-union-by-size-path-compression-g-46/)
- [GFG question link](https://www.geeksforgeeks.org/problems/disjoint-set-union-find/1)
- ![yt video link](https://www.youtube.com/watch?v=aBxjDBC4M1U&feature=youtu.be)