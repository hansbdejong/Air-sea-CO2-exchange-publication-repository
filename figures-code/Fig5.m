% Plots Figure 5
% I really should have written functions for this...next time...

% loads data
cd('C:\TNB')
HC99 = xlsread('HC099.xlsx');
HC100 = xlsread('HC100.xlsx');
HC101 = xlsread('HC101.xlsx');
HC102 = xlsread('HC102.xlsx');
station99 = xlsread('1.dNBP1302099.xlsx');
station100 = xlsread('1.dNBP1302100.xlsx');
station101 = xlsread('1.dNBP1302101.xlsx');
station102 = xlsread('1.dNBP1302102.xlsx');

cd('C:\South')
HC107 = xlsread('HC107.xlsx');
HC108 = xlsread('HC108.xlsx');
HC110 = xlsread('HC110.xlsx');
HC113 = xlsread('HC113.xlsx');
HC115 = xlsread('HC115.xlsx');
station107 = xlsread('1.dNBP1302107.xlsx');
station108 = xlsread('1.dNBP1302108.xlsx');
station110 = xlsread('1.dNBP1302110.xlsx');
station113 = xlsread('1.dNBP1302113.xlsx');
station115 = xlsread('1.dNBP1302115.xlsx');

cd('C:\North')
HC103 = xlsread('HC103.xlsx');
HC104 = xlsread('HC104.xlsx');
HC106 = xlsread('HC106.xlsx');
station103 = xlsread('1.dNBP1302103.xlsx');
station104 = xlsread('1.dNBP1302104.xlsx');
station106 = xlsread('1.dNBP1302106.xlsx');

cd('C:\Transect')
HC118 = xlsread('HC118.xlsx');
HC119 = xlsread('HC119.xlsx');
HC120 = xlsread('HC120.xlsx');
HC121 = xlsread('HC121.xlsx');
HC122 = xlsread('HC122.xlsx');
HC123 = xlsread('HC123.xlsx');
HC124 = xlsread('HC124.xlsx');
HC125 = xlsread('HC125.xlsx');
HC127 = xlsread('HC127.xlsx');
HC128 = xlsread('HC128.xlsx');
HC130 = xlsread('HC130.xlsx');
station118 = xlsread('1.dNBP1302118.xlsx');
station119 = xlsread('1.dNBP1302119.xlsx');
station120 = xlsread('1.dNBP1302120.xlsx');
station121 = xlsread('1.dNBP1302121.xlsx');
station122 = xlsread('1.dNBP1302122.xlsx');
station123 = xlsread('1.dNBP1302123.xlsx');
station124 = xlsread('1.dNBP1302124.xlsx');
station125 = xlsread('1.dNBP1302125.xlsx');
station127 = xlsread('1.dNBP1302127.xlsx');
station128 = xlsread('1.dNBP1302128.xlsx');
station130 = xlsread('1.dNBP1302130.xlsx');

%##########################################################################
% plots series of graphs


