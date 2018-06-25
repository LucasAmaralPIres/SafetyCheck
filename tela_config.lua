local tela_config = {}
local pos_conf_x_1 = 837.5
local pos_conf_x_2 = 837.5
local vol1 = 0.5
local vol2 = 0.5
local selecionado = 1

function tela_config.load()
	bac_tel_config = love.graphics.newImage("Imagens/Menu/tela_config.png")
  volume = music_menu_inicial:setVolume(0.5)
end

function tela_config.setSel(a)
	selecionado = a
end

function tela_config.keypressed(key)
  if key == 'escape' then
    switch_menu(1,getSt())
  end
end

function tela_config.draw()
  love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(bac_tel_config,0,0,0,love.graphics.getWidth()/bac_tel_config:getWidth(),love.graphics.getHeight()/bac_tel_config:getHeight(),0,0)
  if selecionado == 1 then
      love.graphics.setColor(154, 205, 50, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x_1) / 1366,(love.graphics.getHeight() * 419) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x_2) / 1366,(love.graphics.getHeight() * 516.5) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
  elseif selecionado == 2 then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x_1) / 1366,(love.graphics.getHeight() * 419) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
      love.graphics.setColor(154, 205, 50, 255)

      love.graphics.rectangle("fill", (love.graphics.getWidth() * pos_conf_x_2) / 1366,(love.graphics.getHeight() * 516.5) / 768, (love.graphics.getWidth() * 20) / 1366, (love.graphics.getHeight() * 11) / 768)
  end
end

function aumenta()
  if selecionado == 1 then
    pos_conf_x_1 = pos_conf_x_1 + 5
  elseif selecionado == 2 then
    pos_conf_x_2 = pos_conf_x_2 + 5
  end
  volume = music_menu_inicial:setVolume(calcula_volume())
end

function diminui()
  if selecionado == 1 then
    pos_conf_x_1 = pos_conf_x_1 - 5
  elseif selecionado == 2 then
    pos_conf_x_2 = pos_conf_x_2 - 5
  end
  volume = music_menu_inicial:setVolume(calcula_volume())
end

function tela_config.andar(key)
  if selecionado == 1 then
    if key == "right" and pos_conf_x_1 < 1163 then
      aumenta()
    elseif key == "left" and pos_conf_x_1 > 512 then
      diminui()
    end
  elseif selecionado == 2 then
    if key == "right" and pos_conf_x_2 < 1163 then
      aumenta()
    elseif key == "left" and pos_conf_x_2 > 512 then
      diminui()
    end

  end
end

function calcula_volume()
  if selecionado == 1 then
    vol1 = (pos_conf_x_1 - 510) / 655
  elseif selcionado == 2 then
    vol2 = (pos_conf_x_2 - 510) / 655
  end
  return vol1, vol2
end

function tela_config.play_musica()
  love.audio.play(music_menu_inicial)
	music_menu_inicial:setLooping(true)
end

function tela_config.stop_musica()
end

return tela_config
