*18-05-2025 09:11*

*Status*: [[quirky]]

*Tags*: [[dsa]] [[graph]] [[hard]] 

# Minimum Steps to Reach end From start thorugh operations
- *Problem* *Statement*: 
	Given start, end and an array arr of n numbers. At each step, start is multiplied with any number in the array and then mod operation with 100000 is done to get the new start.
	
	Your task is to find the minimum steps in which end can be achieved starting from start. If it is not possible to reach end, then return -1.

#### Solution
- This problem uses [[Dijkstra's Algorithm]] 
	- Why? Because we need to find the minimum steps it took to reach the end.
		- We don't need the priority case in this case too as we are using steps and steps are being increased one by one.
	- What are the nodes?
		- As stated by the question , there is a mod given , so any number bigger than that mod will be shrunk down.
		- So the number of nodes are equal to the mod
		- Apply dijkstras algo
			- What are the adjacent nodes?
				- Adjacent nodes are the number that will result as the multiplication of the node with the elements of the array.

#### Full Code
```cpp
    int minimumMultiplications(vector<int>& arr, int start, int end) {
        //priority_queue<pair<int , int> , vector<pair<int , int>> , greater<pair<int ,int>>> pq;
        queue<pair<int , int>> pq;
        vector<int> dist(1e5 , 1e9);
        pq.push({0 , start});
        dist[start] = 0;
        int mod = 1e5;
        while(!pq.empty()) {
            auto front = pq.front();
            pq.pop();
            int node = front.second;
            int steps = front.first;
            if(node == end) {
                return steps;   
            }
            for(int it : arr) {
                int mult = (node * it) % mod;

                if(steps + 1 < dist[mult]) {
                    dist[mult] = steps + 1;
                    pq.push({steps +1 , mult});
                }
            }
        }
        return -1;
    }
```

## References
- [striver sheet link](https://takeuforward.org/graph/g-39-minimum-multiplications-to-reach-end/)
- [GFG question link]()
- ![yt video link](https://www.youtube.com/watch?v=_BvEJ3VIDWw&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=40)