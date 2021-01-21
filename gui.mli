(** 
    Representation of the graphics within the game.

    This module represents the canvas size, player, sprite images, 
    animations, and graphics for the obstacles. All these elements
    are drawn based on information in this module.
*)

(** abstract type representing a gui record that contains information 
    responsible for drawing the game properly on each update *)
type t

(** [make_state Game.t] instantiates the state type with all the required 
    parameters for drawing a frame *)
val make_state: Game.t -> t

(** [draw_update t string] is reponsible for drawing the correct frame, which is 
    dependent upon [state] that is represented by a string *)
val draw_update: t -> string -> unit 

(** [update_dynamic Game.t int] updates the camel sprite image at each frame to 
    change the sprite image for the player animation *)
val update_dynamic: Game.t -> int -> t -> t

(** [set_sprite t int] takes in a gui type and an index to set the sprite image
    based on the player's selection for a particular game *)
val set_sprite: t -> int -> t 
