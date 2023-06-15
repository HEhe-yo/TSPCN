% 清空环境变量
clear;
close all;
clc;

% 设置遗传算法参数
population_size = 100;       % 种群大小
max_generations = 30;      % 最大迭代次数
mutation_rate = 0.02;        % 变异率
crossover_rate = 0.8;        % 交叉率

% 读取城市坐标数据
data = csvread('TSPCNProblem7.csv');
city_coordinates = data(:, 1:2);

% 计算距离矩阵
distance_matrix = pdist2(city_coordinates, city_coordinates, 'euclidean');

% 定义适应度函数
fitness_function = @(path) calculate_total_distance(path, distance_matrix);

% 初始化种群
num_cities = size(city_coordinates, 1);
population = zeros(population_size, num_cities);
for i = 1:population_size
    population(i, :) = randperm(num_cities);
end

% 创建结果保存文件
result_file = fopen('results.csv', 'w');
fprintf(result_file, 'Best Path,Shortest Distance\n');

% 迭代优化
for run = 1:31
    fprintf('Run %d\n', run);
    
    % 计算个体适应度值
    fitness_values = zeros(population_size, 1);
    for i = 1:population_size
        fitness_values(i) = fitness_function(population(i, :));
    end

    % 迭代优化
    for generation = 1:max_generations
        new_population = zeros(population_size, num_cities);

        % 选择操作
        selected_indices = selection(fitness_values);

        % 交叉操作
        for i = 1:2:population_size
            parent1 = population(selected_indices(i), :);
            parent2 = population(selected_indices(i+1), :);
            [child1, child2] = crossover(parent1, parent2, crossover_rate);
            new_population(i, :) = child1;
            new_population(i+1, :) = child2;
        end

        % 变异操作
        for i = 1:population_size
            mutated_individual = mutate(new_population(i, :), mutation_rate);
            new_population(i, :) = mutated_individual;
        end

        population = new_population;

        for i = 1:population_size
            fitness_values(i) = fitness_function(population(i, :));
        end

        [best_fitness, best_index] = min(fitness_values);
        best_individual = population(best_index, :);
        best_distance = calculate_total_distance(best_individual, distance_matrix);

        fprintf('Generation %d: Best Distance = %.2f\n', generation, best_distance);
    end

    % 输出最优路径和最短路径距离
    best_path = best_individual;

    fprintf('Best Path: ');
    for i = 1:num_cities
        fprintf('%d ', best_path(i));
    end
    fprintf('\n');

    fprintf('Shortest Distance: %.2f\n', best_distance);

    % 将最优路径和距离保存到结果文件
    fprintf(result_file, '%s,', num2str(best_path));
    fprintf(result_file, '%.2f\n', best_distance);
end

% 关闭结果文件
fclose(result_file);

