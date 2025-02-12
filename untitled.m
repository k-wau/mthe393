figure('Name','Homogeneity');
hold on
plot(sint.output.time,2*sint.output.signal)
plot(twosint.output.time,twosint.output.signal)
hold off
legend
legend('(sin(t) through the black box)*2','2sin(t) Throught black box')
xlabel('t (sec)')
ylabel('y')

minLength = min(length(2*sint.output.signal), length(twosint.output.signal));
signal1 = 2*sint.output.signal(1:minLength);
signal2 = twosint.output.signal(1:minLength);
H = rmse(signal1, signal2, "all");
fprintf("Returns the root mean squared error for Homogeneity: %.4f\n", H);

x = sint.output.signal + exp.output.signal(1:2714);
figure('Name','Superposition');
hold on
plot(sint.input.time(1:1000),x(1:1000));
plot(sint.input.time(1:1000),sintplusexp.output.signal(1:1000))
hold off
legend
legend('(sint) + (exp)','(sint+exp)')
xlabel('t (sec)')
ylabel('y')

H1 = rmse(x, sintplusexp.output.signal(1:2714), "all");
fprintf("RMSE for Superposition: %.4f\n", H1);

figure('Name','Time Invariant');
hold on
plot(isint.output.time,isint.output.signal);
plot(iisint.output.time+5,iisint.output.signal)
hold off
legend
legend('sin(t+5)','sin(t+5)')
xlabel('t (sec)')
ylabel('y')

minLength = min(length(isint.output.signal), length(iisint.output.signal));
H2 = rmse(isint.output.signal(1:minLength), iisint.output.signal(1:minLength), "all");
fprintf("RMSE for Time Invariance: %.4f\n", H2);