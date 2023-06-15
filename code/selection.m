function selected_indices = selection(fitness_values)
    % 根据适应度值进行选择操作
    % 这里只是一个简单的例子，使用了轮盘赌选择方法
    % 您可以根据需要自行实现其他选择方法

    % 计算适应度值的总和
    total_fitness = sum(fitness_values);

    % 计算每个个体的选择概率
    selection_probabilities = fitness_values / total_fitness;

    % 使用轮盘赌选择方法选择个体
    cumulative_probabilities = cumsum(selection_probabilities);
    num_individuals = length(fitness_values);
    selected_indices = zeros(num_individuals, 1);
    for i = 1:num_individuals
        r = rand;
        selected_index = find(cumulative_probabilities >= r, 1);
        selected_indices(i) = selected_index;
    end
end


