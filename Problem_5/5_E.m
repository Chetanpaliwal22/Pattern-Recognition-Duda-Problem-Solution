%matrix
w_1_x_123 = [-5.01 -8.12 -3.68; -5.43 -3.48 -3.54;1.08 -5.52 1.66; 0.86 -3.78 -4.11;-2.67 0.63 7.39;4.94 3.29 2.08;-2.51 2.09 -2.59; -2.25 -2.13 -6.94; 5.56 2.86 -2.26; 1.03 -3.33 4.33];
              
w_2_x_123 = [-0.91 -0.18 -0.05; 1.30 -2.06 -3.53; -7.75 -4.54 -0.95; -5.47 0.50 3.92; 6.14 5.72 -4.85; 3.60 1.26 4.36; 5.37 -4.63 -3.65; 7.18 1.46 -6.66; -7.39 1.17 6.30; -7.50 -6.32 -0.31];

w_1_x_3 =[-3.68; -3.54; 1.66;  -4.11; 7.39; 2.08; -2.59;  -6.94; -2.26;  4.33];
            
w_2_x_3 =[ -0.05;  -3.53;  -0.95;  3.92;  -4.85;  4.36;  -3.65;  -6.66;  6.30; -0.31];


%mean
u_1 = mean(w_1_x_123);
u_1_col = transpose(u_1);
u_2 = mean(w_2_x_123);
u_2_col = transpose(u_2);

%variance
v_1 = var(w_1_x_123);
v_2 = var(w_2_x_123);

cov_1_123 = cov(w_1_x_123);
cov_2_123 = cov(w_2_x_123);

%determinant
d_1 = v_1;
d_2 = v_2;
d_3 = v_3;
det_1_123 = det(cov_1_123);
det_2_123 = det(cov_2_123);

%inverse of variance matrix
inv_cov_1_123 = inv(cov_1_123);
inv_cov_2_123 = inv(cov_2_123);

%formula
syms x1 x2 x3
x_mat = [x1; x2;x3];

disp('');
disp("Class 1: ");
disp("Mean: "+u_1);
disp("Covariance: ");
disp(cov_1_123);
disp("Determinant Covariance: ")

disp('');
disp("Class 2: ");
disp("Mean: "+u_2);
disp("Covariance: ")
disp(cov_2_123);
exp2=0.039;
disp("Determinant Covariance: ")

incorrectCount1 = 0;
disp("For the first distribution")
%for v= w_1_x_12
for f=1:length(w_1_x_123)
    x1 = w_1_x_123(f,1);
    x2 = w_1_x_123(f,2);
    x3 = w_1_x_123(f,3);
    x_mat = [x1;x2;x3];
    %disp(x_mat)
    g1 = ((-1/2)*transpose(x_mat - u_1_col)*(inv_cov_1_123)*(x_mat-u_1_col))-((2/2)*(log(2*pi)))-(1/2*(log(det_1_123)))+log(1/2);
    g2 = (-1/2)*transpose(x_mat - u_2_col)*(inv_cov_2_123)*(x_mat-u_2_col)-(2/2)*(log(2*pi))-(1/2*(log(det_2_123)))+log(1/2);
    
    %disp("g1: "+g1)
    %disp("g2: "+g2)
    if(g1 >g2)
        disp("Correct: Classified into Class 1");
    elseif (g1 <g2)
        incorrectCount1 = incorrectCount1+1;
        disp("Incorrect: Classified into Class 2");
    end
end

%error1 = (incorrectCount1/10)*100;
%disp("Error % for Class1: "+error1);


incorrectCount2 = 0;
disp("For the second distribution")
%for v= w_2_x_12
for f=1:length(w_2_x_123)
    x1 = w_2_x_123(f,1);
    x2 = w_2_x_123(f,2);
    x3 = w_2_x_123(f,3);
    x_mat = [x1;x2;x3];
    %disp(g_1(v))
    g1 = (-1/2)*transpose(x_mat - u_1_col)*(inv_cov_1_123)*(x_mat-u_1_col)-((2/2)*(log(2*pi)))-(1/2*(log(det_1_123)))+log(1/2); 
    g2 = (-1/2)*transpose(x_mat - u_2_col)*(inv_cov_2_123)*(x_mat-u_2_col)-(2/2)*(log(2*pi))-(1/2*(log(det_2_123)))+log(1/2);

    %disp("Class 2 g1: "+g1);
   % disp("Class 2 g2: "+g2);
    if(g1 <g2)
        disp("Correct: Classified into Class 2");
    elseif (g1 >g2)
        disp("Incorrect: Classified Class 1");
        incorrectCount2 = incorrectCount2+1;
    end
end


error2 = (incorrectCount1+incorrectCount2)/20*100;
disp("Error % for Class1 and class2 for three feature is: "+error2);


%Bhatacharya Bound
u_1 = mean(w_1_x_123);
u_1_col = transpose(u_1);
u_2 = mean(w_2_x_123);
u_2_col = transpose(u_2);

cov_1_123=[var(w_1_x_1) 7.6954 4.1223; 7.6954 var(w_1_x_2) 3.9068; 4.1223 3.9068 var(w_1_x_3)];
cov_2_123=[var(w_2_x_1) 9.9809 -16.3668; 9.9809 var(w_2_x_2) 0.4091; -16.3668 0.4091 var(w_2_x_3)];

%cov_1_123 = cov(w_1_x_123);
%cov_2_123 = cov(w_2_x_123);

p_w_1 = 1/2;
p_w_2 = 1/2;
exp3 = -1/8*transpose(u_2_col-u_1_col)*inv((cov_1_123+cov_2_123)/2)*(u_2_col-u_1_col)+1/2*log((det(cov_1_123+cov_2_123)/2)/(sqrt(det(cov_1_123)*det(cov_2_123))));
bhatacharyaError = sqrt(p_w_1*p_w_2)*exp(exp2)