%% DATA POSTPROCESSING - SIMULATION RESULTS

% Authors:  Sergio A. Dorado-Rojas (sergio.dorado.rojas@gmail.com)
%           Prof. John Cortes-Romero Ph.D. (jacortesr@unal.edu.co)
%           Prof. Sergio Rivera (srriverar@unal.edu.co)
%           Prof. Eduardo Mojica-Nava (eamojican@unal.edu.co)

% Description: this script generates the plots showing the results based 
% on the execution of the Simulink model 'DecentralizedLFADRC.slx'.

% Simulation time
t=tie_line.time;

color_plot_A1=[0.8706 0.4902 0];
color_plot_A2=[0.4941 0.1843 0.5569];
color_plot_A3=[0.3020 0.7451 0.9333];

% Load area disturbances

% Area 1
lda1=LoadDisturbanceArea1.signals.values();
% Area 2
lda2=LoadDisturbanceArea2.signals.values();
% Area 3
lda3=LoadDisturbanceArea3.signals.values();

% Plot of area disturbances
close all
clc
figure(1)
plot(t,lda1,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,lda2,'Color',color_plot_A2,'linewidth',2)
plot(t,lda3,'Color',color_plot_A3,'linewidth',2)
title('Load Disturbance per Area','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta P_L$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('Area 1','Area 2','Area 3');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northwest');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

%%

% Frequency response without ADRC
f1_no_ADRC=frequency.signals.values(:,1)/60;
f2_no_ADRC=frequency.signals.values(:,2)/60;
f3_no_ADRC=frequency.signals.values(:,3)/60;

% Frequency with ADRC
f1=frequency_ADRC.signals.values(:,1)/60;
f2=frequency_ADRC.signals.values(:,2)/60;
f3=frequency_ADRC.signals.values(:,3)/60;

figure(2)
plot(t,f1,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,f2,'Color',color_plot_A2,'linewidth',2)
plot(t,f3,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in each Control Area','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta f$ (Hz)','interpreter','latex','fontsize',20)
leg1=legend('Area 1','Area 2','Area 3');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northwest');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

figure(3)
plot(t,f1_no_ADRC,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,f2_no_ADRC,'Color',color_plot_A2,'linewidth',2)
plot(t,f3_no_ADRC,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in each Control Area (no ADRC)','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta f$ (Hz)','interpreter','latex','fontsize',20)
leg1=legend('Area 1','Area 2','Area 3');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northwest');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

%% Frequency deviation in each control area


% Area 1

clf(figure(4))
figure(4)
plot(t,f1,'Color',color_plot_A1,'linewidth',2)
title('Frequency Deviation in Control Area 1','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta f_{1}$ (Hz)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

hold off
axes('Position',[0.1 0.62 0.3 0.25])
box on
plot(t,f1,'Color',color_plot_A1,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{1}$ (Hz)','interpreter','latex')
xlim([100 150])

axes('Position',[0.45 0.18 0.3 0.25])
box on
plot(t,lda1,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 1','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,1}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 4.5])

axes('Position',[0.45 0.62 0.3 0.25])
box on
plot(t,f1,'Color',color_plot_A1,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{1}$ (Hz)','interpreter','latex')
xlim([400 480])

% Area 2

clf(figure(5))
figure(5)
plot(t,f2,'Color',color_plot_A2,'linewidth',2)
title('Frequency Deviation in Control Area 2','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta f_{2}$ (Hz)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
ylim([-6e-4 6e-4])

hold off
axes('Position',[0.1 0.62 0.3 0.25])
box on
plot(t,f2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{2}$ (Hz)','interpreter','latex')
xlim([0 100])

axes('Position',[0.1 0.18 0.3 0.25])
box on
plot(t,lda2,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 2','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,2}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 5.5])

axes('Position',[0.546 0.62 0.3 0.25])
box on
plot(t,f2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{2}$ (Hz)','interpreter','latex')
xlim([230 300])

axes('Position',[0.546 0.18 0.3 0.25])
box on
plot(t,f2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{2}$ (Hz)','interpreter','latex')
xlim([405 460])

%%

% Area 3

clf(figure(6))
figure(6)
plot(t,f3,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in Control Area 3','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta f_{3}$ (Hz)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
ylim([-6e-4 6e-4])

hold off
axes('Position',[0.18 0.62 0.3 0.25])
box on
plot(t,f3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{3}$ (Hz)','interpreter','latex')
xlim([30 80])
ylim([-5e-4 6e-4])

axes('Position',[0.18 0.18 0.3 0.25])
box on
plot(t,lda3,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 3','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,3}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 5.5])

axes('Position',[0.546 0.62 0.3 0.25])
box on
plot(t,f3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{3}$ (Hz)','interpreter','latex')
xlim([200 300])
ylim([-8e-5 6e-5])

axes('Position',[0.546 0.18 0.3 0.25])
box on
plot(t,f3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta f_{3}$ (Hz)','interpreter','latex')
xlim([400 480])

%%

% Tie-line power with ADRC
p12=tie_line_ADRC.signals.values(:,1);
p23=tie_line_ADRC.signals.values(:,2);
p31=tie_line_ADRC.signals.values(:,3);

% Tie-line power without ADRC
p12_no_ADRC=tie_line.signals.values(:,1);
p23_no_ADRC=tie_line.signals.values(:,2);
p31_no_ADRC=tie_line.signals.values(:,3);

figure(7)
plot(t,p12,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,p23,'Color',color_plot_A2,'linewidth',2)
plot(t,p31,'Color',color_plot_A3,'linewidth',2)
title('Tie-line Exchange between Control Areas','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta P$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('$\Delta P_{12}$','$\Delta P_{23}$','$\Delta P_{31}$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northwest');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

figure(8)
plot(t,p12_no_ADRC,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,p23_no_ADRC,'Color',color_plot_A2,'linewidth',2)
plot(t,p31_no_ADRC,'Color',color_plot_A3,'linewidth',2)
title('Tie-line Exchange between Control Areas (no ADRC)','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta P$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('$\Delta P_{12}$','$\Delta P_{23}$','$\Delta P_{31}$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northwest');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

