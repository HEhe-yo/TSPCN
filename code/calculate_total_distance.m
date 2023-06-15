function total_distance = calculate_total_distance(path, distance_matrix)
    num_cities = length(path);
    total_distance = 0;
    for i = 1:num_cities-1
        city1 = path(i);
        city2 = path(i+1);
        distance = distance_matrix(city1, city2);
        total_distance = total_distance + distance;
    end
end


