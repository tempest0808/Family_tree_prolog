% ---------------------------------------
% Basic Facts: Gender and Parent Relations
% ---------------------------------------

% Male family members
male(john).
male(paul).
male(kevin).
male(david).
male(tom).

% Female family members
female(mary).
female(lisa).
female(susan).
female(anna).
female(kate).

% Parent relationships
% Format: parent(Parent, Child).
parent(john, paul).
parent(john, lisa).
parent(mary, paul).
parent(mary, lisa).

parent(paul, kevin).
parent(paul, susan).
parent(lisa, david).
parent(lisa, anna).

parent(kevin, tom).
parent(susan, kate).

% ---------------------------------------
% Derived Rules: Inferred Relationships
% ---------------------------------------

% Grandparent Rule:
% X is a grandparent of Y if X is a parent of Z and Z is a parent of Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling Rule:
% X and Y are siblings if they share a common parent Z and X is not the same as Y.
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Cousin Rule:
% X and Y are cousins if their parents (P1 and P2) are siblings.
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Child Rule:
% X is a child of Y if Y is a parent of X.
child(X, Y) :- parent(Y, X).

% Descendant Rule (Recursive):
% X is a descendant of Y if:
% - Y is a parent of X (base case), OR
% - Y is a parent of Z and X is a descendant of Z (recursive case).
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).
