using HorizonSideRobots
r=Robot("8.sit",animate=true)

function rfindMarker(r::Robot)
    num_steps_max=1
    side=Nord
    while ismarker(r)==false
        for i in 1:2
            rfindMarker(r,side,num_steps_max)
            side=next(side)
        end
        num_steps_max+=1
    end
end

function rfindMarker(r,side,num_steps_max)
    for i in 1:num_steps_max
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end

next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))
rfindMarker(r)