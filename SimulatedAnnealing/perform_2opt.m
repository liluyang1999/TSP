%% 2-Opt Algorithm
function newRoute = perform_2opt(oldRoute)
    cityNumber = length(oldRoute);
    newRoute = oldRoute;
    while 1
        city1 = randi(cityNumber);
        city2 = randi(cityNumber);
        if city1 > city2
            newRoute(1, city2:city1) = fliplr(newRoute(1, city2:city1));
            break;
        end
        if city1 < city2
            newRoute(1, city1:city2) = fliplr(newRoute(1, city1:city2));
            break;
        end
    end
end

