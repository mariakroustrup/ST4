function [fitresult, gof] = createFits(grader, groenX, groenY, groenZ, roedX, roedY1, roedZ)
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

%  Auto-generated by MATLAB on 12-Apr-2016 11:51:51

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 6, 1 );
gof = struct( 'sse', cell( 6, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'Gr�n - x'.
[xData, yData] = prepareCurveData( grader, groenX );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Gr�n - x' );
plot( fitresult{1}, xData, yData );
xlabel grader
ylabel groenX
grid off

%% Fit: 'Gr�n - y'.
[xData, yData] = prepareCurveData( grader, groenY );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Gr�n - y' );
plot( fitresult{2}, xData, yData );
xlabel grader
ylabel groenY
grid off

%% Fit: 'Gr�n - z'.
[xData, yData] = prepareCurveData( grader, groenZ );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Gr�n - z' );
plot( fitresult{3}, xData, yData );
xlabel grader
ylabel groenZ
grid off

%% Fit: 'R�d - x'.
[xData, yData] = prepareCurveData( grader, roedX );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'R�d - x' );
plot( fitresult{4}, xData, yData );
xlabel grader
ylabel roedX
grid off

%% Fit: 'R�d - y'.
[xData, yData] = prepareCurveData( grader, roedY1 );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'R�d - y' );
plot( fitresult{5}, xData, yData );
xlabel grader
ylabel roedY1
grid off

%% Fit: 'R�d - z'.
[xData, yData] = prepareCurveData( grader, roedZ );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'R�d - z' );
plot( fitresult{6}, xData, yData );
xlabel grader
ylabel roedZ
grid off


%% 
figure
subplot(3,2,1)
%figure( 'Name', 'Gr�n - x' );
plot( fitresult{1}, xData, yData );
xlabel grader
ylabel groenX
grid off

subplot(3,2,3)
%figure( 'Name', 'Gr�n - y' );
plot( fitresult{2}, xData, yData );
xlabel grader
ylabel groenY
grid off

subplot(3,2,5)
%figure( 'Name', 'Gr�n - z' );
plot( fitresult{3}, xData, yData );
xlabel grader
ylabel groenZ
grid off

subplot(3,2,2)
%figure( 'Name', 'R�d - x' );
plot( fitresult{4}, xData, yData );
xlabel grader
ylabel roedX
grid off

subplot(3,2,4)
%figure( 'Name', 'R�d - y' );
plot( fitresult{5}, xData, yData );
xlabel grader
ylabel roedY1
grid off

subplot(3,2,6)
%figure( 'Name', 'R�d - z' );
plot( fitresult{6}, xData, yData );
xlabel grader
ylabel roedZ
grid off