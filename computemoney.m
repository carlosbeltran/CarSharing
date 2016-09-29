
tripcostnormal = 3.00; %one way cost
tripcostgas    = 2.33; % one way cost metano
tripcost = 0;

x = [1	51	1  0;
1	51	1 0;
1	0	51 0;
1	0	51 0;
1	51	1 0;
1	51	1 0;
51	1	0 0;
51	1	0 0;
1	0	51 0;
1	0	51 0;
1	51	1 0;
1	51	1 0;
1	1	51 0;
1	1	51 0;
51	0	1 0;
51	0	1 0;
1	0	51 0;
1	0	51 0;
51	1	0 0;
1	51	1 0;
1	51	1 0;
1	51	0 0;
1	0	51 0;
51	0	1 0;
1	51	0 0;
1	0	51 0;
1	51	0 0;
1	51	0 0;
1	51	1 0;
1	51	1 0;
0	51	1 0;
1	51	1 0;
1	51	1 0;
1	51	0 0;
1	51	0 0;
51	0	1 0;
51	0	1 0;
51	1	0 0;
1	51	0 0;
1	51	1 0;
1	51	0 0;
1	51	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	1 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
51	1	0 0;
1	0	51 0;
51	1	0 0;
51	1	0 0;
51	1	1 0;
51	1	0 0];

for i=1:size(x,1)

    tripdata = x(i,:);
    ind = ismember(tripdata,[51 1]);
    personsincar = sum(ind);

    % detect use of methane car
    carownerpos = find(ismember(x(i,:),[50 51]));

    if carownerpos == 3 %% Marco's car used
        tripcost = tripcostgas;
    else
        tripcost = tripcostnormal;
    end

    for j = 1:4
        if x(i,j) == 1.0
            x(i,j) = x(i,j)*(tripcost/personsincar);
        end
    end
end

MT = eye(4);

for i=1:4
     carownerindx = ismember(x(:,i),[50 51]);
     MT(i,:) = sum(x(carownerindx,:));
     MT(i,i) = 0;
end
MT

