using HorizonSideRobots
r = Robot("1.sit", animate = true)

function rPutmarkers!(r::Robot, side::HorizonSide)
    while (!isborder(r, side))
        move!(r, side)
        putmarker!(r)
    end
end

function rMoveMarker(r::Robot, side::HorizonSide)
    while (ismarker(r))
        move!(r, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 

for side in (HorizonSide(i) for i = 0:3)
    rPutmarkers!(r, side)
    rMoveMarker(r, inverse(side))
end
putmarker!(r)