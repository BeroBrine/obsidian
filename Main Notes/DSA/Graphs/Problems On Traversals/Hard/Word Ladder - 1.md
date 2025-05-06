*23-04-2025 21:01*

*Status*: [[revise]] [[hard]]

*Tags*: [[dsa]] [[graph]] [[hard]]

# Word Ladder - 1
- *Problem* *Statement*: 
	A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s_1 -> s_2 -> ... -> s_k such that:
	* Every adjacent pair of words differs by a single letter.
	* Every s_i for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
	* s_k == endWord
	Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

## Solution
- For this question , we will be utilizing [[BFS]].
	- Why BFS? Because , we need to explore every word that matches in the dictionary. 
	- DFS can find a sequence but it may not find the shortest one. Using DFS ensures that whatever the shortest will exhaust the endWord in the dictionary first.
- How will we be applying BFS?
	- Create a struct called Info which will contain the word and steps it took to reach it.
	- For each character in the beginWord. 
		- We will replace the character with a...z.
		- Any matching word will be pushed to the queue and will be removed from the set.
		- Set acts as the visited array here.
		- Why create set out of word dictionary?
			- Because it allows for better deletion and search.
		- When any branch will make the last word, it'll remove it from the set so that further branches can't exhaust.
		- It'll ensure that only the shortest one with the steps will be available.
	- Remember to store the original character before replacing and then restore it when changing the char for the index is done.
		- This is done so that for eg , 1st index is done but 2nd index is pending , so the original word will be needed to correctly parse 2nd index.

```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  struct Info {
    string word;
    int steps;
  };

public:
  int ladderLength(string beginWord, string endWord, vector<string> &wordList) {
    queue<Info> q;
    unordered_set<string> s(wordList.begin(), wordList.end());
    q.push({beginWord, 1});
    s.erase(beginWord);

    while (!q.empty()) {
      auto front = q.front();
      q.pop();
      string word = front.word;
      int steps = front.steps;
      if (word == endWord)
        return steps;
      for (int i = 0; i < word.size(); i++) {
        char original = word[i];
        for (char ch = 'a'; ch <= 'z'; ch++) {
          word[i] = ch;
          if (s.find(word) != s.end()) {
            q.push({word, steps + 1});
            s.erase(word);
          }
        }
        word[i] = origiunal;
      }
    }
    return 0;
  }
};
// @leet end

```









## References
- [striver sheet link](https://takeuforward.org/graph/word-ladder-i-g-29/)
- [yt video link](https://www.youtube.com/watch?v=tRPda0rcf8E&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/word-ladder/)