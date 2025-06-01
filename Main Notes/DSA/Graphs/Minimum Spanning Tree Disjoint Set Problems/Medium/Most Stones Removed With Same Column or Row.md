*01-06-2025 18:39*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Most Stones Removed With Same Column or Row
- *Problem* *Statement*: 
	On a 2D plane, we place n stones at some integer coordinate points. Each coordinate point may have at most one stone.
	
	A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.
	
	Given an array stones of length n where stones[i] = [x_i, y_i] represents the location of the i^th stone, return the largest possible number of stones that can be removed.
	│ Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
	│ Output: 5
	│ Explanation: One way to remove 5 stones is as follows:
	│ 1. Remove stone [2,2] because it shares the same row as [2,1].
	│ 2. Remove stone [2,1] because it shares the same column as [0,1].
	│ 3. Remove stone [1,2] because it shares the same row as [1,0].
	│ 4. Remove stone [1,0] because it shares the same column as [0,0].
	│ 5. Remove stone [0,1] because it shares the same row as [0,0].
	│ Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.













##### Code
```cpp
```
##### Handwritten Notes
## References
- [striver sheet link](https://takeuforward.org/data-structure/most-stones-removed-with-same-row-or-column-dsu-g-53/)
- [leetcode question link](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/)
- ![yt video link](https://www.youtube.com/watch?v=OwMNX8SPavM&feature=youtu.be)