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

optimal_direction = ASSIGNMENT_2_5_A(w2_x1,w2_x2,w2_x3,w3_x1,w3_x2,w3_x3);

v = optimal_direction;

v_tans = transpose(v);

%w2_matrix = [w2_x1,w2_x1,w2_x1];
w2_matrix_transpose = transpose(w2_matrix);
w3_matrix_transpose = transpose(w3_matrix);
projection_w_2 = v_tans*w2_matrix_transpose;
projection_w_3 = v_tans*w3_matrix_transpose;

%p0 = [0:0:0] v
%If you are given the vector equation of a line with point P0 = [0:0] and direction vector v = [0:1] how do you plot this line in Matlab?

%plot(projection(0);)
x1 = projection_w_2;
x2 = projection_w_3;

y = [0 0 0 0 0 0 0 0 0 0];
fig1 = figure;
plot(x1,y, 'b')
hold on
plot( x1,y, 'or' )
hold on
plot(x2,y,'ob')
hold on
plot(x2,y, 'b')

%line(min(x1),max(x1))
legend('Class - 2','Class - 3')

%3d plot
project_3_d = v*projection_w_2;

x = [project_3_d(1,1),project_3_d(1,2),project_3_d(1,3),project_3_d(1,4),project_3_d(1,5),project_3_d(1,6),project_3_d(1,7),project_3_d(1,8),project_3_d(1,9),project_3_d(1,10)];
y = [project_3_d(2,1),project_3_d(2,2),project_3_d(2,3),project_3_d(2,4),project_3_d(2,5),project_3_d(2,6),project_3_d(2,7),project_3_d(2,8),project_3_d(2,9),project_3_d(2,10)];
z = [project_3_d(3,1),project_3_d(3,2),project_3_d(3,3),project_3_d(3,4),project_3_d(3,5),project_3_d(3,6),project_3_d(3,7),project_3_d(3,8),project_3_d(3,9),project_3_d(3,10)];

project_3_d_2 = v*projection_w_3;

x1 = [project_3_d_2(1,1),project_3_d_2(1,2),project_3_d_2(1,3),project_3_d_2(1,4),project_3_d_2(1,5),project_3_d_2(1,6),project_3_d_2(1,7),project_3_d_2(1,8),project_3_d_2(1,9),project_3_d_2(1,10)];
y1 = [project_3_d_2(2,1),project_3_d_2(2,2),project_3_d_2(2,3),project_3_d_2(2,4),project_3_d_2(2,5),project_3_d_2(2,6),project_3_d_2(2,7),project_3_d_2(2,8),project_3_d_2(2,9),project_3_d_2(2,10)];
z1 = [project_3_d_2(3,1),project_3_d_2(3,2),project_3_d_2(3,3),project_3_d_2(3,4),project_3_d_2(3,5),project_3_d_2(3,6),project_3_d_2(3,7),project_3_d_2(3,8),project_3_d_2(3,9),project_3_d_2(3,10)];


fig2 = figure;
plot3(x,y,z,'b')
hold on
plot3(x,y,z,'o')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
hold on
plot3(x1,y1,z1,'b')
hold on
plot3(x1,y1,z1,'o')
xlabel('X')
ylabel('Y')
zlabel('Z')
%line([-0.0096 0.0053 -0.0019],[0.0210 -0.0117 0.0042],'linestyle','--');
hold off