% ��ջ�������
clear;
close all;
clc;

% �����Ŵ��㷨����
population_size = 100;       % ��Ⱥ��С
max_generations = 30;      % ����������
mutation_rate = 0.02;        % ������
crossover_rate = 0.8;        % ������

% ��ȡ������������
data = csvread('TSPCNProblem7.csv');
city_coordinates = data(:, 1:2);

% ����������
distance_matrix = pdist2(city_coordinates, city_coordinates, 'euclidean');

% ������Ӧ�Ⱥ���
fitness_function = @(path) calculate_total_distance(path, distance_matrix);

% ��ʼ����Ⱥ
num_cities = size(city_coordinates, 1);
population = zeros(population_size, num_cities);
for i = 1:population_size
    population(i, :) = randperm(num_cities);
end

% ������������ļ�
result_file = fopen('results.csv', 'w');
fprintf(result_file, 'Best Path,Shortest Distance\n');

% �����Ż�
for run = 1:31
    fprintf('Run %d\n', run);
    
    % ���������Ӧ��ֵ
    fitness_values = zeros(population_size, 1);
    for i = 1:population_size
        fitness_values(i) = fitness_function(population(i, :));
    end

    % �����Ż�
    for generation = 1:max_generations
        new_population = zeros(population_size, num_cities);

        % ѡ�����
        selected_indices = selection(fitness_values);

        % �������
        for i = 1:2:population_size
            parent1 = population(selected_indices(i), :);
            parent2 = population(selected_indices(i+1), :);
            [child1, child2] = crossover(parent1, parent2, crossover_rate);
            new_population(i, :) = child1;
            new_population(i+1, :) = child2;
        end

        % �������
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

    % �������·�������·������
    best_path = best_individual;

    fprintf('Best Path: ');
    for i = 1:num_cities
        fprintf('%d ', best_path(i));
    end
    fprintf('\n');

    fprintf('Shortest Distance: %.2f\n', best_distance);

    % ������·���;��뱣�浽����ļ�
    fprintf(result_file, '%s,', num2str(best_path));
    fprintf(result_file, '%.2f\n', best_distance);
end

% �رս���ļ�
fclose(result_file);

