*25-07-2025 17:04*

*Status*:

*Tags*: [[dsa]] [[greedy algorithms]] [[medium question]]

# Minimum Number of platforms required for a railway

##### Problem Statement






##### Solution
- 





##### Handwritten Notes
![[]]
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