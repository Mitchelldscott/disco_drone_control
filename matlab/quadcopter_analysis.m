% EOM Analysis w/ Linearized Model in Simulink
clc
close all
clear all


%% Parameters

syms theta phi psi

b = 0.0069272118;
Jx = 0.0032132169;
Jy = 0.0050362409;
Jz = 0.00722155076;
L = 0.23;

n11 = cos(theta);
n12 = -sin(theta)*sin(psi);
n13 = -sin(theta)*cos(psi);
n21 = -sin(phi)*sin(theta);
n22 = cos(phi)*cos(psi)-sin(phi)*cos(theta)*sin(psi);
n23 = -cos(phi)*sin(psi)-sin(phi)*cos(theta)*cos(psi);
n31 = cos(phi)*sin(theta);
n32 = sin(phi)*cos(psi)+cos(phi)*cos(theta)*sin(psi);
n33 = -sin(theta)*sin(psi)+cos(phi)*cos(theta)*cos(psi);

BN = [n11 n12 n13; n21 n22 n23; n31 n32 n33];
A = [0 1 0 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 1 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 1];
B = [0 0 0 0;...
    b*L*(n31-n11) -b*L*(n13+n12) b*L*(n31+n11) -b*L*(n13+n12);...
    0 0 0 0;...
    b*L*(n23-n21) -b*L*(n23+n22) b*L*(n23+n12) -b*L*(n23+n22);...
    0 0 0 0;...
    b*L*(n33-n31) -b*L(n33+n32) b*L*(n33+n31) -b*L*(n33+n32)];
C = eye(6);
D = 0;

