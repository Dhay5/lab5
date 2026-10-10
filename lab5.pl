male(abraham).
male(herb).
male(homer).
male(bart).
male(clancy).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

son(X, Y) :-
    male(X),
    parent(Y, X).

daughter(X, Y) :-
    female(X),
    parent(Y, X).

brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandfather(X, Y) :-
    male(X),
    parent(X, P),
    parent(P, Y).

aunt(X, Y) :-
    female(X),
    parent(P, Y),
    sister(X, P).

uncle(X, Y) :-
    male(X),
    parent(P, Y),
    brother(X, P).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    (sibling(P1, P2)),
    X \= Y.

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

%  35 ?- consult(['c:/Users/HP/Documents/lab5.pl']).
% true.
%
%36 ?- father(abraham, homer).
%true.

%37 ?- father(homer, bart).
%true.

%38 ?-  mother(mona, homer).
%true.

%39 ?- mother(marge, lisa).
%true.
%
%40 ?- son(homer, abraham).
%true.

%41 ?- son(bart, homer).
%true.

%42 ?- daughter(homer, lisa).
%false.

%43 ?- daughter(lisa, homer).
%true.

%44 ?- daughter(marge, clancy).
%true.

%45 ?- brother(homer, herb).
%true .

%46 ?- brother(bart, lisa).
%true.

%47 ?- sister(lisa, bart).
%true.

%48 ?- sister(bart,lisa).
%false.

%49 ?- grandfather(abraham, bart).
%true

%50 ?- grandfather(clancy, lisa).
%true .

%51 ?- 
%|    aunt(patty, bart).
%true .

%52 ?- aunt(selma, lisa).
%true .

%53 ?- uncle(herb, bart).
%true .

%54 ?-  uncle(homer, lisa).
%false.

%55 ?- cousin(bart, ling).
%true .

%56 ?- cousin(bart, lisa).
%false.

%57 ?- ancestor(abraham, bart).
%true .

%58 ?- ancestor(mona, maggie).
%true

