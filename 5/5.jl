using HorizonSideRobots

r=Robot("5.sit"; animate=true)


    rSide = 3
while !(isborder(r,HorizonSide(2))==true && rSide == 2)
    if isborder(r,HorizonSide(rSide))==false
        putmarker!(r)
        move!(r,HorizonSide(rSide))
    elseif (rSide == 3)
        rSide = 0
    elseif (rSide == 0)
        rSide = 1
    elseif (rSide == 1)
        rSide = 2
    end
end


count = 0
rSide = 0
while true
if isborder(r,HorizonSide(rSide))==false
    move!(r,HorizonSide(rSide))
    count += 1
elseif (count == 14)
    count = 0
    move!(r,HorizonSide(3))
    if rSide == 0
    rSide = 2
    else rSide == 2
    rSide = 0
    end
elseif (count != 14)
    break;
end
end



rSide = 1
rSideup = 0
while true
    if (isborder(r,HorizonSide(0)) == true)
        rSideup = 0
        putmarker!(r)
        move!(r,HorizonSide(3))
    end
    if (isborder(r,HorizonSide(3)) == true)
        rSideup = 3
        putmarker!(r)
        move!(r,HorizonSide(2))
    end
    if (isborder(r,HorizonSide(2)) == true)
        rSideup = 2
        putmarker!(r)
        move!(r,HorizonSide(1))
    end
    if (isborder(r,HorizonSide(1)) == true)
        rSideup = 1
        putmarker!(r)
        move!(r,HorizonSide(0))
    end
    if ((isborder(r,HorizonSide(0)) == false) && (isborder(r,HorizonSide(1)) == false) && (isborder(r,HorizonSide(2)) == false) && (isborder(r,HorizonSide(3)) == false))
        putmarker!(r)
        move!(r,HorizonSide(rSideup))
    end
end

