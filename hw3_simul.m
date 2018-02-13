clear all
D = 5;
P = 5;
Q = 5;
num_diff = 0;
num_trials = 10000;
for z = 1:num_trials
    not_diff = 0; 
    X = randi(2,D, P+Q)-1;
    %manually typed in so Q 1's and P 0's
    for a = 1:Q
        Y(a) = 1; 
    end
    for b = 1:P
        Y(a+b) = 0; 
    end
    p = 1;
    q = 1;
    for i = 1:P+Q
        if Y(i) == 0
            pennies(:,p) = X(:, i);
            p = p+1;
        end
        if Y(i) == 1
            quarters(:,q) = X(:, i);
            q = q+1;
        end
    end

    for j = 1:size(quarters,2)
        for k = 1:size(pennies,2)
            if(quarters(:,j) == pennies(:,k))
                not_diff = 1; 
            end
        end
    end

    if not_diff == 0
        num_diff = num_diff+1; 
    end
end

p = num_diff / num_trials
