%% Showing the distance between each city using the adjacency matrix 
function distMatrix = dist_mat(cityCoordinates)
    cityNumber = size(cityCoordinates, 2);
    distMatrix = zeros(cityNumber, cityNumber);
    for i = 1 : cityNumber
        cityi = cityCoordinates(:, i);
        for j = 1 : cityNumber
            cityj = cityCoordinates(:, j);
            distMatrix(i, j) = cal_dist(cityi, cityj);
            distMatrix(j, i) = distMatrix(i, j);
        end
    end
end

function distance = cal_dist(city1, city2)
    distance = sqrt(sum((city1(:, 1) - city2(:, 1)).^2)/10);
end


