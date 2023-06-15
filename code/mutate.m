function mutated_individual = mutate(individual, mutation_rate)
    % ���ݱ����ʽ��б������
    % ����ֻ��һ���򵥵����ӣ�ʹ������������������е�λ��
    % �����Ը�����Ҫ����ʵ���������췽��

    num_cities = length(individual);

    % ���Ƹ��嵽�������
    mutated_individual = individual;

    % �ж��Ƿ���б������
    if rand <= mutation_rate
        % ���ѡ���������н��н���
        swap_indices = randperm(num_cities, 2);
        city1 = swap_indices(1);
        city2 = swap_indices(2);

        % �������е�λ��
        temp = mutated_individual(city1);
        mutated_individual(city1) = mutated_individual(city2);
        mutated_individual(city2) = temp;
    end
end


