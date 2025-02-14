clear; clc;
close all;

%% Adding paths to dependencies and importing required data
addpath(genpath('../Robot-Arm-Control'));
run('main.m');

%% Define xf as transformation matrix   

% Transformation matrix of the final position
Td = [0 1 0 0.225;
      1 0 0 0.8349;
      0 0 1 0.9;
      0 0 0 1 ];

% Initial position of the arm
qi = [0 0 -pi/4 0 0 0]';

%% Finding the optimal trajectory of the arm from initial to final position
[q, q_dot, q_ddot, time_sequence] = controller(Td, qi);

% Forward Trajectory
q_forward = q;
q_dot_forward = q_dot;
q_ddot_forward = q_ddot;

% Backward Trajectory
q_backward = flip(q,2);
q_dot_backward = -flip(q_dot,2);
q_ddot_backward = -flip(q_ddot,2);

% %% Plots
% time = out.tout(1:367);
% 
% r0 = out.r0.Data;
% r0_dot = out.r0_dot.Data;
% r0_ddot = out.r0_ddot.Data;
% 
% r1 = out.r1.Data;
% r1_dot = out.r1_dot.Data;
% r1_ddot = out.r1_ddot.Data;
% 
% r2 = out.r2.Data;
% r2_dot = out.r2_dot.Data;
% r2_ddot = out.r2_ddot.Data;
% 
% r3 = out.r3.Data;
% r3_dot = out.r3_dot.Data;
% r3_ddot = out.r3_ddot.Data;
% 
% r4 = out.r4.Data;
% r4_dot = out.r4_dot.Data;
% r4_ddot = out.r4_ddot.Data;
% 
% 
% t0 = out.t0.Data;
% t0_dot = out.t0_dot.Data;
% t0_ddot = out.t0_ddot.Data;
% %%
% plot(time, r0(1:367),'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(2,:),'DisplayName','Joint Position (FK)')
% plot(time, r0_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(2,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Revoloute Joint 1')
% xlabel('Time (s)')
% ylabel('Angle in radians')
% hold off
% 
% %%
% plot(time, r1(1:367),'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(3,:),'DisplayName','Joint Position (FK)')
% plot(time, r1_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(3,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Revoloute Joint 2')
% xlabel('Time (s)')
% ylabel('Angle in radians')
% hold off
% 
% %%
% plot(time, r2(1:367),'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(4,:),'DisplayName','Joint Position (FK)')
% plot(time, r2_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(4,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Revoloute Joint 3')
% xlabel('Time (s)')
% ylabel('Angle in radians')
% hold off
% 
% %%
% plot(time, r3(1:367),'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(5,:),'DisplayName','Joint Position (FK)')
% plot(time, r3_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(5,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Revoloute Joint 4')
% xlabel('Time (s)')
% ylabel('Angle in radians')
% hold off
% 
% %%
% plot(time, r4(1:367),'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(6,:),'DisplayName','Joint Position (FK)')
% plot(time, r4_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(6,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Revoloute Joint 5')
% xlabel('Time (s)')
% ylabel('Angle in radians')
% hold off
% 
% %%
% plot(time, t0(1:367)-0.1399, 'DisplayName','Joint Position (Simulation)')
% hold on
% plot(time_sequence, q(1,:), 'DisplayName','Joint Position (FK)')
% plot(time, t0_dot(1:367),'DisplayName','Joint Velocity (Simulation)','LineStyle','--')
% plot(time_sequence, q_dot(1,:),'DisplayName','Joint Velocity (FK)','LineStyle','--')
% legend()
% title('Translational Joint')
% xlabel('Time (s)')
% ylabel('Displacement (m)')
% hold off