(** 
    Representation of game environment and all objects within the game.

    This module represents the state of the player, obstacles, and other game
    functions as the game is being played. It tracks and updates the player 
    parameters, obstacle parameters, and manages collisions and generation
    of new entities in the various game states.
*)

(** [type t] is an abstract type used to represent a player in the game*)
type t

(** [type bomb] represents a bomb object. It is either Bomb of a position (x, y)
    and a bool that reflects if the bomb has been dropped or not, or None, which
    indicates that a bomb was not generated. *)
type bomb = Bomb of int * int * bool | None 

(** [create (float, float) float int string int option int int ] 
    takes in a position (float * float), velocity (int), highscore (int), 
    obstacle name (string), obstacle type (int), x (int), and y (int) and 
    returns a player type with position and velocity specified and initializes 
    all the fields needed to create a game *)
val create: float * float -> float -> int -> string -> int option -> int -> int 
  -> t

(** [update (a, b) t] updates the parameters of the player to reflect changes 
    in game state due to gravity, jumping, score, collisions, and pipes. *)
val update: float -> t -> string -> t

(** Setters mainly used for testing and debug purposes *)
(** [set_collision bool t] takes in a bool and sets the collision field of the
    player*)
val set_collision: bool -> t -> t

(** [set_can_jump t bool] sets the boolean field determining whether the player
    is allowed to jump or not. *)
val set_can_jump: t -> bool -> t 

(** [set_obs_type string t] sets the obstacle type. For example pipe vs 
    cactus *)
val set_obs_type: string -> t -> t 

(** [set_pwr_active t bool] sets the pwr_active field to the given [bool]
    value *)
val set_pwr_active: t -> bool -> t

(** [set_powerup name x y t] generates a new powerup of type [name] 
    at the given x y position *)
val set_powerup: string -> int -> int -> t -> t

(** [get_obs_x t] returns the x-coordinate of the bottom-left corner of a pipe.
*)
val get_obs_x: t -> int 

(** [get_obs_type t] returns the specific type of a given obstacle. For 
    example, the pipe has three different pipe types that reflect a low, medium
    or high pipe. *)
val get_obs_type: t -> int

(**[get_position t] returns the position of the player *)
val get_position: t -> float * float 

(** [get_player_y t] returns the y-coordinate of the player object. *)
val get_player_y: t -> int 

(** [get_velocity t] returns the velocity value of the player*)
val get_velocity: t -> float

(** [get_collision t] returns true if player collides with a pipe, false 
        otherwise. *)
val get_collision: t -> bool

(** [get_score t] returns the current score of the player. *)
val get_score: t -> int

(** [get_score_updated t] returns the boolean field tracking whether or not the 
        player's score has been updated after clearing an obstacle. *)
val get_score_updated: t -> bool

(** [get_highscore t] returns the highscore that the achieved so far*)
val get_highscore: t ->  int 

(** [get_bomber_x t] returns the x - coordinate of the bomber*)
val get_bomber_x: t -> int

(** [int_of_powerup t] returns int value of a powerup, with None state having a 
    value of -1, and Invincible having a value of 0, ans state Slow having 
    a value of 1 *)
val int_of_powerup:  t -> int 

(** [get_pwr_pos t] returns the coordinates of the powerup *)
val get_pwr_pos : t -> int * int

(** [get_pwr_active t] returns the bool indicating whether the powerup is active
*)
val get_pwr_active : t -> bool 

(** [get_player_x t] returns the x-coordinate of the player*)
val get_player_x : t -> int 

(** [get_bombs_list t] returns a list of bomb objects *)
val get_bombs_list: t -> bomb list     

(** [string_of_powerup t] returns the powerup state of the player as a string*)
val string_of_powerup: t -> string 