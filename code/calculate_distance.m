function distance = calculate_distance(city1, city2)
    % city1��city2�ǳ��еľ�γ������
    % �����������󣬿���ʹ�ò�ͬ�ľ�����㹫ʽ������ŷ����þ��롢�����پ����
    distance = pdist2(city1, city2, 'euclidean');
end

