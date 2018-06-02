local player = {}
local p_sprite = {}
local correr = 1
local pulando = false
local p_inf = {p_pos_x = 200, p_pos_y = 500, p_anim_time = 0, p_anim_frame = 1}

function player.load()
  for x = 1,12,1 do
    table.insert(p_sprite, love.graphics.newImage("Imagens/Personagem/Anim_0"..x..".png"))
  end
end

function player.setCorrer(n_C)
  correr = n_C
end

function player.getPos()
  return p_inf.p_pos_y
end


function player.keyreleased(key)
  if key == 'right' then p_inf.p_anim_frame = 1
  elseif key == 'left' then p_inf.p_anim_frame = 7
  elseif key == "lshift" then correr = 1
  end
end

function n_pos(novo)
  p_inf.p_pos_x = p_inf.p_pos_x + (novo)
  p_inf.p_anim_time = p_inf.p_anim_time + (math.abs(novo/(2*correr)))
end

function player.pular(dt)
  if pulando == false and p_inf.p_pos_y == 500 then pulando = true end
  if pulando == true then
    if p_inf.p_pos_y > 300 then p_inf.p_pos_y = p_inf.p_pos_y - (300*dt)
	  else pulando = false
	  end
  else
    if p_inf.p_pos_y <= 500 then p_inf.p_pos_y = p_inf.p_pos_y + (300*dt)
    else p_inf.p_pos_y = 500
	  end
  end
end

function player.andar(dt,key)
  if key == "right" then n_pos(200*dt*correr)
  elseif key == "left" then n_pos((-1)*200*dt*correr)
  end
  if p_inf.p_anim_time > 10 then
    p_inf.p_anim_frame = p_inf.p_anim_frame + 1
    if p_inf.p_anim_frame > 6 and key == "right" then p_inf.p_anim_frame = 1
	  elseif (p_inf.p_anim_frame < 7 or p_inf.p_anim_frame > 12) and key == "left" then p_inf.p_anim_frame = 7
    end
    p_inf.p_anim_time = 0
  end
end

function player.draw()
  love.graphics.draw(p_sprite[p_inf.p_anim_frame], p_inf.p_pos_x, p_inf.p_pos_y,0,2,2,0,0)
end

return player
