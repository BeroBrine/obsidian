*27-07-2025 15:23*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[stack and queue]]

# Sort A Stack
##### Problem Statement
- Sort a stack in descending order 
	- i.e top most element should be the greatest and all the elements follow descending order.

##### Solution
**Recursive** 
- In this solution we will be doing two recursive calls.
	- One call is to provide stack and element that we want to sort from the ground to the next function
	- This next function will then sort the provided element into the stack recursively.
- We recurisvely call a function sort after popping one element out of the stack called x , after the sort returns that the stack is empty , we pass this x and the stack to the next function called sortedInsert.
- This sortedInsert then checks if the provided element x is greater than the element at the top or not , if it is , it pushes it and returns
	- If it is not , it pops one element out and then recursively calls itself , it keeps doing this until the stack is empty or it finds a variable which is smaller than the value x. (we need the stack to be in decreasing order that's why x is greater than the top.) 
	- Now when coming back , the element x is pushed at the right place , so we also need to restore the original elements before it , so after coming back from each recursive call , just push the temp back into the stack.

**Iterative**
- This is a bit unintiutive for me 
	- Take a temporary stack temp.
	- Pop out elements from input 
		- now pop out elements from the temp stack until it is not empty and x < top of temp stack.
	- Push the x in the temp stack.
	- After input is empty , temp stack contains the sorted stack.




##### Handwritten Notes
![[Sort a stack.pdf]]
##### Recursive Code
```cpp
/*The structure of the class is
class SortedStack{
public:
    stack<int> s;
    void sort();
};
*/

/* The below method sorts the stack s
you are required to complete the below method */

void sortedInsert(stack<int> &st , int x) {
    if(st.empty() || x > st.top()) {
        st.push(x);
        return;
    }
    int temp = st.top();
    st.pop();
    sortedInsert(st , x);
    st.push(temp);
}

void SortedStack ::sort() {
    if(!this->s.empty()) {
        int x= this->s.top();
        this->s.pop();
        sort();
        sortedInsert(this->s , x);
    }
    
}
```

##### Iterative Code
```cpp
/*The structure of the class is
class SortedStack{
public:
    stack<int> s;
    void sort();
};
*/

/* The below method sorts the stack s
you are required to complete the below method */



void SortedStack ::sort() {
    stack<int> temp;
    while(!this->s.empty()) {
        int x= this->s.top();
        this->s.pop();
        while(!temp.empty() and x < temp.top()) {
            int top = temp.top();
            temp.pop();
            this->s.push(top);
        }
        temp.push(x);
    }
     
    while(!temp.empty()) {
        int top = temp.top();
        temp.pop();
        cout << top << ' ';
    }
}
```

## References
- [GFG link recursive](https://www.geeksforgeeks.org/dsa/sort-a-stack-using-recursion/)
- [GFG link iterative](https://www.geeksforgeeks.org/dsa/sort-stack-using-temporary-stack/)
- [GFG question link](https://www.geeksforgeeks.org/problems/sort-a-stack/1)
- ![yt video link]()