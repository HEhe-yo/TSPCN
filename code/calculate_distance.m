function distance = calculate_distance(city1, city2)
    % city1和city2是城市的经纬度坐标
    % 根据您的需求，可以使用不同的距离计算公式，例如欧几里得距离、曼哈顿距离等
    distance = pdist2(city1, city2, 'euclidean');
end

