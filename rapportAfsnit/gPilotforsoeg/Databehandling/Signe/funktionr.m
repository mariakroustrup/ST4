
function [degreer] = funktionr(voltage)
% offset = 1.666096042628035 %Volt offset to 0 degree
% if voltage < spænding(0grader) && voltage >= spænding(20grader)
%     output1=0+(20-0)*((voltage-spænding(0grader)/(spænding(20grader)-spænding(0grader))
if voltage <= 0 && voltage >= -0.019728677772420
    degreer=0+(20-0)*((voltage-0)/(-0.019728677772420-(0)))
    disp('1')
elseif voltage <= -0.019728677772420 && voltage >= -0.066090051494345
    degreer=20+(40-20)*((voltage--0.019728677772420)/(-0.066090051494345--0.019728677772420))
    disp('2')
elseif voltage <= -0.066090051494345 && voltage >= -0.138108387231511
    degreer=40+(60-40)*((voltage--0.066090051494345)/(-0.138108387231511--0.066090051494345))
    disp('3')
elseif voltage <= -0.138108387231511 && voltage >= -0.229205760654350
    degreer=60+(80-60)*((voltage--0.138108387231511)/(-0.229205760654350--0.138108387231511))
    disp('4')
elseif voltage <= -0.229205760654350 && voltage >= -0.282460962120614
    degreer=80+(90-80)*((voltage--0.229205760654350)/(-0.282460962120614--0.229205760654350))
    disp('5')
else 
    disp('NO')
end 



