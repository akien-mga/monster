#!/bin/sh

mkanim $1_stand_n.ani stand_n 1 $2 $1_stand_n.pcx 333 333
mkanim $1_stand_e.ani stand_e 1 $2 $1_stand_e.pcx 333 333
mkanim $1_stand_s.ani stand_s 1 $2 $1_stand_s.pcx 333 333
mkanim $1_stand_w.ani stand_w 1 $2 $1_stand_w.pcx 333 333
mkanim $1_walk_n.ani walk_n 2 $2 $1_walk_n.pcx 333 333
mkanim $1_walk_e.ani walk_e 4 $2 $1_walk_e.pcx 166 166 166 166
mkanim $1_walk_s.ani walk_s 2 $2 $1_walk_s.pcx 333 333
mkanim $1_walk_w.ani walk_w 4 $2 $1_walk_w.pcx 166 166 166 166
mkanim $1_attack.ani attack 4 $2 $1_attack.pcx 166 166 166 166
mkanim $1_dead.ani dead 1 $2 $1_dead.pcx 0
mkanimset $1.anims $1 10 $1_stand_n.ani $1_stand_e.ani $1_stand_s.ani \
	$1_stand_w.ani $1_walk_n.ani $1_walk_e.ani $1_walk_s.ani $1_walk_w.ani \
	$1_attack.ani $1_dead.ani
