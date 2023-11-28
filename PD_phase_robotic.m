clc
clear
close all
tf = 1;



%% Initial Condition Generator
for i = 1:50
     try
        X_init= 3*(rand(2,1)-0.5);
        Xd_init= 3*(rand(2,1)-0.5);


        hold all;
        sim PD_robotic_phase.slx
        plot(ans.X1(:,1) , ans.X1(:,2),'b')
        plot(ans.X1(end,1) , ans.X1(end,2), ...
            LineStyle="none",Color=[0 0 0],Marker='o',MarkerSize=3,MarkerFaceColor=[0 0 0])

        plot(X_init(1),Xd_init(1),LineStyle="none",Color='r',Marker='o',MarkerSize=3,MarkerFaceColor='r')
     catch
         disp('unstable');
     end
end
figure;
for i = 1:50
     try
        X_init= 3*(rand(2,1)-0.5);
        Xd_init= 3*(rand(2,1)-0.5);


        hold all;
        sim PD_robotic_phase.slx
        plot(ans.X2(:,1) , ans.X2(:,2),'b')
        plot(ans.X2(end,1) , ans.X2(end,2), ...
            LineStyle="none",Color=[0 0 0],Marker='o',MarkerSize=3,MarkerFaceColor=[0 0 0])

        plot(X_init(2),Xd_init(2),LineStyle="none",Color='r',Marker='o',MarkerSize=3,MarkerFaceColor='r')
     catch
         disp('unstable');
     end
end