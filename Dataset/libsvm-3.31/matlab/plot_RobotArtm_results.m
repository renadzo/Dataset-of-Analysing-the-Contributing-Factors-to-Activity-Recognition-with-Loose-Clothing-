close all
clear
clc

selected_workspaceFolder = '_RobotArm';
ws = 5; %selected window size
accAxes = [0 2.5 40 105]; %window size up to 100dp (2.5s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy Bar Plots                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ORIENTATION
figure(1)
load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-perpendicular_low150_high300.mat']);
data = [acc(4,:); acc(3,:); acc(2,:); acc(1,:)];
error = [std_acc(4,:); std_acc(3,:); std_acc(2,:); std_acc(1,:)];
wSize = window_size(ws)/40;
load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-parallel_low150_high300.mat']);
data(:,:,end+1) =[acc(4,:); acc(3,:); acc(2,:); acc(1,:)];
error(:,:,end+1) = [std_acc(4,:); std_acc(3,:); std_acc(2,:); std_acc(1,:)];

gp1 = [data(1,ws,1) data(2,ws,1) data(3,ws,1) data(4,ws,1)];
gp2 = [data(1,ws,2) data(2,ws,2) data(3,ws,2) data(4,ws,2)];

er1 = [error(1,ws,1) error(2,ws,1) error(3,ws,1) error(4,ws,1)];
er2 = [error(1,ws,2) error(2,ws,2) error(3,ws,2) error(4,ws,2)];

gpAll = [gp1; gp2];
erAll = [er1; er2];
xLabels = ["Perpendicular","Parallel"];

bar(gpAll)
ylim([30 100])

hold on
[ngroups, nbars] = size(gpAll);     % Find the number of groups and the number of bars in each group
groupwidth = min(0.8, nbars/(nbars + 1.5));     % Calculate the width for each bar group
for i = 1:nbars     % Set the position of each error bar in the centre of the main bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, gpAll(:,i), erAll(:,i), 'k', 'linestyle', 'none');
    %         text(x,gpAll(:,i),num2str(round(gpAll(:,i),2)),'vert','bottom','horiz','center');
end
set(gca,'xticklabel', xLabels, 'FontSize', 16)
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'using robot manipulator for different orientations'], 'FontSize',16,'Color','k');
xlabel('Fabric Orientation','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend({'F4','F3', 'F2', 'R1'}, 'Location','northeast');
box off;
hold off




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Accuracy & Window Size (Orientation)                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


selected_workspaceFolder = '_RobotArm';
accAxes = [0 2.5 40 105]; %window size up to 100dp (2.5s)c

load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-parallel_low150_high300.mat']);
figure(2)
windowSize = window_size/40;

p4 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-' );
hold on;
p3 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
p1 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
hold off;

axis(accAxes);
title(['Frequency classification accuracy with varying window', newline, 'sizes using robot manipulator for parallel oriented fabric'], 'FontSize',16,'Color','k');
xlabel('Window Size (s)','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');


load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-perpendicular_low150_high300.mat']);
figure(3)
windowSize = window_size/40;

p4 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-' );
hold on;
p3 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
p1 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
hold off;

axis(accAxes);
title(['Frequency classification accuracy with varying window', newline, 'sizes using robot manipulator for perpendicular oriented fabric'], 'FontSize',16,'Color','k');
xlabel('Window Size (s)','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');







