*26-07-2025 00:53*

*Status*:

*Tags*: [[dsa]] [[]]
# Fractional Knapsack Problem

##### Problem Statement
Given two arrays, val[] and wt[], representing the values and weights of items, and an integer capacity representing the maximum weight a knapsack can hold, determine the maximum total value that can be achieved by putting items in the knapsack. You are allowed to break items into fractions if necessary.
Return the maximum value as a double, rounded to 6 decimal places.

Input: val[] = [60, 100, 120], wt[] = [10, 20, 30], capacity = 50
Output: 240.000000
Explanation: Take the item with value 60 and weight 10, value 100 and weight 20 and split the third item with value 120 and weight 30, to fit it into weight 20. so it becomes (120/30) * 20=80, so the total value becomes 60+100+80.0=240.0 Thus, total maximum value of item we can have is 240.00 from the given capacity of sack


##### Solution
- For this question , we need to put things with the highest profit per unit weight 
- So we need sort the items in terms of who has the highest puw.
- This is classic greedy algo implementation now
	- Keep in mind the custom comparator and the return value
		- Custom comparator should make a < b 
			- Why? because in c++ if this evaluated to false , a will stay on top and b will be pushed 





##### Handwritten Notes
![[knapsack fractional.pdf]]
##### Code
```cpp
// class implemented
/*
struct Item{
    int value;
    int weight;
};
*/

class Solution {
  public:
    struct Item {
      int value;
      int weight;
    };
    struct CustomComp {
        bool operator()(const Item &a , const Item &b) {
           // cout <<  ((double)(a.value / a.weight)) < ((double)(b.value / b.weight)) << endl;
            return (1.0 * a.value / a.weight) < (1.0 * b.value / b.weight);
        }
    };
    
    double fractionalKnapsack(vector<int>& val, vector<int>& wt, int capacity) {
        priority_queue<Item , vector<Item> , CustomComp> pq;
        
        int n = val.size();
        
        for(int i = 0 ; i < n ; i++) {
            pq.push({val[i] , wt[i]});
        }
        double profit = 0; 
        while(!pq.empty()) {
            Item item = pq.top();
            pq.pop();
            int itemValue = item.value;
            int itemWeight = item.weight;
           // cout << " putting the item " << itemValue << ' ' << itemWeight << " in the bag " << endl;
            if(itemWeight <= capacity) {
                profit += itemValue;
                capacity -= itemWeight;
               
            } else {
                if(capacity == 0) break; 
                //cout << "capacity is " << capacity << endl;
                double test = ((1.0 * itemValue / itemWeight) * capacity );
               // cout << "the test is " << test << endl;
                profit += test;
                capacity = 0;
            }
        }
        return profit;
    }
};

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/fractional-knapsack-problem-greedy-approach/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?si=8R2By3wpHo0zZVHE&v=1ibsQrnuEEg&feature=youtu.be)