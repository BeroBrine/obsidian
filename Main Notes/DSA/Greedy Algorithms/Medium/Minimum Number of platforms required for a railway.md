*25-07-2025 17:04*

*Status*:

*Tags*: [[dsa]] [[greedy algorithms]] [[medium question]]

# Minimum Number of platforms required for a railway

##### Problem Statement
You are given the arrival times arr[] and departure times dep[] of all trains that arrive at a railway station on the same day. Your task is to determine the minimum number of platforms required at the station to ensure that no train is kept waiting.

At any given time, the same platform cannot be used for both the arrival of one train and the departure of another. Therefore, when two trains arrive at the same time, or when one arrives before another departs, additional platforms are required to accommodate both trains.

Ex
	Input: arr[] = [900, 940, 950, 1100, 1500, 1800], dep[] = [910, 1200, 1120, 1130, 1900, 2000]
	Output: 3
	Explanation: There are three trains during the time 9:40 to 12:00. So we need a minimum of 3 platforms.
##### Solution
- To solve this question we have three approach

**Bruteforce**
- For any train , we know that if it intersects with other trains then we need a new platform to accomodate for it.
- To check if a train is intersecting we have 4 conditions
	- arrived late and departed late
	- arrived early and departed late
	- arrived early and departed early
	- arrived late and departed early
- If any of these 4 conditions are met by a train then we need a new platform
- So for every train we need to check if there's any train that meets this condition
- This approach is O(n * n)

**Optimised**
- If we observe , the dept and arr are time values
	- If we see on the basis of time values that at what time slot there is a train standing on a platform and when the platform got empty. (Just Like IRL)
	- We can increase a count variable if there is a train arriving at a specific time and decrease if there's a train departing.
	- Maximum value of this will give the min number of platforms required.
- We have two approach
	**Space Not Optimised**
	- One is to use a priority queue and store all the values of dept and arr with a flag of arrival
	- Then just iterate over the queue and count the max number of flag as arrived
	**Space Optimised**
	- We can use two pointer approach used in mergin two sorted arrays 
		- take two pointer i and j and check if arr[i] <= arr[j] , if this is the case then the train is most definitely arriving and we can increment the counter and i  
		- if this is not the case then we need to check for same value of i but next value of j , and decrease the counter as a train has departed because we are moving the j counter.
		
##### Handwritten Notes
![[Railway.pdf]]

##### Optimal Code 
```cpp
class Solution {
  public:
    // Function to find the minimum number of platforms required at the
    // railway station such that no train waits.
    int findPlatform(vector<int>& arr, vector<int>& dep) {
        sort(arr.begin() , arr.end());
        sort(dep.begin() , dep.end());
        int itr = 0;
        int cnt = 0;
        int i = 0 , j = 0;
        int n = arr.size();
        while(i < n) {
            if(arr[i] <= dep[j]) {
                //cout << arr[i] << ' ' << dep[j] << "||";
                itr++;
                i++;
            } else {
                itr--;
                j++;
            }
            cnt = max(cnt , itr);
        }
        return cnt;
        
    }
};


```
##### My impl Code
```cpp
class Solution {
  public:
    // Function to find the minimum number of platforms required at the
    // railway station such that no train waits.
    struct TrainInfo {
        int ti;
        bool arrived; // if false it mean it was departure time
    };
    
    struct ArrivalComp {
      bool operator()(const TrainInfo &a , const TrainInfo &b) {
          return a.ti > b.ti;
      }  
    };
    
    int findPlatform(vector<int>& arr, vector<int>& dep) {
        priority_queue<TrainInfo , vector<TrainInfo>  , ArrivalComp> pq;
        
        int n = arr.size();
        for(int i = 0 ; i < n ; i++) {
            int trainArrival = arr[i];
            pq.push({trainArrival , true});
        }
        
        for(int i = 0 ; i < n ; i++) {
            int trainDept = dep[i];
            pq.push({trainDept , false});
        }
        
        int itr = 0;
        int cnt = 0;
        
        
        
        while(!pq.empty()) {
            auto top = pq.top();
            pq.pop();
            // cout << "( " << top.ti << " , " << top.arrived << " )" << ' ';
            bool arrival = top.arrived;
            if(arrival){ itr++; cnt = max(itr , cnt); }
            else itr--;
        }
        return cnt;
    }
};


```
## References
- [striver sheet link](https://takeuforward.org/data-structure/minimum-number-of-platforms-required-for-a-railway/)
- [GFG question link]()
- ![yt video link](https://www.youtube.com/watch?si=165acXU_dtqOHuo9&v=AsGzwR_FWok&feature=youtu.be)