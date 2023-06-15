function mutated_individual = mutate(individual, mutation_rate)
    % 根据变异率进行变异操作
    % 这里只是一个简单的例子，使用了随机交换两个城市的位置
    % 您可以根据需要自行实现其他变异方法

    num_cities = length(individual);

    % 复制个体到变异个体
    mutated_individual = individual;

    % 判断是否进行变异操作
    if rand <= mutation_rate
        % 随机选择两个城市进行交换
        swap_indices = randperm(num_cities, 2);
        city1 = swap_indices(1);
        city2 = swap_indices(2);

        % 交换城市的位置
        temp = mutated_individual(city1);
        mutated_individual(city1) = mutated_individual(city2);
        mutated_individual(city2) = temp;
    end
end


