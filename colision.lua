local colision = {}

function colision.mouse_retangulo(retan,x,y)
  if x>retan.x and x<(retan.x+retan.w) and y>retan.y and y< (retan.h+retan.y) then
    return true
  else
    return false
  end
end

function colision.retangulo_retangulo(retan_1,retan_2)
  if retan_2.x < (retan_1.x + retan_1.w) and retan_1.x < (retan_2.x + retan_2.w) and retan_1.y < (retan_2.y + retan_2.h) and retan_2.y < (retan_1.y + retan_1.h) then
    return true
  else
    return false
  end
end
return colision

  