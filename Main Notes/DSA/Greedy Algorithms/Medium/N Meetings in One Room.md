*25-07-2025 15:40*

*Status*:

*Tags*: [[dsa]] [[greedy algorithms]] [[medium question]]
 
# N Meetings in One Room

##### Problem Statement
You are given timings of n meetings in the form of (start[i], end[i]) where start[i] is the start time of meeting i and end[i] is the finish time of meeting i. Return the maximum number of meetings that can be accommodated in a single meeting room, when only one meeting can be held in the meeting room at a particular time. 

Note: The start time of one chosen meeting can't be equal to the end time of the other chosen meeting.
##### Solution
- To solve this question , we can see that if we greedily choose the fastest ending meetings , we can maximize the number of meetings held. 
- So we can sort the meetings on the basis of end time and then start choosing meetings
	- To achieve this i have created a struct which will hold the start , end , order of the meeing
	- Priority queue with custom comparator is used which sorts on the basis of end time
```cpp

struct CompOrder {
	bool operator()(const MeetingData &a , const MeetingData &b) {
		return a.end > b.end;
	}
};
```

- Put all of the meetings inside of the priority queue.
	- To track the finish time of the last meeting we keep a variable -> this is imp as we cannot start a meeting in between a meeting 
- The first meeting will always be held so we pop it out and set the cnt = 1, finishTime to end time of the first meeting 
- Traverse the queue and check if there's any meeting whose start time is greater than that of end time of last meeting.
	- If this is the case just increase the count
- Return count

##### Handwritten Notes
![[N meeting in a room P1.png]]
##### Code
```cpp
class Solution {
  public:
    // Function to find the maximum number of meetings that can
    // be performed in a meeting room.
    struct MeetingData {
        int start;
        int end;
        int order;
    };
    
    struct CompOrder {
        bool operator()(const MeetingData &a , const MeetingData &b) {
            return a.end > b.end;
        }
    };
    
    int maxMeetings(vector<int>& start, vector<int>& end) {
        priority_queue<MeetingData , vector<MeetingData> , CompOrder> pq;
        
        int i = 0;
        
        int n = start.size();
        
        while(i < n) {
            int meetStart = start[i];
            int meetEnd = end[i];
            int order = i;
            pq.push({meetStart , meetEnd , order});
            i++;
        }
        auto firstMeeting = pq.top();
        pq.pop();
        
        // the first meeting will always be held.
        int cnt = 1;
        int finishTime = firstMeeting.end;
        while(!pq.empty()) {
            auto top = pq.top();
            pq.pop();
            int meetingStart = top.start;
            if(meetingStart > finishTime) {
                cnt++;
                finishTime = top.end;
            }
            
        }
        return cnt;
        
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/n-meetings-in-one-room/)
- [GFG question link](https://www.geeksforgeeks.org/problems/n-meetings-in-one-room-1587115620/1)
- ![yt video link](https://www.youtube.com/watch?v=mKfhTotEguk&ab_channel=takeUforward)