using HorizonSideRobots
r=Robot(11,11;animate=true)
function rFieldInMarkers!(r::Robot) 
    vert = rLongMove!(r, Sud)
    hor = rLongMove!(r, West)

    side = Ost
    putmarkers_in_pole!(r,side) 
    putmarker!(r) 








    rLongMove!(r,Sud)
    rLongMove!(r, West)
    rCountMove!(r,Ost,hor)
    rCountMove!(r,Nord,vert)
end

function putmarkers_in_pole!(r::Robot,side::HorizonSide)
    while isborder(r,side) == false 
        putmarker!(r)
        move!(r,side)
    end

    if (isborder(r,Nord) == false)
        putmarker!(r)
        move!(r,Nord)
        side = HorizonSide(mod(Int(side) + 2,4))
        putmarkers_in_pole!(r,side)
    end
end


function rLongMove!(r::Robot, side::HorizonSide)
    steps = 0
    while isborder(r, side) == false 
        move!(r,side)
        steps += 1
    end
    return steps
end

function rCountMove!(r::Robot,side::HorizonSide,steps::Int) 
    for _ in 1:steps
        move!(r,side)
    end
end
rFieldInMarkers!(r)