using HorizonSideRobots
r=Robot("7.sit",animate=true)
function rMovements!(r::Robot, steps::Integer, side::HorizonSide; northern::Bool = true)::Nothing
    if northern
        for _ = 1:steps
            move!(r, side)
            if !isborder(r, Nord)
                break
            end
        end
    end
end

function rFindHole!(r)
    steps = 1
    sides = [Ost, West]
    while isborder(r, Nord)
        for side in sides
            rMovements!(r, steps, side; northern=true)
            steps += 1
            if !isborder(r, Nord)
                break
            end
        end
    end
end
rFindHole!(r)