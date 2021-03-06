local player = {}
local p_sprite = {}
local correr = 1
local pulando = false
local p_inf = {p_pos_x = 350, p_pos_y = 620, p_anim_time = 0, p_anim_frame = 1, p_dir = 1, velY = 0}
local tileQuads = {}
local gravidade = 400
local altura_pulo = 300

function LoadTiles(nx, ny)
  p_sprite = love.graphics.newImage('Imagens/Personagem/Sprites total direita.png')
  local count = 1
  for i=0, nx, 1 do
    for j=0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(i * (p_sprite:getWidth()/7), 0, p_sprite:getWidth()/7, p_sprite:getHeight(), p_sprite:getWidth(), p_sprite:getHeight())
      count = count + 1
    end
  end
end

function player.setX(nX)
  p_inf.p_pos_x = nX
end

function player.load()
  LoadTiles(7,0)
end

function player.setCorrer(n_C)
  correr = n_C
end

function player.ger_dir()
  return p_inf.p_dir
end

function player.getvelY()
  return p_inf.velY
end

function player.getRet()
  return {x = p_inf.p_pos_x-1.1*p_inf.p_dir*p_sprite:getWidth()/8, y = p_inf.p_pos_y-1.5*p_sprite:getHeight()/2, w = 1.2*p_inf.p_dir*p_sprite:getWidth()/7, h = 1.7*p_sprite:getHeight()}
end

function player.keyreleased(key)
  if key == 'right' and p_inf.velY == 0 then p_inf.p_anim_frame = 1
  elseif key == 'left' and p_inf.velY == 0 then p_inf.p_anim_frame = 1
  elseif key == "lshift" then correr = 1
  end
end

function n_pos(novo,fase_inf)
  if (fase_inf.p <= fase_inf.ld or fase_inf.p >= fase_inf.le) then p_inf.p_pos_x = p_inf.p_pos_x + (novo) end
  p_inf.p_anim_time = p_inf.p_anim_time + (math.abs(novo/(2*correr)))
end

function player.pular(dt)
  if p_inf.velY ~= 0 then
    p_inf.p_pos_y = p_inf.p_pos_y - p_inf.velY   * dt
    p_inf.velY = p_inf.velY - gravidade * dt
    if p_inf.p_pos_y > 620 then
      p_inf.velY = 0
      p_inf.p_anim_frame = 0
      p_inf.p_pos_y = 620
    end
  end
end

function player.andar(dt,key,fase_inf)
  if key == "right" then
    n_pos(200*dt*correr,fase_inf)
    p_inf.p_dir = 1
  elseif key == "left" then
    n_pos((-1)*200*dt*correr,fase_inf)
    p_inf.p_dir = -1
  end
  if p_inf.velY == 0 then
    if p_inf.p_anim_time > 10 then
      p_inf.p_anim_frame = p_inf.p_anim_frame + 1
      if p_inf.p_anim_frame > 7
      then p_inf.p_anim_frame = 2
      end
      p_inf.p_anim_time = 0
    end
  end
end

function player.keypressed(key)
  if key == 'up' then
    if p_inf.velY == 0 then
      p_inf.velY = altura_pulo
    end
    if p_inf.p_anim_frame == 1 then
      p_inf.p_anim_frame = 5
    else
      p_inf.p_anim_frame = 4
    end
  end
end

function player.draw()
  love.graphics.draw(p_sprite, tileQuads[p_inf.p_anim_frame], p_inf.p_pos_x * cons_w, p_inf.p_pos_y * cons_h,0,p_inf.p_dir*2,2,p_sprite:getWidth()/14,p_sprite:getHeight()/2)
end

return player
