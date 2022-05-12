%% Crossover Operators
function offsprings = crossover(parents, crossoverProb)
    number = size(parents, 1);
    offsprings = parents;
    for i = 1 : 2 : (number - mod(number, 2))
        if rand < crossoverProb
            [offsprings(i, :), offsprings(i + 1, :)] = points_crossover(offsprings(i, :), offsprings(i + 1, :));
        end
    end
end


% two-point crossover
function [newChrom1, newChrom2] = points_crossover(chrom1, chrom2)
    chromLength = size(chrom1, 2);
    while 1
        point1 = randi(chromLength);
        point2 = randi(chromLength);
        if point1 < point2
            startPoint = min([point1, point2]);
            endPoint = max([point1, point2]);
            newChrom1 = [chrom2(1, startPoint:endPoint), chrom1];
            newChrom2 = [chrom1(1, startPoint:endPoint), chrom2];
            num = endPoint - startPoint + 1;
            searchStart = num + 1;
            for i = 1 : num
                % Remove duplicate cities
                index1 = find(newChrom1(1, searchStart:size(newChrom1, 2)) == newChrom1(1, i));
                index2 = find(newChrom2(1, searchStart:size(newChrom2, 2)) == newChrom2(1, i));
                newChrom1(searchStart - 1 + index1) = [];
                newChrom2(searchStart - 1 + index2) = [];
            end
            split1 = searchStart + (startPoint - 1) - 1;
            split2 = split1 + 1;
            newChrom1 = [newChrom1(1, searchStart:split1), newChrom1(1, 1:searchStart-1), newChrom1(1,split2:size(chrom1, 2))];
            newChrom2 = [newChrom2(1, searchStart:split1), newChrom2(1, 1:searchStart-1), newChrom2(1,split2:size(chrom2, 2))];            
            break;
        end
    end
end


function [newChrom1, newChrom2] = simple_crossover(chrom1, chrom2)
    chromLength = size(chrom1, 2);
    % Randomly choose a point, and the genes beyond that point are swapped to create two new offsprings
    point = randi(chromLength);
    % Put the exchanged part of genes at first position in order to remove the repeated city
    newChrom1 = [chrom2(1, 1:point), chrom1];
    newChrom2 = [chrom1(1, 1:point), chrom2];
    for i = 1 : point
        searchStart = point + 1;
        index1 = find(newChrom1(1, searchStart:size(newChrom1, 2)) == newChrom1(1, i));
        index2 = find(newChrom2(1, searchStart:size(newChrom2, 2)) == newChrom2(1, i));
        newChrom1(searchStart - 1 + index1) = [];
        newChrom2(searchStart - 1 + index2) = [];
    end
end
 