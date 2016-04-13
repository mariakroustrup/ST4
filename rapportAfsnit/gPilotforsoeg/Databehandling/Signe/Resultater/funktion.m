

function [degree] = funktiong(voltage)
% offset = 1.666096042628035 %Volt offset to 0 degree
% if voltage < spænding(0grader) && voltage >= spænding(20grader)
%     output1=0+(20-0)*((voltage-spænding(0grader)/(spænding(20grader)-spænding(0grader))
if voltage < 0.231119335381125 && voltage >=  0.210325757388038
    degree=0+(20-0)*((voltage-0.231119335381125)/(0.210325757388038-0.231119335381125))
    disp('1')
elseif voltage < 0.210325757388038 && voltage >= 0.158456454773556
    degree=20+(40-20)*((voltage-0.210325757388038)/(0.158456454773556-0.210325757388038))
    disp('2')
elseif voltage < 0.158456454773556 && voltage >= 0.082970824298725
    degree=40+(60-40)*((voltage-0.158456454773556)/(0.082970824298725-0.158456454773556))
    disp('3')
elseif voltage < 0.082970824298725 && voltage >= -0.008951974175536
    degree=60+(80-60)*((voltage-0.082970824298725)/(-0.008951974175536-0.082970824298725))
    disp('4')
elseif voltage < -0.008951974175536 && voltage >= -0.058900380219719
    degree=80+(90-80)*((voltage--0.008951974175536)/(-0.058900380219719--0.008951974175536))
    disp('5')
else 
    disp('NO')
end 

