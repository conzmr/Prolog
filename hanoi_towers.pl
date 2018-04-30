% HANOI TOWERS

% Move N disks from the source peg to the target peg using the center/intermediate
% peg as an auxiliary holding peg. At no time can a larger disk be placed upon a smallerdisk
% and a time only one disk can be moved.

% PROCEDURE
% hanoi_towers((N, Source, Target, Interm)
% Where:
% N => Number of disks will have to be shifted from source peg to target peg
% Source => Source peg
% Target => Target peg
% Interm => Intermediate peg

hanoi_towers(1,X,Y,_) :-
    write("Moving disk from top "),
    write(X),
    write(" to "),
    write(Y),
    nl.

hanoi_towers(N,X,Y,Z) :-
    N > 1,
    M is N - 1,
    hanoi_towers(M, X, Z, Y),
    hanoi_towers(1, X, Y, _),
    hanoi_towers(M, Z, Y, X).

