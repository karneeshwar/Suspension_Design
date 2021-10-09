%% 1.) Definitions
%% 1.) -Parameter definition
mass                       = 750;                 % Mass of the body [kg]
stiffness                  = 50000;               % Stiffness Coefficient of spring [N/m]
damping                    = 0;                   % Damping coefficient of damper [Ns/m]
time                       = 0:0.01:1;            % Time [s]

x_0                        = 0.01;                % Initial Condition displacement
x_dot_0                    = 0;                   % Initial Condition velocity
    
%% 2.) Computing
w0=[x_0,x_dot_0];    % Create a vector with initial conditions
A=[0 1;(-stiffness/mass) (-damping/mass)];    % Create system Matrix
[tsim, wsim] = ode45(@(w_dot,w) A*w,time,w0,'options'); % Define derivative
time=tsim';
x_t=wsim(:,1)';
v_t=wsim(:,2)';
plot(time,x_t,'r');
hold on
plot(time,v_t);
%% 2.) -Numerical solution of the motion
    % Calling numerical solver