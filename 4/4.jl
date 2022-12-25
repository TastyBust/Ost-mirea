using HorizonSideRobots
r=Robot(15,15; animate=true)


function rMakeLadder(r::Robot)
    while isborder(r,HorizonSide(3))==false
        putmarker!(r)
        move!(r,HorizonSide(3))
        move!(r,HorizonSide(0))
    end
    putmarker!(r)
    while isborder(r,HorizonSide(2))==false
        move!(r,HorizonSide(2))
    end
    putmarker!(r)
    while isborder(r,HorizonSide(1))==false
        move!(r,HorizonSide(1))
        move!(r,HorizonSide(0))
        putmarker!(r)
    end
end
rMakeLadder(r)