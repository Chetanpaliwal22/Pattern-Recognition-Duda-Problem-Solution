non_optimal_direction = transpose([1 2 -1.5]);
v = non_optimal_direction;

%Class 2
w2_x1 = [-0.4 -0.31 0.38 -0.15 -0.35 0.17 -0.011 -0.27 -0.065 -0.12];
w2_x2 = [0.58 0.27 0.055 0.53 0.47 0.69 0.55 0.61 0.49 0.054];
w2_x3 = [0.089 -0.04 -0.035 0.011 0.034 0.1 -0.18 0.12 0.0012 -0.063];

w2_matrix = [w2_x1(1) w2_x2(1) w2_x3(1); w2_x1(2) w2_x2(2) w2_x3(2); w2_x1(3) w2_x2(3) w2_x3(3);w2_x1(4) w2_x2(4) w2_x3(4);w2_x1(5) w2_x2(5) w2_x3(5);w2_x1(6) w2_x2(6) w2_x3(6);w2_x1(7) w2_x2(7) w2_x3(7);w2_x1(8) w2_x2(8) w2_x3(8);w2_x1(9) w2_x2(9) w2_x3(9);w2_x1(10) w2_x2(10) w2_x3(10)];

%Class 3
w3_x1 = [0.83 1.1 -0.44 0.047 0.28 -0.39 0.34 -0.3 1.1 0.18];
w3_x2 = [1.6 1.6 -0.41 -0.45 0.35 -0.48 -0.079 -0.22 1.2 -0.11];
w3_x3 = [-0.014 0.48 0.32 1.4 3.1 0.11 0.14 2.2 -0.46 -0.49];

w3_matrix = [w3_x1(1) w3_x2(1) w3_x3(1); w3_x1(2) w3_x2(2) w3_x3(2); w3_x1(3) w3_x2(3) w3_x3(3);w3_x1(4) w3_x2(4) w3_x3(4);w3_x1(5) w3_x2(5) w3_x3(5);w3_x1(6) w3_x2(6) w3_x3(6);w3_x1(7) w3_x2(7) w3_x3(7);w3_x1(8) w3_x2(8) w3_x3(8);w3_x1(9) w3_x2(9) w3_x3(9);w3_x1(10) w3_x2(10) w3_x3(10)];

v_tans = transpose(v);

%w2_matrix = [w2_x1,w2_x1,w2_x1];
w2_matrix_transpose = transpose(w2_matrix);
w3_matrix_transpose = transpose(w3_matrix);

projection_w_2 = v_tans*w2_matrix_transpose;
projection_w_3 = v_tans*w3_matrix_transpose;

%Variance
var_2 = var(projection_w_2);
var_3 = var(projection_w_3);

%Standard Deviation
std_2 = std(projection_w_2);
std_3 = std(projection_w_3);

%Mean
mu_2 = mean(projection_w_2);
mu_3 = mean(projection_w_3);

%for g_2
syms x;
denominator = std(projection_w_2)*sqrt(2*pi);
power = (-1/2)*((x-mu_2)^2/var_2);
g_2 = (1/denominator) * exp(power);

%for g_3
syms x;
denominator = std(projection_w_3)*sqrt(2*pi);
power = (-1/2)*((x-mu_3)^2/var_3);
g_3 = (1/denominator) * exp(power);

incorrect_classified_point_count_class_2 = 0;
disp("For the Second distribution")
for v= projection_w_2
    x = v;
    
    denominator = std(projection_w_2)*sqrt(2*pi);
    power = (-1/2)*((x-mu_2)^2/var_2);
    g_2 = (1/denominator) * exp(power);
    
   denominator = std(projection_w_3)*sqrt(2*pi);
    power = (-1/2)*((x-mu_3)^2/var_3);
    g_3 = (1/denominator) * exp(power);

    
    if(g_2 >= g_3)
        disp("Correct: Point "+x+" is classified into Class 2.");
    else
        incorrect_classified_point_count_class_2 = incorrect_classified_point_count_class_2+1;
        disp("Incorrect: Point "+x+" is classified into Class 3.");
    end
end

incorrect_classified_point_count_class_2

incorrect_classified_point_count_class_3 = 0;
disp("For the Third distribution")
for v= projection_w_3
    x = v;
    
    denominator = std(projection_w_2)*sqrt(2*pi);
    power = (-1/2)*((x-mu_2)^2/var_2);
    g_2 = denominator * exp(power);
    
   denominator = std(projection_w_3)*sqrt(2*pi);
    power = (-1/2)*((x-mu_3)^2/var_3);
    g_3 = (1/denominator) * exp(power);

    
    if(g_3 >= g_2)
        disp("Correct: Point "+x+" is classified into Class 3.");
    else
        incorrect_classified_point_count_class_3 = incorrect_classified_point_count_class_3+1;
        disp("Incorrect: Point "+x+" is mis-classified into Class 2.");
    end
end

incorrect_classified_point_count_class_3

%plot(projection(0);)
x1 = projection_w_2;
x2 = projection_w_3;

y = [0 0 0 0 0 0 0 0 0 0];
%y_k = [2,8,10,11,22]
fig1 = figure;
plot( x1,y, '+r' )
hold on
plot(x2,y,'+b')
legend('Class - 2','Class - 3')

missclassified_point = (incorrect_classified_point_count_class_2+incorrect_classified_point_count_class_3)
training_error = missclassified_point/0.20