*10-05-2025 07:35*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] [[Tags/topo sort|topo sort]]

# Alien Dictionary
- *Problem* *Statement*: 
	A new alien language uses the English alphabet, but the order of letters is unknown. You are given a list of words[] from the alien language’s dictionary, where the words are claimed to be sorted lexicographically according to the language’s rules.
	
	Your task is to determine the correct order of letters in this alien language based on the given words. If the order is valid, return a string containing the unique letters in lexicographically increasing order as per the new language's rules. If there are multiple valid orders, return any one of them.
	
	However, if the given arrangement of words is inconsistent with any possible letter ordering, return an empty string ("").

    A string a is lexicographically smaller than a string b if, at the first position where they differ, the character in a appears earlier in the alien language than the corresponding character in b. If all characters in the shorter word match the beginning of the longer word, the shorter word is considered smaller.
	
	![[Pasted image 20250510073720.png]]

### Solution 
- In this question
	- The intuition occurs after that we know the alphabet will occurr in the order of the words given. 
		- badf , abd -> this shows that b must occurr before a.
		- So what we can do is construct a directed graph that represents the edges as between the alphabets. 
	- For this question , it contains all the english alphabet words so we need to keep track of that. 
	- First create a present vector that has those alphabet present as true , which are present in the words 
	- 








#### Edge Cases
- The edge cases in this question are 
	- Prefix -> If w1 = abcd , w2 = abc --> This is invalid because in a dictionary , prefix cannot occur after the prefix + word. 
	- Cyclic Dependency -> Any test case that has cyclic dependency (the case in which topo sort fails) -> if this is the case then the size of the ans string is always less than the alphabets present in the given words. 



## References
- [striver sheet link](https://takeuforward.org/data-structure/alien-dictionary-topological-sort-g-26/)
- [yt video link](https://www.youtube.com/watch?v=U3N_je7tWAs&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/alien-dictionary/1)