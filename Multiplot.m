function Multiplot(multisimout)

%%  可视化
% 首先需要将数据传到matlab中


nM=size(multisimout,1);
nN=size(multisimout(1).signals.values,2);

color=plasma(nM);
for i=1:nN

    figure;
    for j=2:nM
        
        t=multisimout.time;
        data=multisimout(j).signals.values;
        plot(t,data(:,i),"LineWidth",1.2,"Color",color(j,:));
        hold on;           
    end
%     colormap(color);
%     colorbar
%     cb=colorbar;
%     cb.Position(1)=1.1*cb.Position(1);
%     cb.Position(3)=0.5*cb.Position(3);
% 
%     cb.Ticks=0.5/(nM):1/(nM):1;
%     cb.TickLabelInterpreter='tex';
%     cb.FontSize=8;

end

end