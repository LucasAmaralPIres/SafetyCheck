local fase2 = {}
local tela = 1
local correr = 1
local obj, sprite_back,posicaox

function fase2.setCor(ncorrer)
  correr = ncorrer
end

function fase2.keyreleased(key)
  if key == "lshift" then
    correr = 1 
  end
end

function fase2.stop_musica()
end

function fase2.keypressed(key)
  if key == "escape" then
    switch_menu(3,getSt())
  end
end

function fase2.tratar_main(key,playerinfo)
  if key == "lshift" and playerinfo == 0 then
    setCor(2) end
end

function fase2.load()
  posicaox = 0
  obj = {{tm=3,{x=950*cons_w ,y=250*cons_h,w=175*cons_w,h=450*cons_h, acao = function() tela = 1 posicaox = 0     end}, 
               {x=770*cons_w ,y=250*cons_h,w=165*cons_w,h=450*cons_h, acao = function() tela = 1 posicaox = -670  end},
               {x=4870*cons_w,y=250*cons_h,w=170*cons_w,h=450*cons_h, acao = function() tela = 1 posicaox = -2000 end}}}
  sprite_back = {{love.graphics.newImage("Imagens/Fases/Fase2/Fase2-01.png"),lim_esq = -5000,lim_dir = 5000}}
end

function fase2.andar(dt)
  if love.keyboard.isDown("left") and posicaox < (sprite_back[tela].lim_dir*cons_w) then  posicaox = posicaox + (700*dt)
  elseif love.keyboard.isDown("right") and posicaox > (sprite_back[tela].lim_esq*cons_w) then posicaox = posicaox - (700*dt)
  end
end

function fase2.update()
end

function fase2.play_musica()
  love.audio.play(music_menu_inicial)
  music_menu_inicial:setLooping(true)
end

function fase2.coli(per,key)
  if key == 'return' then
    for i = 1,obj[tela].tm,1 do 
      if col.retangulo_retangulo({x=(obj[tela][i].x+posicaox)*cons_w,y=obj[tela][i].y*cons_h,w=obj[tela][i].w*cons_w,h=obj[tela][1].h*cons_h},per) then
        obj[tela][i].acao() 
        break
      end
    end
  end
end

function fase2.draw()
  print(posicaox)
  love.graphics.draw(sprite_back[tela][1],posicaox*cons_w,92*cons_h,0,1,cons_h*1.78,0,0)
end

return fase2
