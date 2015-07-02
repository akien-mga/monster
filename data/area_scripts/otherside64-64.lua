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

can_save = true

function start()
    startMusic("world.ogg");
    cave = Object:new{number=2, x=0, y=208, width=16, base_height=16}
    village = Object:new{number=3, x=288, y=176, width=16, base_height=16}
end

function stop()
end

function update(step)
end

function activate(activator, activated)
end

function collide(obj1, obj2)
    if (obj1 == 2 or obj2 == 2) then
	fadeOut()
	startArea("cave6-0")
	setObjectPosition(1, 152, 8)
	setObjectDirection(1, DIRECTION_SOUTH)
	fadeIn()
    elseif (obj1 == 3 or obj2 == 3) then
	fadeOut()
	setObjectPosition(1, 8, 120)
	setObjectDirection(1, DIRECTION_EAST)
	startArea("seaside0-1")
	fadeIn()
    end
end
