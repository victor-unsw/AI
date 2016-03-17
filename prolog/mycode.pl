% ========================================================================
%            NAME :- Victor Choudhary
%  Student Number :- z5026443
% Assignment Name :- Assignment 1 - Prolog Programming
%
% Course Enrolled :- COMP9814 Extended Artificial Intelligence
% ========================================================================



% Question 1 :-
%
% sumsq_div3or5(Numbers, Sum).
%       - Sums the squares of only number that are divisible by 5 or 3.
%       - Numbers is list of number.
%       - Binds answer to Sun variable.
%
% div3or5(Num).
%       - Checks whether number 'Num' is divisible by 3 or 5.
%       - If 'Num' is divisible by 3, it returns true, if not divisible
%         by 3, it goes ahead & Checks for 5.
%
% Examples
%       : sumsq_div3or5([],Sum) ?
%       Sum = 0.
%       : sumsq_div3or5([-1,-3,-3],Sum) ?
%       Sum = 18.
%       : sumsq_div3or5([1,3,5,2,4,6,8,7,12],Sum) ?
%       Sum = 214.
%

div3or5(Num) :- (Num mod 3) =:= 0, !.
div3or5(Num) :- (Num mod 5) =:= 0.

sumsq_div3or5([],0).

sumsq_div3or5([H|L],Sum) :-
    div3or5(H), !, sumsq_div3or5(L,TempSum), Sum is H*H+TempSum.

sumsq_div3or5([_|L],Sum) :-
    sumsq_div3or5(L,Sum).






% Question 2 :-
%
% same_name(Person1,Person2).
%       - returns true if Person1 & Person2 have same family name.
%       - checks both the conditional when either Person1 is ancestor
%         of Person2 or Person2 is ancestor or Person1.
%

same_name(Person,Person).

same_name(Person1,Person2) :-
parent(Person1,Person2), male(Person1).
same_name(Person1,Person2) :-
parent(Person2,Person1), male(Person2).

same_name(Person1,Person2) :-
male(Person),
parent(Person,Person1),
same_name(Person2,Person), !.

same_name(Person1,Person2) :-
male(Person),
parent(Person,Person2),
same_name(Person1,Person).







% Question 3 :-
%
% log_table(NumberList, ResultList).
%       - returns 'ResultList' as list of pairs consisting of
%         a number and its log.
%       - returns empty list if the 'NumberList' provided is empty.
%       - fails if 'NumberList' contains 0 or negative number, as
%         log(0) & log(negative_number) is undefined.
%
% single_log(Var,[Var,Result]).
%       - This is a helper predicate, which takes a variable and
%         returns a list containing variable and its log value.
%       - If variable is not greater than 0, it fails.
%
% Examples
%       : log_table([3,-3],Result) ?
%       false.
%       : log_table([3,0],Result) ?
%       false.
%       : log_table([],Result) ?
%       Result = [] .
%       : log_table([3,3],Result) ?
%       Result = [[3, 1.0986122886681098], [3, 1.0986122886681098]].
%
%

single_log(Var,[Var,Result]) :-
    Var > 0, !, Result is log(Var).

single_log(_,_) :- fail.

log_table([],[]) :- !.

log_table([H|L],[Result|LogList]) :-
    log_table(L,LogList), single_log(H,Result),!.


% Question 3 : 9814 Version
%
% function_table(+N, +M, +Function, -Result).
%       - returns 'Result' as list of pairs of number X & Function(X).
%       - Computes from N down to M, returns empty list if N is less
%         than M.
%       - returns 'false' if either of M is not greater than 0,
%         as log(0) or log(negative_number) is undefined.
%
% do_function(Function,X,[X,Value]).
%       - invokes Function(X) and returns a list of result binded with X.
%       - fails if Variable provided is not greater than 0.
%       - this predicate uses a inbuilt predicate 'call', which calls
%         function 'Function' over provided value 'X'.
%       - It further formats the result obtained by 'call' predicate into
%         a string with '5' deciml points.
%
% Examples
%       : function_table(2,0,log,Result) ?
%       false.
%       : function_table(2,-1,log,Result) ?
%       false.
%       : function_table(2,2,log,Result) ?
%       Result = [[2, 0.69315]].
%       : function_table(7, 4, log, Result) ?
%       Result = [[7, 1.94591], [6, 1.79176], [5, 1.60944], [4, 1.38629]].
%
%

