function [child1, child2] = crossover(parent1, parent2, crossover_rate)
    % ���ݽ����ʽ��н������
    % ����ֻ��һ���򵥵����ӣ�ʹ���˲���ӳ�佻�棨PMX������
    % �����Ը�����Ҫ����ʵ���������淽��

    num_cities = length(parent1);

    % ���������Ӵ��Ŀ�����
    child1 = zeros(1, num_cities);
    child2 = zeros(1, num_cities);

    % �ж��Ƿ���н������
    if rand <= crossover_rate
        % ���ѡ�����������
        crossover_points = sort(randperm(num_cities, 2));

        % ���Ƹ����Ľ���Ƭ�ε��Ӵ���
        child1(crossover_points(1):crossover_points(2)) = parent1(crossover_points(1):crossover_points(2));
        child2(crossover_points(1):crossover_points(2)) = parent2(crossover_points(1):crossover_points(2));

        % ���ݸ���2����Ӵ�1
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

        % ���ݸ���1����Ӵ�2
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
        % ��������н��������ֱ�Ӹ��Ƹ������Ӵ�
        child1 = parent1;
        child2 = parent2;
    end
end


