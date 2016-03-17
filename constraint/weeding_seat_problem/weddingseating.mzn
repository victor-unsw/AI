% Include global constraint file
include "globals.mzn";

% ---------------------------------------------------------------------------
% Parameters
% ---------------------------------------------------------------------------

int: Evaluation;                                                                                    % Evaluation flag
int: nTables;                                                                                        % Number of tables
int: nSeats;                                                                                          % Number of seats per table
int: nGuests;                                                                                        % Number of Guests 
int: nGroups;                                                                                       % Total number of groups
int: PrefWeight;                                                                                    % Preference weight

set of int: Guest = 1..nGuests;                                                             % set of guests
set of int: Table = 1..nTables;                                                              % set of tables

array[1..nGroups] of set of int: Groups;                                                % Groups of guest
array[1..nGuests] of set of int: Pref;                                                      % Preference of guest
set of int: Trouble;                                                                               % Touble makers



% ---------------------------------------------------------------------------
% Decision Variables
% ---------------------------------------------------------------------------

array[Table] of var set of 1..nGuests: t;                                                % table to guest mapping
var int: utilitarian;                                                                                % Utilitarian happiness
var int: egalitarian;                                                                               % Egalitarian happiness



% ---------------------------------------------------------------------------
% Constraints
% ---------------------------------------------------------------------------

% ------ constraint to make the limit the number of guests on seats ------
constraint forall(i in Table)(card(t[i]) <= nSeats /\ card(t[i]) >= floor(nSeats div 2));

% ------ constraint to make sure that every guest has been seated ------
constraint forall(i in 1..nGuests)( exists(j in Table)(i in t[j]) );

% ------ constraint to check group seated together ------
constraint forall(i in 1..nGroups)( exists(j in Table)(Groups[i] intersect t[j] = Groups[i]) );

% ------ constraint to make sure trouble makers not seated together ------
constraint forall(i in Table)( t[i] intersect Trouble != Trouble);

% ------ all seating arrangments at table are uniquie ------
constraint all_disjoint([t[i] | i in Table]);

% ------ calculate utilitarian happiness -------
utilitarian = sum(g in 1..nGuests)
                    (sum(i in Table) ( if g in t[i] then card(t[i] intersect Pref[g])*PrefWeight else 0 endif )  );

% ------ calculate egalitarian happiness -------
egalitarian = min(g in 1..nGuests)
                    ( sum(i in Table) ( if g in t[i] then card(t[i] intersect Pref[g])*PrefWeight else 0 endif )  );

% ---------------------------------------------------------------------------
% Solve 
% ---------------------------------------------------------------------------

solve maximize if Evaluation = 1 then egalitarian else utilitarian endif;

% ---------------------------------------------------------------------------
% Show Output
% ---------------------------------------------------------------------------

output [ "Table : Guests : \n"] ++ ["    "++show(i) ++ " : " ++ show(t[i]) ++ "\n" | i in Table] ++ ["\nUtilitarian Happiness: " ++show(utilitarian)] ++ ["\nEgalitarian Happiness : " ++ show(egalitarian)];
