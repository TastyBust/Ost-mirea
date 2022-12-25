using HorizonSideRobots
r=Robot(11,12;animate=true)
function rMakrAngl(r) 
    steps=[]

    while isborder(r,Sud)==false || isborder(r,West) == false 
        push!(steps, rAlongMove!(r, West))
        push!(steps, rAlongMove!(r, Sud))
    end

    for side in (Nord,Ost,Sud,West)
        rAlongMove!(r,side)
        putmarker!(r)
    end

    for (i,n) in enumerate(steps)
        side = isodd(i) ? Nord : Ost 
        rLongMove!(r,side,n)
    end
end

function rLongMove!(r::Robot,side::HorizonSide,steps::Int) 
    for i in 1:steps
        move!(r,side)
    end
end

function rAlongMove!(r::Robot, side::HorizonSide)

    while isborder(r, side) == false 
        move!(r,side)
    end

end
rMakrAngl(r)