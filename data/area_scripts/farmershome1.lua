--
-- Copyright (c) 2007, Trent Gamblin
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--    -- Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--    -- Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--    -- Neither the name of the <organization> nor the
--       names of its contributors may be used to endorse or promote products
--       derived from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY <copyright holder> ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL <copyright holder> BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

function start()
	startMusic("village.ogg")
	outportal = Object:new{number=2, x=144, y=200, width=16, base_height=8}
	upportal = Object:new{number=3, x=16, y=64, width=16, base_height=8}
	lady = Object:new{number=4, x=144, y=112, anim_set="sweepinglady", move_type=MOVE_WANDER, rest=2000}
	makeCharacter(4)
	lady:wander()
end

function stop()
end

function update(step)
	lady:move(step)
end

function activate(activator, activated)
	if (activated == 4) then
		doDialogue("Lady: It's so hard to keep things clean with kids around the house...$")
	end
end

function collide(obj1, obj2)
	if ((obj1 == 2) or (obj2 == 2)) then
		fadeOut()
		setObjectPosition(1, 240, 176)
		startArea("village1-1")
		fadeIn()
	elseif ((obj1 == 3) or (obj2 == 3)) then
		fadeOut()
		setObjectPosition(1, 16, 80)
		setObjectDirection(1, DIRECTION_SOUTH)
		startArea("farmershome2")
		fadeIn()
	end
end
