% MONKEY AND BANANA

% The monkey is on floor at door while a block is on the floor next to window and
% a banana is hanging from roof at the middle of the room.
% How the monkey can get the banana?

% PROCEDURE

% STATE is composed by:
% 1) Horizontal position of monkey
% 2) Vertical position of monkey
% 3) Position of block
% 4) Monkey has or not the banana

% Initial state:
% 1) Monkey is at door
% 2) Monkey is on floor
% 3) Block is at window
% 4) Monkey does not have banana

state(at_door, on_floor, at_window, has_not_banana).

% Final state:
state(_, _, _, has_banana).

% Actions to change from one state to other:

% 1) grasp banana
% 2) climb box
% 3) push box
% 4) walk around

% RULES:

% 1-. GRASP
% Monkey can grasp the banana only if is standing on the box directly
% under the banana, which is in the middle of the room, and does not have it yet.

move(state( middle, on_box, middle, has_not_banana),
    grasp,
    state( middle, on_box, middle, has_banana) ).


% 2-. CLIMB
% Monkey on the floor can climb to block only if monkey and block are in the same
% position and whether it has the banana or not.

move( state( P, on_floor, P, H),
    climb,
    state( P, on_box, P, H) ).

% 3-. PUSH
% Monkey on the floor can push block from any horizontal position Pl to any position
% P2. The monkey can do only if block and monkey are in the same position and whether
% it has the banana or not.

move( state( Pl, on_floor, Pl, H),
    push( Pl, P2),
    state( P2, on_floor, P2, H) ).

% 4-. WALK
% Monkey on the floor can walk from any horizontal position Pl to any position
% P2. The monkey can do this regardless of the position of the box and whether
% it has the banana or not.

move( state( Pl, on_floor, B, H),
    walk( Pl, P2),
    state( P2, on_floor, B, H) ).



% GOALS
% Check if given a state, monkey can grasp banana.

add_move(X,L,[X|L]).

monkey_and_banana(state(_, _, _, has_banana), []).

monkey_and_banana(State, FMoves) :-
        move(State, Action, State2),
        monkey_and_banana(State2, PMoves),
        add_move(Action, PMoves, FMoves).






