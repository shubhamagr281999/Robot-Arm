%% define xf as transformation matrix   
% Td = forwardKinematicsAllJoints([0.75; pi/2; -pi/2; pi/4; -pi/4; 0])
% Td1 = [   -0.7071   -0.5000   -0.5000   -0.4463;
%     0.0000    0.7071   -0.7071   -0.1409;
%     0.7071   -0.5000   -0.5000    1.1752;
%          0         0         0    1.0000];
% Td1 = [    0.0000    0.7071   -0.7071   -0.4089;
%     0.7071    0.5000    0.5000    0.7142;
%     0.7071   -0.5000   -0.5000    1.1752;
%          0         0         0    1.0000];
% % 
% qi1 = zeros(6, 1);
% % 
% q = allInverseKinematics(Td1);
% Q = collision_check_IK(q);
% disp(Q)
% [final_waypoints] = path_planning_test(qi, Q);
% % 
% waypoints1 = final_waypoints(:, 1:7);
% waypoints2 = final_waypoints(:, 97:116);
% waypoints3 = final_waypoints(:, 203:229);

% [q1, q_dot1, q_ddot1, time_sequence1, speed1, v1] = plan_velocity_trapezoidal_profile(waypoints1);
% [tau1, energy1] = calculate_trajectory_energy(time_sequence1, q1, q_dot1, q_ddot1);
% 
% [q2, q_dot2, q_ddot2, time_sequence2, speed2, v2] = plan_velocity_trapezoidal_profile(waypoints2);
% [tau2, energy2] = calculate_trajectory_energy(time_sequence2, q2, q_dot2, q_ddot2);
% % 
% [q3, q_dot3, q_ddot3, time_sequence3, speed3, v3] = plan_velocity_trapezoidal_profile(waypoints3);
% [tau3, energy3] = calculate_trajectory_energy(time_sequence3, q3, q_dot3, q_ddot3);

% eef_position1 = zeros(3, size(q1, 2));
% time_steps1 = size(q1, 2);
% 
% eef_position2 = zeros(3, size(q2, 2));
% time_steps2 = size(q2, 2);
% 
% eef_position3 = zeros(3, size(q3, 2));
% time_steps3 = size(q3, 2);
% 
% eef_position1 = zeros(4, size(q1, 2));
% eef_position2 = zeros(4, size(q2, 2));
% eef_position3 = zeros(4, size(q3, 2));
% 
% time_steps1 = size(q1, 2);
% time_steps2 = size(q2, 2);
% time_steps3 = size(q3, 2);
% 
% base_frame = zeros(4, 1);
% base_frame(4, 1) = 1;
% 
% for i=1:time_steps1
%     T_ = forwardKinematicsAllJoints(q1(:, i)) ;
%     eef_position1(:, i) = T_(:,:,6) * base_frame;
% end
% 
% for i=1:time_steps2
%     T_ = forwardKinematicsAllJoints(q2(:, i)) ;
%     eef_position2(:, i) = T_(:,:,6) * base_frame;
% end
% 
% for i=1:time_steps3
%     T_ = forwardKinematicsAllJoints(q3(:, i)) ;
%     eef_position3(:, i) = T_(:,:,6) * base_frame;
% end

box_6_dof_plot2(q1(:, 1), 0.25, 1)
hold on
p(1) = plot3(eef_position1(1, :), eef_position1(2, :), eef_position1(3, :), 'linewidth',2, "color", "red");
p(2) = plot3(eef_position2(1, :), eef_position2(2, :), eef_position2(3, :), 'linewidth',2, "color", "green");
p(3) = plot3(eef_position3(1, :), eef_position3(2, :), eef_position3(3, :), 'linewidth',2, "color", "blue");
hold off
box_6_dof_plot2(q1(:, time_steps1), 1.0, 0)
grid on
xlim([-1, 1]);
ylim([-0.5, 1.3]);
zlim([0, 1.6]);
traj1 = "Trajectory 1 Energy: " + string(energy1) + "J";
traj2 = "Trajectory 2 Energy: " + string(energy2) + "J";
traj3 = "Trajectory 3 Energy: " + string(energy3) + "J";
legend(p,traj1, traj2, traj3)
axis equal