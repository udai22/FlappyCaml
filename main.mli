
(** 
   Representation of the main game loop.

   This module is responsible for running the game properly. It calls functions 
   from the state, game and gui module to update the player properly, transition 
   the states appropriately and draw the gui correctly. 
*)
(** [main Gui.t Game.t State.t] executes the game. *)
val main : Gui.t -> Game.t -> State.t -> unit 