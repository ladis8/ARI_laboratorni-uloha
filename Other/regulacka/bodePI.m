function bodePI(Gf,gain,omega,PM)
[magG,phaseG,woutG] = bode(Gf,logspace(-4,4,10000));
[magG2,phaseG2,woutG2] = bode(gain*Gf,logspace(-4,4,10000));

[magL,phaseL,woutL] = bode(Gf*tf([gain/sqrt(2) omega*gain/sqrt(2)],[1 0]),logspace(-4,4,10000));
[magC,phaseC,woutC] = bode(tf([gain/sqrt(2) omega*gain/sqrt(2)],[1 0]),logspace(-4,4,10000));



figure('units','normalized','outerposition',[0 0 1 1],'NumberTitle','off');

subplot(2,1,1);
semilogx(woutG, 20*log10(squeeze(magG)), 'red', 'LineWidth',3);
hold on;
semilogx(woutG2, 20*log10(squeeze(magG2)), 'black', 'LineWidth',3,'LineStyle','-.');
semilogx(woutL, 20*log10(squeeze(magL)), 'blue', 'LineWidth',3);
semilogx(woutC, 20*log10(squeeze(magC)), 'green', 'LineWidth',3);

hold on;
grid on;
xlim([0.001 1])
ylim([-50 50])
xticks([0.001 0.01 omega 0.1  1 10 100])
xticklabels({'10^{-3}','10^{-2}','\omega_k','10^{-1}','10^{0}','10^{1}','10^{2}'})
yticks([ -50 -20*log10(gain) 0 50])
yticklabels({'-50','-20log(gain)','0','50'})
ylabel('Magnitude[dB]','FontSize',15);
xlabel('Frequency[rad/s]','FontSize',15);
title('Bode PI regulator','FontSize',20);
plot(linspace(omega,omega),linspace(-1000,0),'LineStyle','--','LineWidth',1,'Color','black');
plot(linspace(0.0001,omega),linspace(-20*log10(gain),-20*log10(gain)),'LineStyle','--','LineWidth',1,'Color','red');
plot(linspace(0.0001,omega),linspace(0,0),'LineStyle','--','LineWidth',1,'Color','black');
yticks([-200 -150 -100 -50 -20*log10(gain) 0 50])
legend('G(s)',"K_pG(s)",'L(s)','C(s)','Location','southwest')


subplot(2,1,2);
semilogx(woutG, (squeeze(phaseG)), 'red', 'LineWidth',3);
hold on;
semilogx(woutG, (squeeze(phaseL)), 'blue', 'LineWidth',3);
semilogx(woutG, (squeeze(phaseC)), 'green', 'LineWidth',3);

xlim([0.001 1])
ylim([-170 10])
grid on;
hold on;
xlabel('Frequency[rad/s]','FontSize',15);
ylabel('Phase[�]','FontSize',15);
xticks([0.001 0.01 omega 0.1  1 10 100])
xticklabels({'10^{-3}','10^{-2}','\omega_k','10^{-1}','10^{0}','10^{1}','10^{2}'})
yticks([ -200 -150 (-180+PM) -100 (-180+45+PM) -50 -45 0 50])
yticklabels({'-200', '-150','-180+PM','-100','-180+PM+45', '-50','-45','0','50'})
plot(linspace(0.0001,omega),linspace(-180+PM+45,-180+PM+45),'LineStyle','--','LineWidth',1,'Color','red');
plot(linspace(0.0001,omega),linspace(-180+PM,-180+PM),'LineStyle','--','LineWidth',1,'Color','blue');
plot(linspace(omega,omega),linspace(-180+PM,100),'LineStyle','--','LineWidth',1,'Color','black');
plot(linspace(0.0001,omega),linspace(-45,-45),'LineStyle','--','LineWidth',1,'Color','green');

hold off;
end