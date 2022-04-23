pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
-- hitomezashi stich patterns

function _init()
 ts  = 4    // tile size
 col = 7    // color
 np  = 0    // 1/noise proba
 init_grid(ts)
end

function _draw()
 cls()
 draw_grid(xs,ys)
 // print(np,7)
end

function _update()
 
 if np > 0 then
  for y=1,#ys do
   ys[y]=(ys[y]+noise(np))%2
  end
  for x=1,#xs do
   xs[x]=(xs[x]+noise(np))%2
  end
 end

 ys = tween(ys,eys)
 xs = tween(xs,exs)

 if btnp(4) then
  exs  = rbits(128/ts)
  eys  = rbits(128/ts)
 end
 if btnp(0) then
  if np == 0 then 
   np = 16384
  else 
   np = max(1,min(np,16383))*2
  end
 end
 if btnp(1) then
  np = flr(np/2)
 end
 if btnp(2) then
  col = (col+1)%16
 end
 if btnp(3) then
  col = (col-1+16)%16
 end
 if btnp(5) then
  ts = 2^(1+flr(rnd(6)))
  exs  = rbits(128/ts) // bit pattern
  eys  = rbits(128/ts) // bit pattern
 end
end
-->8
-- helper functions
function rbits(n)
 t={}
 for i=1,n do
  add(t,flr(rnd(2)))
 end
 return t
end

function noise(n)
 // chance of happening = 1/n 
 return flr(rnd(n)/(n-1))
end

function tween(st,et)
 for i=1,#st do
  if st[i]!=et[i] then
   st[i]=et[i]
   return st
  end
 end
 st = et
 return st
end


-->8
-- draw functions
function draw_grid(xs,ys)
 for y=1,#ys do
  for x=1,#xs do
   if xs[x] != nil and (xs[x]+y)%2!=0 then
    line(x*ts,(y-1)*ts,x*ts,y*ts,col)
   end
   if ys[y] != nil and ((ys[y]+x)%2)!=0 then
    line((x-1)*ts,y*ts,x*ts,y*ts,col) 
   end
  end
 end
end

-->8
function init_grid(ts)
 xs  = rbits(128/ts) // bit pattern
 ys  = rbits(128/ts) // bit pattern
 exs = xs
 eys = ys
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
77777777700000000777777770000000777777770000000077777777700000007777777700000000777777770000000077777777000000007777777770000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000077777777000000007777777000000007777777700000000077777770000000077777777000000007777777700000000777777770000000007777777
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000777777770000000077777777700000000777777770000000777777777000000007777777700000000777777770000000077777777000000077777777
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
77777777000000007777777700000000077777777000000007777777000000000777777770000000077777777000000007777777700000000777777700000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
77777777700000000777777770000000777777770000000077777777700000007777777700000000777777770000000077777777000000007777777770000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000077777777000000007777777000000007777777700000000077777770000000077777777000000007777777700000000777777770000000007777777
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
77777777700000000777777770000000777777770000000077777777700000007777777700000000777777770000000077777777000000007777777770000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000077777777000000007777777000000007777777700000000077777770000000077777777000000007777777700000000777777770000000007777777
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000777777770000000077777777700000000777777770000000777777777000000007777777700000000777777770000000077777777000000077777777
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000077777777000000007777777000000007777777700000000077777770000000077777777000000007777777700000000777777770000000007777777
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
77777777700000000777777770000000777777770000000077777777700000007777777700000000777777770000000077777777000000007777777770000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
77777777000000007777777700000000077777777000000007777777000000000777777770000000077777777000000007777777700000000777777700000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000777777770000000077777777700000000777777770000000777777777000000007777777700000000777777770000000077777777000000077777777
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
77777777000000007777777700000000077777777000000007777777000000000777777770000000077777777000000007777777700000000777777700000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
00000000000000007000000000000000000000007000000000000000000000000000000070000000000000007000000000000000700000000000000000000000
77777777700000000777777770000000777777770000000077777777700000007777777700000000777777770000000077777777000000007777777770000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000
00000000700000000000000070000000700000000000000070000000700000007000000000000000700000000000000070000000000000007000000070000000

