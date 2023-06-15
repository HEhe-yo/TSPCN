function [child1, child2] = crossover(parent1, parent2, crossover_rate)
    % 根据交叉率进行交叉操作
    % 这里只是一个简单的例子，使用了部分映射交叉（PMX）方法
    % 您可以根据需要自行实现其他交叉方法

    num_cities = length(parent1);

    % 生成两个子代的空数组
    child1 = zeros(1, num_cities);
    child2 = zeros(1, num_cities);

    % 判断是否进行交叉操作
    if rand <= crossover_rate
        % 随机选择两个交叉点
        crossover_points = sort(randperm(num_cities, 2));

        % 复制父代的交叉片段到子代中
        child1(crossover_points(1):crossover_points(2)) = parent1(crossover_points(1):crossover_points(2));
        child2(crossover_points(1):crossover_points(2)) = parent2(crossover_points(1):crossover_points(2));

        % 根据父代2填充子代1
        for i = 1:num_cities
            if ~ismember(parent2(i), child1)
                if child1(i) == 0
                    child1(i) = parent2(i);
                else
                    index = i;
                    while child1(index) ~= 0
                        index = find(parent2 == child1(index));
                    end
                    child1(index) = parent2(i);
                end
            end
        end

        % 根据父代1填充子代2
        for i = 1:num_cities
            if ~ismember(parent1(i), child2)
                if child2(i) == 0
                    child2(i) = parent1(i);
                else
                    index = i;
                    while child2(index) ~= 0
                        index = find(parent1 == child2(index));
                    end
                    child2(index) = parent1(i);
                end
            end
        end
    else
        % 如果不进行交叉操作，直接复制父代到子代
        child1 = parent1;
        child2 = parent2;
    end
end


