%
% ÁRBOL GENEALÓGICO
%
% PARENTESCOS:
% 1. Padre
% padre(A,B) => B es el padre de A
padre(juan,alberto).
padre(luis,alberto).
padre(alberto,leoncio).
padre(geronimo,leoncio).
padre(luisa,geronimo).
%
% 2. Hermano
% Condiciones para que dos individuos sean hermanos:
% hermano(A,B) => A es hermano de B
hermano(A,B) :-
padre(A,P),
padre(B,P),
A \== B.
%
% 3. Nieto.
% nieto(A,B)  => A es nieto de B
%
nieto(A,B) :-
padre(A,P),
padre(P,B).

% 4. Mujer.
% female(A) => A es mujer
%

% 5. Hombre.
% male(A) => A es hombre
%

% 6. Madre.
% male(A) => A es hombre
%
nieto(A,B) :-
padre(A,P),
padre(P,B).



