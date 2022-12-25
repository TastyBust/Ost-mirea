using HorizonSideRobots
function halfDist!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
       nHalfBack(robot, side)
        move!(robot, inverse(side))
    end
end

function nHalfBack(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        halfDist!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
