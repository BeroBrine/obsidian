*10-05-2025 19:42*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]

# Djisktra's Algorithm
- *Problem* *Statement*: 
	Given an undirected, weighted graph with V vertices numbered from 0 to V-1 and E edges, represented by 2d array edges[][], where edges[i]=[u, v, w] represents the edge between the nodes u and v having w edge weight.
	You have to find the shortest distance of all the vertices from the source vertex src, and return an array of integers where the ith element denotes the shortest distance between ith node and source vertex src.
	
	Note: The Graph is connected and doesn't contain any negative weight edge.

### Solution

#### Using Priority Queue
- In this algorithm, the steps are similar to that of [[Shortest Path in UG With Unit Weights]].  
	- But here we have weights associated with the nodes 
	- Due to this we keep a min heap (priority queue) which contains a pair of shortest distance upto this node and the node itself.
	- Priority Queue is initialized with the line 
	
```cpp
priority_queue<pair<int , int> , vector<pair<int , int>> , greater<pair<int , int>>> pq;
```
- The first argument is the type that it will contain , and the second is the container that will be used to contain the type. 
- Third argument is the comparator function. for the pair type , this function automatically assumes the comparison between first element of the pair.

- For each node , check if the distance that it took to reach this node + edgeWeight for the next node is less than the distance already assigned to the next node.
- If it's less than update and push it to the queue so that further nodes use this distance.

```cpp
  public:
    vector<int> dijkstra(int V, vector<vector<int>> &edges, int src) {
        priority_queue<pair<int , int> , vector<pair<int , int>> , greater<pair<int , int>>> pq;
        vector<vector<pair<int , int>>> adj(V);
        convert(edges , adj);
        vector<int> dist(V , 1e9);
        dist[src] = 0;
        pq.push({0 , src});
        
        while(!pq.empty()) {
            int node = pq.top().second;
            int dis = pq.top().first;
            pq.pop();
            for(auto it : adj[node]) {
                int edgeWeight = it.second;
                int neighbor = it.first;
                if(dis + edgeWeight < dist[neighbor]) {
                    dist[neighbor] = dis + edgeWeight;
                    pq.push({dist[neighbor] , neighbor});
                }
            }
        }
        return dist;

    }
    
    void convert(vector<vector<int>> &edges , vector<vector<pair<int , int>>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            int w = edge[2];
            adj[u].push_back({v , w});
            adj[v].push_back({u , w});
        }
    }
```


#### Using Sets -> Faster
- This is a bit faster than using priority queue because we erase the iteration of a node pending if we find a smaller distance already. 
![[Pasted image 20250511140213.png]]
- We use set data structure in this. 
	- This allows us to remove redundant iterations
- Redundant iterations are those in which for eg for the node 5 , we found 10 first , but next we found 8 dist. We update the set with {8 , 5} but there is still a {10 , 5} pending for which the algorithm will do a iteration , it's better to remove this as this will be a redundant iteration 
- Erasing takes log(n) time on the tradeoff of saving a bit more iterations


```cpp
vector<int> dijkstra(int V, vector<vector<int>> &edges, int src) {
        // Code here
        set<pair<int , int>> st;
        vector<int> dist(V , 1e9);
        vector<vector<pair<int , int>>> adj(V);
        convert(edges , adj);
        dist[src] = 0;
        st.insert({0 , src});
       
        while(!st.empty()) {
            auto top = *(st.begin());
            int dis = top.first;
            int node = top.second;
            st.erase(top);
            for(auto neighborInfo : adj[node]) {
                int edgeWt = neighborInfo.first;
                int neighbor = neighborInfo.second;
                if(dis + edgeWt < dist[neighbor]) {
                    if(dist[neighbor] == 1e9) {
                        dist[neighbor] = dis + edgeWt;
                        st.insert({dist[neighbor] , neighbor});
                    } else {
                        int prevDist = dist[neighbor];
                        dist[neighbor] = dis + edgeWt;
                        st.erase({prevDist , neighbor});
                        st.insert({dist[neighbor] , neighbor});
                    }
                 }
            }
        }
        return dist;
    
    }
    
    void convert(vector<vector<int>> &edges , vector<vector<pair<int , int>>> &adj) {
        for(auto edge : edges) {
            int u = edge[0];
            int v = edge[1];
            int wt = edge[2];
            adj[u].push_back({wt , v});
            adj[v].push_back({wt , u});
        }
    }
```

## Why PQ and Not Q

- ![Why PQ And Not Q yt video link](https://youtu.be/3dINsjyfooY?si=c9h9ebF6Tw7i9SBu)


## References
- [striver sheet link](https://takeuforward.org/data-structure/dijkstras-algorithm-using-set-g-33/)
- ![Implementation using Priority Queue yt video link](https://www.youtube.com/watch?v=V6H1qAeB-l4&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=32&ab_channel=takeUforward)
- ![Implementation using Sets yt video link](https://www.youtube.com/watch?v=V6H1qAeB-l4&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=32&ab_channel=takeUforward)
- [leetcode question link](https://www.geeksforgeeks.org/problems/implementing-dijkstra-set-1-adjacency-matrix/1)