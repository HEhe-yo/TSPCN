function selected_indices = selection(fitness_values)
    % ������Ӧ��ֵ����ѡ�����
    % ����ֻ��һ���򵥵����ӣ�ʹ�������̶�ѡ�񷽷�
    % �����Ը�����Ҫ����ʵ������ѡ�񷽷�

    % ������Ӧ��ֵ���ܺ�
    total_fitness = sum(fitness_values);

    % ����ÿ�������ѡ�����
    selection_probabilities = fitness_values / total_fitness;

    % ʹ�����̶�ѡ�񷽷�ѡ�����
    cumulative_probabilities = cumsum(selection_probabilities);
    num_individuals = length(fitness_values);
    selected_indices = zeros(num_individuals, 1);
    for i = 1:num_individuals
        r = rand;
        selected_index = find(cumulative_probabilities >= r, 1);
        selected_indices(i) = selected_index;
    end
end


