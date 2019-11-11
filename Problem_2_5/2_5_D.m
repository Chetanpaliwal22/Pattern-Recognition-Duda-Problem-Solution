%Projection

%Class 2
w2_x1 = [-0.4 -0.31 0.38 -0.15 -0.35 0.17 -0.011 -0.27 -0.065 -0.12];
w2_x2 = [0.58 0.27 0.055 0.53 0.47 0.69 0.55 0.61 0.49 0.054];
w2_x3 = [0.089 -0.04 -0.035 0.011 0.034 0.1 -0.18 0.12 0.0012 -0.063];

w2_matrix = [w2_x1(1) w2_x2(1) w2_x3(1); w2_x1(2) w2_x2(2) w2_x3(2); w2_x1(3) w2_x2(3) w2_x3(3);w2_x1(4) w2_x2(4) w2_x3(4);w2_x1(5) w2_x2(5) w2_x3(5);w2_x1(6) w2_x2(6) w2_x3(6);w2_x1(7) w2_x2(7) w2_x3(7);w2_x1(8) w2_x2(8) w2_x3(8);w2_x1(9) w2_x2(9) w2_x3(9);w2_x1(10) w2_x2(10) w2_x3(10)];
w3_matrix = [w3_x1(1) w3_x2(1) w3_x3(1); w3_x1(2) w3_x2(2) w3_x3(2); w3_x1(3) w3_x2(3) w3_x3(3);w3_x1(4) w3_x2(4) w3_x3(4);w3_x1(5) w3_x2(5) w3_x3(5);w3_x1(6) w3_x2(6) w3_x3(6);w3_x1(7) w3_x2(7) w3_x3(7);w3_x1(8) w3_x2(8) w3_x3(8);w3_x1(9) w3_x2(9) w3_x3(9);w3_x1(10) w3_x2(10) w3_x3(10)];

%Class 3
w3_x1 = [0.83 1.1 -0.44 0.047 0.28 -0.39 0.34 -0.3 1.1 0.18];
w3_x2 = [1.6 1.6 -0.41 -0.45 0.35 -0.48 -0.079 -0.22 1.2 -0.11];
w3_x3 = [-0.014 0.48 0.32 1.4 3.1 0.11 0.14 2.2 -0.46 -0.49];

optimal_direction = ASSIGNMENT_2_5_A(w2_x1,w2_x2,w2_x3,w3_x1,w3_x2,w3_x3)

v = optimal_direction;

v_tans = transpose(v);

%w2_matrix = [w2_x1,w2_x1,w2_x1];
w2_matrix_transpose = transpose(w2_matrix);
w3_matrix_transpose = transpose(w3_matrix);
projection_w_2 = v_tans*w2_matrix_transpose
projection_w_3 = v_tans*w3_matrix_transpose

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
syms t;
denominator = std(projection_w_2)*sqrt(2*pi);
%power = (-1/2)*((x-mu_2)^2/var_2);
g_2 = denominator * exp((-1/2)*((t-mu_2)^2/var_2))

%for g_3
syms x;
denominator = std(projection_w_3)*sqrt(2*pi);
%power(x) = (-1/2)*((x-mu_3)^2/var_3);
g_3 = denominator * exp((-1/2)*((t-mu_3)^2/var_3))


%x = -1:1:5;
%y = g_2;
%plot(t,y,'r')
%hold on
%x = -1:0.1:5;
%y2 = g_3(x);
%plot(x,y2,'b')
%legend('Class - 2','Class - 3')