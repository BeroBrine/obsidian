*31-05-2025 16:58*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Kruskal's Algorithm
- This algorithm helps us to find [[Minimum Spanning Tree]].
	- It uses [[Disjoint Set Union By Rank And Size]] data structure.
- Steps
	- Sort the given edges in ascending order of edge wt.
		- Start with the first edge wt , and perform union by rank on it.
		- If the nodes do not belong to the same component , i.e their ultimate parents are not same , then add the edgeWt to the min edge wt required.
		- If the nodes belong to the same component , do not take them into consideration.
- This algorithm works because of the sorting of edge wt , it is already including min edge wt and if we should add an edge into mst is judged by the disjoint set data structure. 


##### Code
```cpp
class Solution {
    vector<int> rank , parent;
  public:
    // Function to find sum of weights of edges of the Minimum Spanning Tree.
    int spanningTree(int V, vector<vector<int>> adj[]) {
        // code here
        vector<pair<int , pair<int , int>>> edges;
        rank.resize(V , 0);
        parent.resize(V , 0);
        for(int i = 0 ; i < V ; i++) parent[i] = i;
        
        for(int i = 0 ; i < V ; i++) {
            for(auto it : adj[i]) {
                int u = it[0];
                int wt = it[1];
                int node = i;
                edges.push_back({wt , {i , u}});
            }
        }
        sort(edges.begin() , edges.end() , [](const auto&a , const auto&b) {
            return a.first < b.first;
        });
        int sum = 0;
        for(auto it : edges) {
            int wt = it.first;
            int u = it.second.first;
            int v = it.second.second;
            unionByRank(u , v , wt , sum);
        }
        
        return sum;
    }
    

    
    void unionByRank(int u , int v , int wt , int &sum) {
        int ult_u = ultimateParent(u);
        int ult_v = ultimateParent(v);
        if(ult_u == ult_v) return;
        sum += wt;
        if(rank[ult_v] < rank[ult_u]) {
            parent[ult_v] = ult_u;
        } else if(rank[ult_u] < rank[ult_v]) {
            parent[ult_u] = ult_v;
        } else  {
            parent[ult_u] = ult_v;
            rank[ult_v]++;
        }
        
    }
    
    int ultimateParent(int node) {
        if(node == parent[node]) return node;
        return parent[node] = ultimateParent(parent[node]);
    }

};

```
##### Handwritten Notes
![[Kruskal algorithm.pdf]]
## References
- [striver sheet link](https://takeuforward.org/data-structure/kruskals-algorithm-minimum-spanning-tree-g-47/)
- [GFG question link](https://www.geeksforgeeks.org/problems/minimum-spanning-tree/1)
- ![yt video link](https://www.youtube.com/watch?v=DMnDM_sxVig&feature=youtu.be)