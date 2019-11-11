function optimal_direction = ASSIGNMENT_2_5_A(w2_x1,w2_x2,w2_x3,w3_x1,w3_x2,w3_x3)

%Class 2
w2_x1 = [-0.4 -0.31 0.38 -0.15 -0.35 0.17 -0.011 -0.27 -0.065 -0.12];
w2_x2 = [0.58 0.27 0.055 0.53 0.47 0.69 0.55 0.61 0.49 0.054];
w2_x3 = [0.089 -0.04 -0.035 0.011 0.034 0.1 -0.18 0.12 0.0012 -0.063];

%Class 3
w3_x1 = [0.83 1.1 -0.44 0.047 0.28 -0.39 0.34 -0.3 1.1 0.18];
w3_x2 = [1.6 1.6 -0.41 -0.45 0.35 -0.48 -0.079 -0.22 1.2 -0.11];
w3_x3 = [-0.014 0.48 0.32 1.4 3.1 0.11 0.14 2.2 -0.46 -0.49];


%Mean Matrix
u2_mat = [mean(w2_x1) mean(w2_x2) mean(w2_x3)];
u3_mat = [mean(w3_x1) mean(w3_x2) mean(w3_x3)];

%Second Matrix
cov_w_2_12 = cov(w2_x1,w2_x2);
cov_w_2_12_digonal_value = -0.0163;

cov_w_2_13 = cov(w2_x1,w2_x3);
cov_w_2_13_digonal_value = -0.0058;

cov_w_2_23 = cov(w2_x2,w2_x3);
cov_w_2_23_digonal_value = 0.0095;

%Final Second Covariance Matrix
%co_w_2_123(w2_x1,w2_x2,w2_x3)
%cov_formula = cov(w2_x1,w2_x2,w2_x3)
co_w_2_123 =[var(w2_x1) cov_w_2_12_digonal_value cov_w_2_13_digonal_value;cov_w_2_12_digonal_value var(w2_x2) cov_w_2_23_digonal_value; cov_w_2_13_digonal_value cov_w_2_23_digonal_value var(w2_x3) ];


%Third Matrix
cov_w_3_12 = cov(w3_x1,w3_x2);
cov_w_3_12_digonal_value = 0.4497;

cov_w_3_13 = cov(w3_x1,w3_x3);
cov_w_3_13_digonal_value = -0.2005;

cov_w_3_23 = cov(w3_x2,w3_x3);
cov_w_3_23_digonal_value = -0.2237;

%Final Second Covariance Matrix
co_w_3_123 =[var(w3_x1) cov_w_3_12_digonal_value cov_w_3_13_digonal_value;cov_w_3_12_digonal_value var(w3_x2) cov_w_3_23_digonal_value; cov_w_3_13_digonal_value cov_w_3_23_digonal_value var(w3_x3) ];

%Scatter Matrix
s_2 = 9*co_w_2_123;
s_3 = 9*co_w_3_123;

%within class scattar
s_w = s_2 + s_3;

%inverse s_w
s_w_inv = inv(s_w);

%optimal direction
optimal_direction = s_w_inv * (transpose(u2_mat)-transpose(u3_mat))
end

