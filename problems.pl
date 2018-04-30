% PROLOG EXCERCISES

% 1. PRINT EVERY SECOND
% Write a predicate print every second/1 to print every other element in a
% list, beginning at the second element —i.e. the 2nd, 4th, 6th elements etc. It
% should always succeed provided it is given a list as its argument.

print_every_second([]).

print_every_second([X]) :-
   write(X).

print_every_second([_,X|T]) :-
    write(X),
    nl,
    print_every_second(T).


% 2. DECONSONANT
% Write a predicate deconsonant/1 to print any element of a list that isn’t a
% consonant (i.e. we want to print out the vowels a,e,i,o,u). It should always
% succeed provided it is given a list as its argument (we assume that the input
% list only contains vowels and consonants).
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

is_vowel(X) :-
    vowel(X),
    write(X),
    nl.

deconsonant([]).

deconsonant([X|Y]) :-
    is_vowel(X),
    deconsonant(Y).

deconsonant([X|Y]) :-
    not(vowel(X)),
    deconsonant(Y).


% 3. HEAD
%  Write a predicate head/2 which takes a list as its first argument and returns
% the head of the list as its second argument. It should fail if there is no first
% element.

head([H|_], H).


% 4. TAIL
% Write a predicate tail/2 which takes a list as its first argument and returns
% the tail of the list as its second argument. It should fail if there is no first
% element.

tail([]) :- fail.

tail([_,T], R) :-
    R is T.


% 5. LAST
% Write a predicate last/2 which takes a list as its first argument and returns
% the last element of the list.

last([_,R], R).
last([_ | T], R) :-
    last(T, R).

% 6. MAX
% Write a predicate max/3 which takes three arguments, the first two are
% positive integer numbers and returns in the third the max of them.

max(X, Y, Z) :-
X > Y,
Z is X.

max(X, Y, Z) :-
X < Y,
Z is Y.

% 7. FACTORIAL
% Write a predicate fact/2 which takes a natural number as first argument, and
% returns the factorial of the number.

fact(0,1).

fact(N,R) :-
    N2 is N-1,
    fact(N2, R2),
    R is R2*N.

% 8. FIBONACCI
% Write a predicate fib/2 which takes a natural number as first argument, and
% returns the value of the Fibonacci sequence for that position (counting from 1).

fib(0,0).

fib(1,1).

fib(X,R) :-
    X1 is X-1,
    X2 is X-2,
    fib(X1, R1),
    fib(X2, R2),
    R is R1 + R2.

% 9. LENGTH2
% Write a predicate length2/2 which takes a list as first argument, and returns
% in the second one the number of elements in the list.

length2([], 0).

length2([_|X], L) :-
    length2(X, L2),
    L is L2 + 1.

% 10. POWER
% Write a predicate power/3 which takes a number as first argument, a
% natural number as second argument and returns the first number to the power
% of the second.

power(_, 0, 1).

power(X, Y, P) :-
    Y1 is Y-1,
    power(X, Y1, P1),
    P is P1*X.



% 11. COUNT VOWELS
% Write a predicate count_vowels/2 which takes a list as its first argument
% and returns an integer number (as its second argument) which consists of the
% count of elements of the input list which are a vowel (we assume that the input
% list only contains vowels and consonants).

count_vowels([], 0).

count_vowels([X|Y], R) :-
    vowel(X),
    count_vowels(Y, R1),
    R is R1+1.

count_vowels([X|Y], R) :-
    not(vowel(X)),
    count_vowels(Y, R).

% 12.VOWELS
% Write a predicate vowels/2 which takes a list as its first argument and
% returns a list (as its second argument) which consists of the elements of the
% input list which are a vowel (we assume that the input list only contains
% vowels and consonants).

vowels([], []).

vowels([H|L1], [H|L2]) :-
    vowel(H),
    vowels(L1,L2).

vowels([_|L1], L2):-
    vowels(L1,L2).

% 13. NPLE
% Define nple/3 to take two inputs —an integer and a list of integers. The
% result is to be a list of integers formed by multiplying each integer in the list
% by the input integer.

nple(_, [], []).

nple(I, [H|L1], [H1|L2]) :-
    H1 is H*I,
    nple(I, L1, L2).


% 14. ALL
% Define del all/3 which takes a possible element of a list and a list as inputs
% and returns the list with all occurences of the named element removed. (If the
% named element is not in the list then the result is, of course, the whole list with
% no deletions).

all(_, [], []).

all(X, [H|L1], [H|L2]) :-
    X\==H,
    all(X,L1,L2).

all(X, [X|L1], L2):-
    all(X,L1,L2).


% 15. SUM
% Define sum/2 to take a list of integers as input and return the output as
% their sum.

sum([], 0).

sum([H|T], R) :-
    sum(T, R1),
    R is R1+H.


