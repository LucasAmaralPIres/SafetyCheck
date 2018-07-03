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
  posicaox = 250
  obj = {{tm=3,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 5 posicaox = 250 end}, 
               {x=2825*cons_w ,y=250*cons_h,w=195*cons_w,h=450*cons_h, acao = function() tela = 6 posicaox = 480  end},
               {x=3350*cons_w,y=250*cons_h,w=170*cons_w,h=450*cons_h, acao = function() tela = 2 posicaox = 0  end}},
        {tm=3,{x=1050*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 7 posicaox = 0 end}, 
               {x=2500*cons_w ,y=250*cons_h,w=180*cons_w,h=450*cons_h, acao = function() tela = 8 posicaox = 480  end},
               {x=3350*cons_w,y=250*cons_h,w=170*cons_w,h=450*cons_h, acao = function() tela = 3 posicaox = 0  end}}, 
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 9 posicaox = 250 end}}, 
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = morte.death("Queimado") end}},
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 1 posicaox = 250 end}},
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 1 posicaox = 250 end}},
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 2 posicaox = 250 end}},
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 2 posicaox = 250 end}},
        {tm=1,{x=1500*cons_w ,y=250*cons_h,w=185*cons_w,h=450*cons_h, acao = function() tela = 4 posicaox = 250 end}}}

  sprite_back = {{love.graphics.newImage("Imagens/Fases/Fase2/Fase2-01.png"),lim_esq = -2686,lim_dir = 152},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-02.png"),lim_esq = -2686,lim_dir = 161},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-03.png"),lim_esq=159,lim_dir=159},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-04.png"),lim_esq=-1295,lim_dir=150},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-05.png"),lim_esq=152,lim_dir=152},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-06.png"),lim_esq=152,lim_dir=152},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-07.png"),lim_esq=150,lim_dir=150},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-08.png"),lim_esq=152,lim_dir=152},
                {love.graphics.newImage("Imagens/Fases/Fase2/Fase2-09.png"),lim_esq=-915,lim_dir=152}}
end

function fase2.andar(dt)
  if love.keyboard.isDown("left") and (posicaox < (sprite_back[tela].lim_dir*cons_w) and posicaox > (sprite_back[tela].lim_esq*cons_w)) then  posicaox = posicaox + (700*dt)
  elseif love.keyboard.isDown("right") and (posicaox > (sprite_back[tela].lim_esq*cons_w) and posicaox < (sprite_back[tela].lim_dir*cons_w)) then posicaox = posicaox - (700*dt)
end
  if love.keyboard.isDown("left") and posicaox < (sprite_back[tela].lim_esq*cons_w) then posicaox = sprite_back[tela].lim_esq*cons_w + 1
  elseif love.keyboard.isDown("right") and posicaox > (sprite_back[tela].lim_dir*cons_w) then posicaox = sprite_back[tela].lim_dir*cons_w - 1
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
