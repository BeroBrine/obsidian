*17-04-2025 16:45*

*Status*:

*Tags*: [[dsa]] [[graph]] [[theory]]

# Graph Representation

#### Representing Graph In C.
- Input
	- N and M --> N nodes and M edges
	- Directed or Undirected
	- M lines -> Represent Edges.
	![[Pasted image 20250417165152.png|300x300]]
	
- Storage -> Stores the M Lines
	- Matrix
	- List

##### Matrix --> This is costly --> O(NxN)
- Called Adjacency Matrix.
	- Check if the nodes indexing is 0 based or 1 based. 
	- If 1 based , define an adjancecy matrix of (n+1 , m+1) else (n , m)
		![[Pasted image 20250417165441.png|300x300]]
	- Mark the intersection as 1 , else 0.


###### Code
```cpp
int main() {
	int n , m;
	cin >> n >> m;
	int adj[n+1][m+1];
	for(int i = 0 ; i < m ; i++) {
		int u, v;
		cin >> u >> v;
		adj[u][v] = 1;
		adj[v][u] = 1;
	}
	return 0;
}
```

#### List -> Adjacency List -> S -> O(2E)
- vector<pair.> adj[n+1] --> if 1 based and n if 0 based 
- Entry contains a node.
- Each entry contains their neighbouring nodes.
	![[Pasted image 20250417173205.png|300x300]]
	

##### Code
```cpp
int main() {
	int n , m;
	cin >> n >> m;
	vector<int> adj;
	for(int i = 0 ; i < m ; i++) {
		int u , v;
		cin >> u >> v;
		// u-->v
		adj[u].push_back(v);
		// don't add this if directed graph.
		adj[v].push_back(u);
	}
	return 0;
}
```

##### Storing weighted graph
- In the adjacency list , store a pair with first being node and the second being the weight of the edge connecting the node. 
	![[Pasted image 20250417174224.png|600x300]]



## References
- [striver sheet link](https://takeuforward.org/graph/graph-representation-in-c/)
- [yt video link](https://www.youtube.com/watch?v=3oI-34aPMWM&feature=youtu.be)