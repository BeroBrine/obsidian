*25-07-2025 22:09*

*Status*: [[quirky]] 

*Tags*: [[dsa]] [[greedy algorithms]] [[medium question]]

# Job Sequencing

##### Problem Statement
You are given two arrays: deadline[], and profit[], which represent a set of jobs, where each job is associated with a deadline, and a profit. Each job takes 1 unit of time to complete, and only one job can be scheduled at a time. You will earn the profit associated with a job only if it is completed by its deadline.

Your task is to find:
    The maximum number of jobs that can be completed within their deadlines.
    The total maximum profit earned by completing those jobs.


Input: deadline[] = [4, 1, 1, 1], profit[] = [20, 10, 40, 30]
Output: [2, 60]
Explanation: Job1 and Job3 can be done with maximum profit of 60 (20+40).
##### Solution
- This question can be done using two ways   

**Greedy Algo**
- For the greedy approach , we greedily choose that we will do the job has the largest deadline on the last day.
	- i.e , we have maximium number of days  = largest deadline
- And we have to maximize our profits as well 
- To achieve this , just sort the jobs on basis of profits
	- Create a struct for a job (id , deadline , profit) and a vector which will store these struct
- Create a hash array which will be equal to the max no of days we have + 1 (as this will be 1 indexed)
	- Now for each job , check if we have the day available on which it's deadline ends
		- eg , job 1 has deadline of 6 days , so we can do this job on the 6th day
		- If the day is not available , we can still perform it on a day before the deadline
		- So check if there is a day available to complete this job or not.

**Disjoint Set***



##### Handwritten Notes
![[Job sequencing.pdf]]
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
- [striver sheet link](https://takeuforward.org/data-structure/job-sequencing-problem/)
- [GFG question link](https://www.geeksforgeeks.org/problems/job-sequencing-problem-1587115620/1)
- ![yt video link](https://www.youtube.com/watch?si=wvcemJ5BLPlTRmkG&v=QbwltemZbRg&feature=youtu.be)