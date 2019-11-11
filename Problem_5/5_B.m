%matrix for input
w_1_x_1 = [-5.01 -5.43 1.08 0.86 -2.67 4.94 -2.51 -2.25 5.56 1.03];
w_2_x_1 = [-0.91 1.30 -7.75 -5.47 6.14 3.60 5.37 7.18 -7.39 -7.50];
w_3_x_1 = [5.35 5.12 -1.34 4.48 7.11 7.17 5.75 0.77 0.9 3.52];

w_1_x_12 = [-5.01 -8.12;-5.43 -3.48;1.08 -5.52;0.86 -3.78;-2.67 0.63;4.94 3.29;-2.51 2.09;-2.25 -2.13;5.56 2.86;1.03 -3.33];

%mean of 1 2 and 3
u_1 = mean(w_1_x_1);
u_2 = mean(w_2_x_1);
u_3 = mean(w_3_x_1);

%Standard Deviation for 1 and 2
L = size(w_1_x_1);
sum =0;
stdevSum =0;
for i = 1: 10
    stdevSum = stdevSum+(w_1_x_1(i)-u_1)^2;
end
std1 = sqrt((stdevSum)/10);

stdevSum2 =0;
for i = 1: 10
    stdevSum2 = stdevSum2+(w_2_x_1(i)-u_2)^2;
end
std2 = sqrt((stdevSum2)/10);

%std1 = stdev;
%std2 = std(w_2_x_1);

%variance
v_1 = var(w_1_x_1);
v_2 = var(w_2_x_1);
v_3 = var(w_3_x_1);

v_12 = cov(w_1_x_12);

%determinant
d_1 = v_1;
d_2 = v_2;
d_3 = v_3;

%inverse of variance matrix
inv_v_12 = [v_12(1) 0;0 v_12(2)];
disp('');
disp("Class 1: ");
disp("Mean: "+u_1);
disp("Variance: "+v_1);
disp("Determinant Covariance: ")

disp('');
disp("Class 2: ");
disp("Mean: "+u_2);
disp("Variance: "+v_2);
disp("Determinant Covariance: ")

%formula
syms x1 x2;
%sqrPart = -.5 * ((x - u1)/std1) .^ 2;
%denPart = (std1 * sqrt(2*pi));
%g_1 = exp(sqrPart) ./ denPart; 

x_mat = [x1; x2];


g_1 = (-1/2)*transpose(x1 - u_1)*(1/v_1)*(x1-u_1)-(1/2)*(log(2*pi))-(1/2*(log(v_1)))+log(1/2);

g_2 = (-1/2)*transpose(x1 - u_2)*(1/v_2)*(x1-u_2)-(1/2)*(log(2*pi))-(1/2*(log(v_2)))+log(1/2);

g_3 = (-1/2)*transpose(x1 - u_3)*(1/v_3)*(x1-u_3)-(1/2)*(log(2*pi))-(1/2*(log(v_3)))+log(0);

incorrectCount1 = 0;
disp("For the first distribution")
for v= w_1_x_1
    x1 = v;
    %disp(g_1(v))
    sqrPart = -.5 * ((x1 - u_1)/std1) .^ 2;
    denPart = (std1 * sqrt(2*pi));
    g1 = exp(sqrPart) ./ denPart; 
    %g1 = (-1/2)*transpose(x1 - u_1)*(1/v_1)*(x1-u_1)-(1/2)*(log(2*pi))-(1/2*(log(v_1)))+log(1/2);
    %g2 = (-1/2)*transpose(x1 - u_2)*(1/v_2)*(x1-u_2)-(1/2)*(log(2*pi))-(1/2*(log(v_2)))+log(1/2);
    sqrPart = -.5 * ((x1 - u_2)/std2) .^ 2;
    denPart = (std2 * sqrt(2*pi));
    g2 = exp(sqrPart) ./ denPart;
   % disp("g1: "+g1)
   % disp("g2: "+g2)
    if(g1 >= g2)
        disp("Correct: Point "+x1+" is classified into Class 1.");
    elseif (g1 <g2)
        incorrectCount1 = incorrectCount1+1;
        disp("Incorrect: Point "+x1+" is classified into Class 2.");
    end
end


disp("For the second distribution")
for v= w_2_x_1
    x1 = v;
    %disp(g_1(v))
    g1 = (-1/2)*transpose(x1 - u_1)*(1/v_1)*(x1-u_1)-(1/2)*(log(2*pi))-(1/2*(log(v_1)))+log(1/2);
    g2 = (-1/2)*transpose(x1 - u_2)*(1/v_2)*(x1-u_2)-(1/2)*(log(2*pi))-(1/2*(log(v_2)))+log(1/2);

   sqrPart = -.5 * ((x1 - u_1)/std1) .^ 2;
    denPart = (std1 * sqrt(2*pi));
    g1 = exp(sqrPart) ./ denPart; 
    %g1 = (-1/2)*transpose(x1 - u_1)*(1/v_1)*(x1-u_1)-(1/2)*(log(2*pi))-(1/2*(log(v_1)))+log(1/2);
    %g2 = (-1/2)*transpose(x1 - u_2)*(1/v_2)*(x1-u_2)-(1/2)*(log(2*pi))-(1/2*(log(v_2)))+log(1/2);
    sqrPart = -.5 * ((x1 - u_2)/std2) .^ 2;
    denPart = (std2 * sqrt(2*pi));
    g2 = exp(sqrPart) ./ denPart;
    
    if(g1 <= g2)
      disp("Correct: Point "+x1+" is classified into Class 2.");
    elseif (g1 >g2)
        disp("Incorrect: Point "+x1+"is classified into Class 1.");
        incorrectCount1 = incorrectCount1+1;
    end
end


error2 = (incorrectCount1/20)*100;
disp("Error % for variable 1  : "+error2);
