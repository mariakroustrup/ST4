% For at dette script kan k�res, s� skal de script under det gr�nne og r�de
% mapper k�res. databehandling_groen og databehandling_roed

function [fitresult, gof] = createFits(grader, groenX, groenY, groenZ, roedX, roedY1, roedZ);
%CREATEFITS(GRADER,GROENX,GROENY,GROENZ,ROEDX,ROEDY1,ROEDZ)
%  Create fits.
%
%  Data for 'Gr�n - x' fit:
%      X Input : grader
%      Y Output: groenX
%  Data for 'Gr�n - y' fit:
%      X Input : grader
%      Y Output: groenY
%  Data for 'Gr�n - z' fit:
%      X Input : grader
%      Y Output: groenZ
%  Data for 'R�d - x' fit:
%      X Input : grader
%      Y Output: roedX
%  Data for 'R�d - y' fit:
%      X Input : grader
%      Y Output: roedY1
%  Data for 'R�d - z' fit:
%      X Input : grader
%      Y Output: roedZ
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 12-Apr-2016 10:57:13

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 6, 1 );
gof = struct( 'sse', cell( 6, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Gr�n - x'.
[xData1, yData1] = prepareCurveData( grader, groenX );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData1, yData1, ft );

%% Fit: 'Gr�n - y'.
[xData2, yData2] = prepareCurveData( grader, groenY );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData2, yData2, ft );


%% Fit: 'Gr�n - z'.
[xData3, yData3] = prepareCurveData( grader, groenZ );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData3, yData3, ft );

%% Fit: 'R�d - x'.
[xData4, yData4] = prepareCurveData( grader, flip(roedX) );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData4, yData4, ft );

%% Fit: 'R�d - y'.
[xData5, yData5] = prepareCurveData( grader, flip(roedY1) );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData5, yData5, ft );

%% Fit: 'R�d - z'.
[xData6, yData6] = prepareCurveData( grader, roedZ );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData6, yData6, ft );

%% Plot alle 
figure
subplot(2,3,1)
plot( fitresult{1}, xData1, yData1 );
text(100,1.8,'R^2 = 0,9804','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]'); 
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� tibia:'; 'X-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off

subplot(2,3,2)
plot( fitresult{2}, xData2, yData2 );
text(100,1.8,'R^2 = 0,9800','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]');  
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� tibia:'; 'Y-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off

subplot(2,3,3)
plot( fitresult{3}, xData3, yData3 );
text(100,1.8,'R^2 = 0,9812','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]'); 
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� tibia:'; 'Z-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off

subplot(2,3,4)
plot( fitresult{4}, xData4, yData4 );
text(100,1.8,'R^2 = 0,9806','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]'); 
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� femur:';'X-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off

subplot(2,3,5)
plot( fitresult{5}, xData5, yData5 );
text(100,1.8,'R^2 = 0,9790','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]');  
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� femur:';'Y-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off

subplot(2,3,6)
plot( fitresult{6}, xData6, yData6 );
text(100,1.8,'R^2 = 0,9791','FontSize',20)
xlabel('Kn�ets vinkel [{\circ}]'); 
ylabel('Accelerometer [V]');
ylim([1.2 2.01])
set(gca, 'XTick', [0:50:200])
title({'Accelerometer p� femur:';'Z-akse'});
set(gca,'fontsize',20);
legend off
box off
grid off