do_function(Function,X,[X,Value]) :- X > 0 , !, call(Function,X,Store), format(atom(Y),'~5f',Store), atom_number(Y,Value).

do_function(_,_,_) :- fail.


function_table(Current,End,_,[]) :- Current < End, !.

function_table(Current,End,Function,[Answer|Store]) :-
    Next is Current-1,
    function_table(Next,End,Function,Store),
    do_function(Function,Current,Answer).





% Question 4 :-
%
% runs(List,RunList).
%       - returns a list of numbers into the corresponding list of
%         non-decreasing order.
%       - calls append_list(Element,TempList,ResultList) to get the
%         non-decreasing sublist.
%
% append_list(Element, TempList, ResultList).
%       - returns a TempList containing non-decreasing ordered
%         sublist of final ResultList.
%
% Examples
%       : runs([], RunList) ?
%       RunList = [].
%       : runs([1,2,3,4,5,6,7], RunList) ?
%       RunList = [[1, 2, 3, 4, 5, 6, 7]].
%       : runs([8,7,6,5,4,3,2,1], RunList) ?
%       RunList = [[8], [7], [6], [5], [4], [3], [2], [1]].
%       : runs([3,4,5,4,2,7,5,6,6,8,3], RunList) ?
%       RunList = [[3, 4, 5], [4], [2, 7], [5, 6, 6, 8], [3]].
%


append_list(X, [], [[X]]):- !.

append_list(X, [[H|L]|RL], [[X],[H|L]|RL]) :- H < X, !.

append_list(X, [[H|L]|RL], [[X, H|L]|RL]).


runs([], []):-!.
runs([H|L], RunList):-
        runs(L, List), append_list(H, List, RunList).







% Question 5 :-
%
% tree_eval(Value, Tree, Eval).
%       - binds Eval to the result of evaluating the expression-tree Tree.
%       - the procedure of evaluation is simple :-
%               - it first evaluates left tree.
%               - then it evaluates right tree.
%               - does operation 'Op' on retrieved values of
%                 left and right subtrees.
%
% operate(X,Y,Op,Value).
%       - This is helper predicate, it does specified operation 'Op'
%         on X & Y, binds result to variable 'Value'.
%

operate(X,Y,+,Value) :-
    Value is X + Y.
operate(X,Y,-,Value) :-
    Value is X - Y.
operate(X,Y,*,Value) :-
    Value is X * Y.
operate(X,Y,/,Value) :-
    Value is X / Y.

tree_eval(_,tree(empty,Num,empty),Num) :- number(Num).

tree_eval(Value,tree(empty,z,empty),Value).

tree_eval(Value,tree(L,Op,R),Eval) :-
    tree_eval(Value,L,Lval),
    tree_eval(Value,R,Rval),
    operate(Lval,Rval,Op,Eval).



% Question 5 : 9814 Version
%
% height_if_balanced(Tree, HiB).
%       - returns Height of 'Tree' if it is balanced.
%       - returns -1 if 'Tree' is not balanced.
%       - procedure of getting Height is :-
%               - gets HLB (Height of left subtree).
%               - gets HRB (Height of right subtree).
%               - checks the difference between HLB & HRB ( to
%                 check whether subsequent subtrees are balanced.)
%               - gets max(HLB,HRB) and adds 1.
%
% get_max(X,Y,Max).
%       - this is helper predicate, returns maximum of X & Y.
%
% check_difference(X,Y).
%       - this is helper predicate.
%       - X & Y represents the height of corresponding Left & right
%         subtrees.
%       - returns true if difference between X & Y is no greater
%         than 1.
%
%

get_max(X,Y,X) :-
    X > Y, !.
get_max(_,Y,Y).

check_difference(X,Y) :-
    abs(X-Y,Z), Z =< 1.

height_if_balanced(empty,0) :- !.

height_if_balanced(tree(L,_,R),HiB) :-
    height_if_balanced(L,HLB),
    height_if_balanced(R,HRB),
    get_max(HLB,HRB,Max),
    HiB is 1 + Max.