% change as appropriate
cd('C:\')
ha  =  tight_subplot(4,3,[.02 .02],[.03 .1],[.25 .25]); 
% [gap_h gap_w], marg_h:[lower upper]; marg_w:[left right]

%##########################################################################
% DIC plot 1
axes(ha(1))
HC99DIC = HC99(:,10);
HC99Depth = HC99(:,6);
HC99Depth(isnan(HC99DIC)) = [];
HC99DIC(isnan(HC99DIC)) = [];
plot(HC99DIC,HC99Depth,'k', 'linewidth', 0.5)
hold on

HC100DIC = HC100(:,10);
HC100Depth = HC100(:,6);
HC100Depth(isnan(HC100DIC)) = [];
HC100DIC(isnan(HC100DIC)) = [];
plot(HC100DIC,HC100Depth,'k', 'linewidth', 0.5)
hold on

HC101DIC = HC101(:,10);
HC101Depth = HC101(:,6);
HC101Depth(isnan(HC101DIC)) = [];
HC101DIC(isnan(HC101DIC)) = [];
plot(HC101DIC,HC101Depth,'k', 'linewidth', 0.5)
hold on

HC102DIC = HC102(:,10);
HC102Depth = HC102(:,6);
HC102Depth(isnan(HC102DIC)) = [];
HC102DIC(isnan(HC102DIC)) = [];
plot(HC102DIC,HC102Depth,'k', 'linewidth', 0.5)

text(2235, 30, '(a)', 'fontsize',10)
text(2120, 250, 'TNB', 'fontsize', 15)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([2100 2250])
ylabel('Depth [m]', 'fontsize',10)
xlabel('sDIC [\mumol kg^{-1}]','fontsize',10)
set(gca, 'YtickLabel', {'0', '100', '200', ''})
box on

%##########################################################################
% DIC plot 2
axes(ha(4))
HC103DIC = HC103(:,10);
HC103Depth = HC103(:,6);
HC103Depth(isnan(HC103DIC)) = [];
HC103DIC(isnan(HC103DIC)) = [];
plot(HC103DIC,HC103Depth,'k', 'linewidth', 0.5)
hold on

HC104DIC = HC104(:,10);
HC104Depth = HC104(:,6);
HC104Depth(isnan(HC104DIC)) = [];
HC104DIC(isnan(HC104DIC)) = [];
plot(HC104DIC,HC104Depth,'k', 'linewidth', 0.5)
hold on

HC106DIC = HC106(:,10);
HC106Depth = HC106(:,6);
HC106Depth(isnan(HC106DIC)) = [];
HC106DIC(isnan(HC106DIC)) = [];
plot(HC106DIC,HC106Depth,'k', 'linewidth', 0.5)

text(2235, 30, '(d)', 'fontsize',10)
text(2120, 250, 'North', 'fontsize', 15)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([2100 2250])
ylabel('Depth [m]', 'fontsize',10)
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', {'0', '100', '200', ''})
box on

%##########################################################################
% DIC plot 3

axes(ha(7))
HC107DIC = HC107(:,10);
HC107Depth = HC107(:,6);
HC107Depth(isnan(HC107DIC)) = [];
HC107DIC(isnan(HC107DIC)) = [];
plot(HC107DIC,HC107Depth,'k', 'linewidth', 0.5)
hold on

HC108DIC = HC108(:,10);
HC108Depth = HC108(:,6);
HC108Depth(isnan(HC108DIC)) = [];
HC108DIC(isnan(HC108DIC)) = [];
plot(HC108DIC,HC108Depth,'k', 'linewidth', 0.5)
hold on

HC110DIC = HC110(:,10);
HC110Depth = HC110(:,6);
HC110Depth(isnan(HC110DIC)) = [];
HC110DIC(isnan(HC110DIC)) = [];
plot(HC110DIC,HC110Depth,'k', 'linewidth', 0.5)
hold on

HC113DIC = HC113(:,10);
HC113Depth = HC113(:,6);
HC113Depth(isnan(HC113DIC)) = [];
HC113DIC(isnan(HC113DIC)) = [];
plot(HC113DIC,HC113Depth,'k', 'linewidth', 0.5)
hold on

HC115DIC = HC115(:,10);
HC115Depth = HC115(:,6);
HC115Depth(isnan(HC115DIC)) = [];
HC115DIC(isnan(HC115DIC)) = [];
plot(HC115DIC,HC115Depth,'k', 'linewidth', 0.5)

text(2235, 30, '(g)', 'fontsize',10)
text(2120, 250, 'South', 'fontsize', 15)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([2100 2250])
ylabel('Depth [m]', 'fontsize',10)
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', {'0', '100', '200', ''})
box on

%##########################################################################
% DIC plot 4

axes(ha(10))
HC118DIC = HC118(:,10);
HC118Depth = HC118(:,6);
HC118Depth(isnan(HC118DIC)) = [];
HC118DIC(isnan(HC118DIC)) = [];
plot(HC118DIC,HC118Depth,'k', 'linewidth', 0.5)
hold on

HC119DIC = HC119(:,10);
HC119Depth = HC119(:,6);
HC119Depth(isnan(HC119DIC)) = [];
HC119DIC(isnan(HC119DIC)) = [];
plot(HC119DIC,HC119Depth,'k', 'linewidth', 0.5)
hold on

HC120DIC = HC120(:,10);
HC120Depth = HC120(:,6);
HC120Depth(isnan(HC120DIC)) = [];
HC120DIC(isnan(HC120DIC)) = [];
plot(HC120DIC,HC120Depth,'k', 'linewidth', 0.5)
hold on

HC121DIC = HC121(:,10);
HC121Depth = HC121(:,6);
HC121Depth(isnan(HC121DIC)) = [];
HC121DIC(isnan(HC121DIC)) = [];
plot(HC121DIC,HC121Depth,'k', 'linewidth', 0.5)
hold on

HC122DIC = HC122(:,10);
HC122Depth = HC122(:,6);
HC122Depth(isnan(HC122DIC)) = [];
HC122DIC(isnan(HC122DIC)) = [];
plot(HC122DIC,HC122Depth,'k', 'linewidth', 0.5)
hold on

HC123DIC = HC123(:,10);
HC123Depth = HC123(:,6);
HC123Depth(isnan(HC123DIC)) = [];
HC123DIC(isnan(HC123DIC)) = [];
plot(HC123DIC,HC123Depth,'k', 'linewidth', 0.5)
hold on

HC124DIC = HC124(:,10);
HC124Depth = HC124(:,6);
HC124Depth(isnan(HC124DIC)) = [];
HC124DIC(isnan(HC124DIC)) = [];
plot(HC124DIC,HC124Depth,'k', 'linewidth', 0.5)
hold on

HC125DIC = HC125(:,10);
HC125Depth = HC125(:,6);
HC125Depth(isnan(HC125DIC)) = [];
HC125DIC(isnan(HC125DIC)) = [];
plot(HC125DIC,HC125Depth,'k', 'linewidth', 0.5)
hold on

HC127DIC = HC127(:,10);
HC127Depth = HC127(:,6);
HC127Depth(isnan(HC127DIC)) = [];
HC127DIC(isnan(HC127DIC)) = [];
plot(HC127DIC,HC127Depth,'k', 'linewidth', 0.5)
hold on

HC128DIC = HC128(:,10);
HC128Depth = HC128(:,6);
HC128Depth(isnan(HC128DIC)) = [];
HC128DIC(isnan(HC128DIC)) = [];
plot(HC128DIC,HC128Depth,'k', 'linewidth', 0.5)
hold on

HC130DIC = HC130(:,10);
HC130Depth = HC130(:,6);
HC130Depth(isnan(HC130DIC)) = [];
HC130DIC(isnan(HC130DIC)) = [];
plot(HC130DIC,HC130Depth,'k', 'linewidth', 0.5)

text(2235, 30, '(j)', 'fontsize',10)
text(2120, 250, 'Transect', 'fontsize', 15)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([2100 2250])
ylabel('Depth [m]', 'fontsize',10)
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', {'0', '100', '200', ''})
box on

%##########################################################################
% nitrate plot 1

axes(ha(2))
HC99N_N = HC99(:,19);
HC99Depth = HC99(:,6);
HC99Depth(isnan(HC99N_N)) = [];
HC99N_N(isnan(HC99N_N)) = [];
plot(HC99N_N,HC99Depth,'k', 'linewidth', 0.5)
hold on

HC100N_N = HC100(:,19);
HC100Depth = HC100(:,6);
HC100Depth(isnan(HC100N_N)) = [];
HC100N_N(isnan(HC100N_N)) = [];
plot(HC100N_N,HC100Depth,'k', 'linewidth', 0.5)
hold on

HC101N_N = HC101(:,19);
HC101Depth = HC101(:,6);
HC101Depth(isnan(HC101N_N)) = [];
HC101N_N(isnan(HC101N_N)) = [];
plot(HC101N_N,HC101Depth,'k', 'linewidth', 0.5)
hold on

HC102N_N = HC102(:,19);
HC102Depth = HC102(:,6);
HC102Depth(isnan(HC102N_N)) = [];
HC102N_N(isnan(HC102N_N)) = [];
plot(HC102N_N,HC102Depth,'k', 'linewidth', 0.5)

text(37.1, 30, '(b)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([11 40])
xlabel('sN+N [\mumol kg^{-1}]','fontsize',10)
set(gca, 'YtickLabel', '')
box on


%##########################################################################
% nitrate plot 2

axes(ha(5))
HC103N_N = HC103(:,19);
HC103Depth = HC103(:,6);
HC103Depth(isnan(HC103N_N)) = [];
HC103N_N(isnan(HC103N_N)) = [];
plot(HC103N_N,HC103Depth,'k', 'linewidth', 0.5)
hold on

HC104N_N = HC104(:,19);
HC104Depth = HC104(:,6);
HC104Depth(isnan(HC104N_N)) = [];
HC104N_N(isnan(HC104N_N)) = [];
plot(HC104N_N,HC104Depth,'k', 'linewidth', 0.5)
hold on

HC106N_N = HC106(:,19);
HC106Depth = HC106(:,6);
HC106Depth(isnan(HC106N_N)) = [];
HC106N_N(isnan(HC106N_N)) = [];
plot(HC106N_N,HC106Depth,'k', 'linewidth', 0.5)

text(37.1, 30, '(e)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([11 40])
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', '')
box on

%##########################################################################
% nitrate plot 3

axes(ha(8))
HC107N_N = HC107(:,19);
HC107Depth = HC107(:,6);
HC107Depth(isnan(HC107N_N)) = [];
HC107N_N(isnan(HC107N_N)) = [];
plot(HC107N_N,HC107Depth,'k', 'linewidth', 0.5)
hold on

HC108N_N = HC108(:,19);
HC108Depth = HC108(:,6);
HC108Depth(isnan(HC108N_N)) = [];
HC108N_N(isnan(HC108N_N)) = [];
plot(HC108N_N,HC108Depth,'k', 'linewidth', 0.5)
hold on

HC110N_N = HC110(:,19);
HC110Depth = HC110(:,6);
HC110Depth(isnan(HC110N_N)) = [];
HC110N_N(isnan(HC110N_N)) = [];
plot(HC110N_N,HC110Depth,'k', 'linewidth', 0.5)
hold on

HC113N_N = HC113(:,19);
HC113Depth = HC113(:,6);
HC113Depth(isnan(HC113N_N)) = [];
HC113N_N(isnan(HC113N_N)) = [];
plot(HC113N_N,HC113Depth,'k', 'linewidth', 0.5)
hold on

HC115N_N = HC115(:,19);
HC115Depth = HC115(:,6);
HC115Depth(isnan(HC115N_N)) = [];
HC115N_N(isnan(HC115N_N)) = [];
plot(HC115N_N,HC115Depth,'k', 'linewidth', 0.5)

text(37.1, 30, '(h)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([11 40])
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', '')
box on

%##########################################################################
% nitrate plot 4

axes(ha(11))
HC118N_N = HC118(:,19);
HC118Depth = HC118(:,6);
HC118Depth(isnan(HC118N_N)) = [];
HC118N_N(isnan(HC118N_N)) = [];
plot(HC118N_N,HC118Depth,'k', 'linewidth', 0.5)
hold on

HC119N_N = HC119(:,19);
HC119Depth = HC119(:,6);
HC119Depth(isnan(HC119N_N)) = [];
HC119N_N(isnan(HC119N_N)) = [];
plot(HC119N_N,HC119Depth,'k', 'linewidth', 0.5)
hold on

HC120N_N = HC120(:,19);
HC120Depth = HC120(:,6);
HC120Depth(isnan(HC120N_N)) = [];
HC120N_N(isnan(HC120N_N)) = [];
plot(HC120N_N,HC120Depth,'k', 'linewidth', 0.5)
hold on

HC121N_N = HC121(:,19);
HC121Depth = HC121(:,6);
HC121Depth(isnan(HC121N_N)) = [];
HC121N_N(isnan(HC121N_N)) = [];
plot(HC121N_N,HC121Depth,'k', 'linewidth', 0.5)
hold on

HC122N_N = HC122(:,19);
HC122Depth = HC122(:,6);
HC122Depth(isnan(HC122N_N)) = [];
HC122N_N(isnan(HC122N_N)) = [];
plot(HC122N_N,HC122Depth,'k', 'linewidth', 0.5)
hold on

HC123N_N = HC123(:,19);
HC123Depth = HC123(:,6);
HC123Depth(isnan(HC123N_N)) = [];
HC123N_N(isnan(HC123N_N)) = [];
plot(HC123N_N,HC123Depth,'k', 'linewidth', 0.5)
hold on

HC124N_N = HC124(:,19);
HC124Depth = HC124(:,6);
HC124Depth(isnan(HC124N_N)) = [];
HC124N_N(isnan(HC124N_N)) = [];
plot(HC124N_N,HC124Depth,'k', 'linewidth', 0.5)
hold on

HC125N_N = HC125(:,19);
HC125Depth = HC125(:,6);
HC125Depth(isnan(HC125N_N)) = [];
HC125N_N(isnan(HC125N_N)) = [];
plot(HC125N_N,HC125Depth,'k', 'linewidth', 0.5)
hold on

HC127N_N = HC127(:,19);
HC127Depth = HC127(:,6);
HC127Depth(isnan(HC127N_N)) = [];
HC127N_N(isnan(HC127N_N)) = [];
plot(HC127N_N,HC127Depth,'k', 'linewidth', 0.5)
hold on

HC128N_N = HC128(:,19);
HC128Depth = HC128(:,6);
HC128Depth(isnan(HC128N_N)) = [];
HC128N_N(isnan(HC128N_N)) = [];
plot(HC128N_N,HC128Depth,'k', 'linewidth', 0.5)
hold on

HC130N_N = HC130(:,19);
HC130Depth = HC130(:,6);
HC130Depth(isnan(HC130N_N)) = [];
HC130N_N(isnan(HC130N_N)) = [];
plot(HC130N_N,HC130Depth,'k', 'linewidth', 0.5)

text(37.1, 30, '(k)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([11 40])
set(gca,'XTickLabel','')
set(gca, 'YtickLabel', '')
box on

%##########################################################################
% density plot 1

axes(ha(3))
plot(station99(:,22),station99(:,6),'k', 'linewidth', 0.5)
hold on
plot(station100(:,22),station100(:,6),'k', 'linewidth', 0.5)
hold on
plot(station101(:,22),station101(:,6),'k', 'linewidth', 0.5)
hold on
plot(station102(:,22),station102(:,6),'k', 'linewidth', 0.5)

text(27.88, 30, '(c)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([26.8 28])
xlabel('\sigma_{t} [kg m^{-3}]','fontsize',10)
set(gca, 'YtickLabel', '')
box on

%##########################################################################
% density plot 2

axes(ha(6))
plot(station103(:,22),station103(:,6),'k', 'linewidth', 0.5)
hold on
plot(station104(:,22),station104(:,6),'k', 'linewidth', 0.5)
hold on
plot(station106(:,22),station106(:,6),'k', 'linewidth', 0.5)

text(27.88, 30, '(f)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([26.8 28])
set(gca, 'YtickLabel', '')
set(gca, 'XtickLabel', '')
box on


%##########################################################################
% density plot 3

axes(ha(9))
plot(station107(:,22),station107(:,6),'k', 'linewidth', 0.5)
hold on
plot(station108(:,22),station108(:,6),'k', 'linewidth', 0.5)
hold on
plot(station110(:,22),station110(:,6),'k', 'linewidth', 0.5)
hold on
plot(station113(:,22),station113(:,6),'k', 'linewidth', 0.5)
hold on
plot(station115(:,22),station115(:,6),'k', 'linewidth', 0.5)

text(27.88, 30, '(i)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([26.8 28])
set(gca, 'YtickLabel', '')
set(gca, 'XtickLabel', '')
box on

%##########################################################################
% density plot 4

axes(ha(12))
plot(station119(:,22),station119(:,6),'k', 'linewidth', 0.5)
hold on
plot(station120(:,22),station120(:,6),'k', 'linewidth', 0.5)
hold on
plot(station121(:,22),station121(:,6),'k', 'linewidth', 0.5)
hold on
plot(station122(:,22),station122(:,6),'k', 'linewidth', 0.5)
hold on
plot(station123(:,22),station123(:,6),'k', 'linewidth', 0.5)
hold on
plot(station124(:,22),station124(:,6),'k', 'linewidth', 0.5)
hold on
plot(station125(:,22),station125(:,6),'k', 'linewidth', 0.5)
hold on
plot(station127(:,22),station127(:,6),'k', 'linewidth', 0.5)
hold on
plot(station128(:,22),station128(:,6),'k', 'linewidth', 0.5)
hold on
plot(station130(:,22),station130(:,6),'k', 'linewidth', 0.5)

text(27.88, 30, '(l)', 'fontsize',10)

set(gca,'YDir','Reverse','XAxisLocation','top', 'fontsize',10)
ylim([0 300])
xlim([26.8 28])
set(gca, 'YtickLabel', '')
set(gca, 'XtickLabel', '')
box on
