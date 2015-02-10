function createfigure(X1, Y1, X2, Y2, XData1, YData1)

load ('\\raspberry\d_work\IFCB1\code_svn\trunk\Guinardia_parasite_analysis\Tall_day2006_2013.mat')
load ('\\raspberry\d_work\IFCB1\ifcb_data_mvco_jun06\Manual_fromClass\summary\count_biovol_manual_29Jul2013_day.mat')

ind59 = find(~isnan(ml_analyzed_mat_bin(:,59)));
ind14 = find(~isnan(ml_analyzed_mat_bin(:,14)));

[ ind_diatom, class_label ] = get_diatom_ind( class2use, class2use );
[ ind_Gdel, class_label ] = get_G_delicatula_ind( class2use, class2use );

%find the time points when all diatoms were annotated
ind_total = find(~isnan(mean(ml_analyzed_mat_bin(:,ind_diatom),2)));

%cubic microns per mL
diatom_biovol_conc = sum(classbiovol_bin(ind_total,ind_diatom)./ml_analyzed_mat_bin(ind_total, ind_diatom),2); 
Gdel_biovol_conc = sum(classbiovol_bin(ind_total,ind_Gdel)./ml_analyzed_mat_bin(ind_total, ind_Gdel),2); 

ind_Gdel_par = strmatch('G_delicatula_parasite',class2use);
Gdel_par_biovol_conc = sum(classbiovol_bin(ind_total,ind_Gdel_par)./ml_analyzed_mat_bin(ind_total, ind_Gdel_par),2); 

[ mdate_mat, y_mat, yearlist, yd ] = timeseries2ydmat( matdate_bin(ind14), (classcount_bin(ind14,14)./ml_analyzed_mat_bin(ind14,14)));
Gdel_mat = y_mat;
[ mdate_mat, y_mat, yearlist, yd ] = timeseries2ydmat( matdate_bin(ind59), (classcount_bin(ind59,59)./ml_analyzed_mat_bin(ind59,59)));
Gdel_par_mat = y_mat;

%CREATEFIGURE(X1,Y1,X2,Y2,XDATA1,YDATA1)
 X1=   Tday(:);
 Y1= Gdel_par_mat(:)./(Gdel_mat(:)+Gdel_par_mat(:))*100;
 X2=  Gdel_mat(:);
 Y2=  Gdel_mat(:)+Gdel_par_mat(:);


%  Auto-generated by MATLAB on 17-Jul-2013 15:35:02

% Create figure
figure1 = figure;
set(gcf, 'units', 'inches')
set(gcf, 'position', [1 2 12.5 8], 'paperposition', [1 1 12.5 8]);

subplot2 = subplot(2,1,1,'Parent',figure1,...
   'YTickLabel',{'0', '40','80','120',},...
    'YTick', [0 40 80 120],...
    'XTicklabel', '',...
    'XGrid','off',...
    'FontSize',14,...
    'xlim', [0 21],...
    'ylim', [0 140],...
    'CLim',[0 1]);
% Uncomment the following line to preserve the X-limits of the axes

box(subplot2,'on');
hold(subplot2,'all');


% Create plot
plot(X1,Y2,'Parent',subplot2,'MarkerSize',10,'Marker','.','LineStyle','none',...
    'DisplayName','G. delicatula',...
    'Color',[0 0 1]);

hold on;

%plot(X1,X2,'Parent',subplot2,'MarkerSize',10,'Marker','.','LineStyle','none',...
 %   'DisplayName','G. delicatula',...
  %  'Color',[0 1 1]);


% Create line
line([5,5],[140,0],'Parent',subplot2,'LineWidth',2,'Color',[0 0 0], 'LineStyle', '--');


% Create ylabel
ylabel('Chains (mL^{-1})','FontSize',14);

% Create legend
%lh = legend('\itG. delicatula\rm', 'location', 'Northeast');
%set(lh, 'box', 'off');

% Create axes
subplot1 = subplot(2,1,2,'Parent',figure1,...
      'YTickLabel',{'0', '10','20','30',},...
    'YTick', [0 10 20 30],...
    'XTickLabel',{'0','2','4','6','8','10','12','14','16','18', '20', '22'},...
    'XTick',[0 2 4 6 8 10 12 14 16 18 20 22],...
    'XGrid','off',...
    'FontSize',14,...
    'xlim', [0 21],...
    'ylim', [0 40],...
    'CLim',[0 1]);
% Uncomment the following line to preserve the X-limits of the axes
 %xlim(subplot1,[0 21]);
shiftup = .08;
p = get(gca, 'position');
p(2) = p(2)+shiftup;
set(gca, 'position', p);
box(subplot1,'on');
hold(subplot1,'all');

text(19,34,'30%','FontSize', 12);
text(1,9,'5%','FontSize', 12);


% Create plot
plot(X1,Y1,'Parent',subplot1,'Marker','.','LineStyle','none','Color',[1 0 0],...
    'DisplayName','% infected G. delicatula');

% Create line
line([4.5,4.5],[140,0],'Parent',subplot1,'LineWidth',2,'Color',[0 0 0],  'LineStyle', '--');

% Create line
line([0,4.5],[4.5,4.5],'Parent',subplot1,'LineWidth',2,'Color',[.5 .5 .5]);

% Create line
line([4.5,22],[30,30],'Parent',subplot1,'LineWidth',2,'Color',[.5 .5 .5]);

% Create xlabel
xlabel('Temperature (\circC)','FontSize',14);

% Create ylabel
ylabel('Infected chains (%)','FontSize',14);

% Create legend
%lh = legend('% infected \itG. delicatula\rm', 'location', 'north');
%set(lh, 'box', 'off');

%**********************
% Create axes



% Create axes
%{
subplot3 = subplot(3,1,3,'Parent',figure1,...
   'YTickLabel',{'0', '40','80','120',},...
    'YTick', [0 40 80 120],...
    'XGrid','on',...
    'FontSize',14,...
    'ylim', [0 40],...
    'CLim',[0 1]);
%}
% Uncomment the following line to preserve the X-limits of the axes
%{
shiftup = .07;
p = get(gca, 'position');
p(2) = p(2)+shiftup;
set(gca, 'position', p);

box(subplot3,'on');
hold(subplot3,'all');


% Create plot
plot(Y2,Y1,'Parent',subplot3,'MarkerSize',10,'Marker','.','LineStyle','none',...
    'DisplayName','G. delicatula',...
    'Color',[0 0 1]);



% Create line
%line([5,5],[140,0],'Parent',subplot3,'LineWidth',2,'Color',[0 0 0], 'LineStyle', '--');


% Create ylabel
ylabel('Infected chains (mL^{-1})','FontSize',12);
xlabel('\itG. delicatula\rm chains (mL^{-1})','FontSize',12);

figure2 = figure;
set(gcf, 'units', 'inches')
set(gcf, 'position', [1 2 12.5 8], 'paperposition', [1 1 12.5 8]);

scatter3(X1, Y1, Y2);
%}
% Create legend
%lh = legend('\itG. delicatula\rm', 'location', 'Northeast');
%set(lh, 'box', 'off');

