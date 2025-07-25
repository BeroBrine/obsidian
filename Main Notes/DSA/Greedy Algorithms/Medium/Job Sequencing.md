*25-07-2025 22:09*

*Status*: [[quirky]] 

*Tags*: [[dsa]] [[greedy algorithms]] [[medium question]]

# Job Sequencing

##### Problem Statement






##### Solution
- 





##### Handwritten Notes
![[]]
##### Code
```cpp

class Solution {
  public:
    struct Job {
      int id;
      int deadline;
      int profit;
    };
  

  
    vector<int> jobSequencing(vector<int> &deadline, vector<int> &profit) {
        int n = deadline.size();
        vector<Job> jobs;
        for(int i = 0; i < n ; i++) {
            jobs.push_back({i , deadline[i] , profit[i]});
        }
        int maxDeadline = -1;
        for(auto job : jobs) {
            maxDeadline = max(maxDeadline , job.deadline);
        }
        
        sort(jobs.begin() , jobs.end() , [](const Job& a , const Job& b) {
            return a.profit > b.profit;
        });
        vector<int> hash(maxDeadline , -1);
        int profitCnt = 0;
        int cnt = 0;
        
        for(auto job : jobs) {
            for(int i = job.deadline ; i > 0 ; i--) {
                if(hash[i] == -1) {
                    profitCnt += job.profit;
                    cnt += 1;
                    hash[i] = job.id;
                    break;
                }
            }
        }
        return {cnt , profitCnt};
    }
};
```
## References
- [striver sheet link]()
- [leetcode question link]()
- ![yt video link]()