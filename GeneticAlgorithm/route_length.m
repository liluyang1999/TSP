%% Calculate the total length of the input solution
function totalLength = route_length(solution, distMatrix)
    totalLength = 0;
    for i = 1 : (length(solution) - 1)
        cityi = solution(1, i);
        cityj = solution(1, i + 1);
        totalLength = totalLength + distMatrix(cityi, cityj);
    end
    totalLength = totalLength + distMatrix(length(solution), 1);
end

