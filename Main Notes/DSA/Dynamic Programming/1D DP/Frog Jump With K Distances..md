*14-06-2025 19:01*

*Status*:

*Tags*: [[dsa]] [[dp]] [[medium question]]

# Frog Jump With K Distances.

##### Problem Statement
This is the [[Frog Jump]] but in this the frog can jump k steps.

##### Solution
- The solution followed will be of [[Frog Jump]]. 
- But for the k steps , think if the frog could jump 3 steps.
	- We would have added another 3rd steps in which f(ind-3) + abs(height(ind) - height(ind-3)).
	- But here we have k steps.
		- So we will apply a for loop which goes upto k.
		- And from each of the branch we will check which one returned the minimum among them.
###### Tabulation
- Convert the recurrence relation in tabulation by 
	- Check the no of changing parameters -> 1 (index)
	- Create a dp[changing param + 1].
	- State the base case -> dp[0] = 0;
	- Run a for loop until the no of steps
		- Run a for loop until the k and perform the recurrence relation
		
###### Space Optimization
- This question can be space optimized to O(K) but worst case can be k = n , so no need to space optimize this.
##### Handwritten Notes
![[Frog jump k.pdf]]
##### Code -> Check Notes
```cpp
#include <bits/stdc++.h>

using namespace std;



int helper(int n, int k, vector<int> &heights) {

	if(n == 0) return 0;
	int minSteps = INT_MAX;
	for(int j=1; j<=k; j++) {
		int l = INT_MAX;
		if(n-j >= 0)
			l = helper(n-j, k, heights) + abs(heights[n] - heights[n-j]);
		minSteps = min(minSteps, l);
	}
	return minSteps;
}

int frogKJump(int n, int k, vector<int> &heights) {
	return helper(n-1, k, heights);
}

int main(){
	vector<int> heights;
	heights = {10, 20, 30, 10};
	cout << frogKJump(4, 2, heights);
	cout << endl;
	heights = {10, 50, 10};
	cout << frogKJump(3, 2, heights);
}
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/dynamic-programming-frog-jump-with-k-distances-dp-4/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?v=Kmh3rhyEtB8)