local fase1 = {}
local tela = 1
local correr = 1
local destr = {}
local spawn = 0
local dific = 200
local obj, sprite_back, posicaox

function fase1.setCor(ncorrer)
  correr = ncorrer
end

function fase1.keyreleased(key)
  if key == "lshift" then correr = 1
  end
end

function fase1.getInf()
  return {p = posicaox, le = sprite_back[tela].lim_dir,ld = sprite_back[tela].lim_esq}
end

function fase1.stop_musica()
end

function fase1.keypressed(key)
  if morte.getDeath() == 0 then
    if key == 'escape' then
      switch_menu(3,getSt())
    end
  else 
    if key == "up" or key == "down" then morte.move(key)
    elseif key == "return" then morte.interacao()
    end
  end
end

function fase1.load()
  posicaox = -103
  obj = {{tm=1, {x=76  ,y=250,w=170,h=450, acao = function() tela = 2 posicaox = 227   end}},
         {tm=2, {x=2900,y=250,w=170,h=450, acao = function() tela = 3 posicaox = -3900 end},
                {x=153 ,y=250,w=170,h=450, acao = function() tela = 1 posicaox = 227   end}},
         {tm=3, {x=950 ,y=250,w=175,h=450, acao = function() tela = 4 posicaox = 0     end},
                {x=770 ,y=250,w=165,h=450, acao = function() tela = 5 posicaox = -670  end},
                {x=4870,y=250,w=170,h=450, acao = function() tela = 2 posicaox = -2000 end}},
         {tm=1, {x=763 ,y=250,w=170,h=450, acao = function() tela = 3 posicaox = 0     end}},
         {tm=2, {x=1264,y=250,w=170,h=450, acao = function() tela = 6 posicaox = 223   end},
                {x=940 ,y=250,w=170,h=450, acao = function() tela = 3 posicaox = -500  end}},
         {tm=2, {x=1053,y=250,w=170,h=450, acao = function() tela = 7 posicaox = 223   end},
                {x=73  ,y=250,w=170,h=450, acao = function() tela = 5 posicaox = -670  end}},
         {tm=2, {x=3220,y=250,w=170,h=450, acao = function() tela = 8 posicaox = -2300 end},
                {x=107 ,y=250,w=170,h=450, acao = function() tela = 6 posicaox = -80   end}},
         {tm=1, {x=1264,y=250,w=170,h=450, acao = function() morte.death("Queimado") end}}}
  sprite_back = {{love.graphics.newImage("Imagens/Fases/Fase1/Fase1-01.png"),lim_esq = -103 ,lim_dir = 227},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-02.png"),lim_esq = -3263,lim_dir = 190},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-03.png"),lim_esq = -3900,lim_dir = 223},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-04.png"),lim_esq = 0    ,lim_dir = 223},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-05.png"),lim_esq = -670 ,lim_dir = 223},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-06.png"),lim_esq = -80  ,lim_dir = 223},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-07.png"),lim_esq = -2800,lim_dir = 223},
                 {love.graphics.newImage("Imagens/Fases/Fase1/Fase1-08.png"),lim_esq = -2300,lim_dir = 223}}
  img_destroco = love.graphics.newImage("Imagens/Sprites/Destrocos.png")
  print(img_destroco:getWidth())
end

function fase1.andar(dt)
  if morte.getDeath() == 0 then
    if love.keyboard.isDown("left") and posicaox < (sprite_back[tela].lim_dir*cons_w) then posicaox = posicaox + (700*dt) 
    elseif love.keyboard.isDown("right") and posicaox > (sprite_back[tela].lim_esq*cons_w) then posicaox = posicaox - (700*dt) 
    end
  end
end

function fase1.play_musica()
  love.audio.play(music_menu_inicial)
  music_menu_inicial:setLooping(true)
end

function fase1.stop_musica()
end

function fase1.coli(per,key)
  if key == 'return' and morte.getDeath() == 0 then
    for i = 1,obj[tela].tm,1 do
      if col.retangulo_retangulo({x=(obj[tela][i].x+posicaox)*cons_w,y=obj[tela][i].y*cons_h,w=obj[tela][i].w*cons_w,h=obj[tela][1].h*cons_h},per) then
        obj[tela][i].acao() 
        break
      end
    end
  end
end

function fase1.draw()
  if morte.getDeath() == 0 then
    love.graphics.draw(sprite_back[tela][1],posicaox*cons_w,92*cons_h,0,1,cons_h*1.78,0,0)
    for index,v in ipairs(destr) do 
      love.graphics.rectangle("fill",v.x + posicaox,v.y,img_destroco:getWidth()*0.5*cons_w,img_destroco:getHeight()*0.5*cons_h)
      love.graphics.draw(img_destroco, v.x + posicaox, v.y,0,0.5*cons_w,0.5*cons_h,0,0,0,0)
    end
    if tela == 8 then love.graphics.rectangle("fill",(obj[tela][1].x+posicaox)*cons_w,obj[tela][1].y*cons_h,obj[tela][1].w*cons_w,obj[tela][1].h*cons_h) end
  else
    morte.draw()
  end
end

function fase1.update(per)
  if morte.getDeath() == 0 then spawn = spawn + 1 end
  if (spawn == dific) then
    a = love.math.random(0,sprite_back[tela][1]:getWidth())
    --print(a)
    table.insert(destr,{x = a, y = 0, acao = function() morte.death("Esmagado") end})
    spawn = 0
    if (dific > 50) then
      dific = dific - 5
    end
  end
  for index,v in ipairs(destr) do 
	  v.y = v.y + 8
  end
  for index,v in ipairs(destr) do 
	  if col.retangulo_retangulo({x = v.x + posicaox,y = v.y,w = img_destroco:getWidth()*0.5*cons_w,h = img_destroco:getHeight()*0.5*cons_h},per) then v.acao() table.remove(destr,index) end
  end
end

return fase1
