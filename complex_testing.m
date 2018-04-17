
load ('./WERKSPEJS/mereni_16_04/Test_data/complex_test')
vypustleva=ty
[sim_u sim_vo sim_vt sim_h1 sim_h2]= parse2simulink(vypustleva);
return




%Levý tank
time = vypust_leva(:,1);
plot (time,0.5 *vypust_leva(:,4), 'LineWidth',2);
hold on
plot (time,vypust_leva(:,2),'LineWidth',2);
plot (time,vypust_leva(:,3), 'LineWidth',2, 'LineStyle','-');
y_plot_limits = [0 0.25];
ylim(y_plot_limits)
grid on; 
legend({'u(t)', 'h1\_orig','h1nolinear\_(t)'},'Location','best');
title("Vypouštění a napouštění levého tanku");
xlabel('Time t[s]','FontSize',12);
ylabel('h1 [m]','FontSize',12);


%Levý tank
time = vypust_leva(:,1);
plot (time,0.5 *vypust_leva(:,4), 'LineWidth',2);
hold on
plot (time,vypust_leva(:,2),'LineWidth',2);
plot (time,vypust_leva(:,3), 'LineWidth',2, 'LineStyle','-');
y_plot_limits = [0 0.25];
ylim(y_plot_limits)
grid on; 
legend({'u(t)', 'h1\_orig','h1nolinear\_(t)'},'Location','best');
title("Vypouštění a napouštění levého tanku");
xlabel('Time t[s]','FontSize',12);
ylabel('h1 [m]','FontSize',12);



