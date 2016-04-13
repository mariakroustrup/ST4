
function [degree] = funktion(voltage)
% offset = 1.666096042628035 %Volt offset to 0 degree
% if voltage < spænding(0grader) && voltage >= spænding(20grader)
%     output1=0+(20-0)*((voltage-spænding(0grader)/(spænding(20grader)-spænding(0grader))
if voltage <= 0.314219445735192 && voltage >=  0.229098761110675
    degree=90+(80-90)*((voltage-0.314219445735192)/(0.229098761110675-0.314219445735192))
    disp('1')
elseif voltage <= 0.229098761110675 && voltage >= 0.138750384493757
    degree=80+(60-80)*((voltage-0.229098761110675)/(0.138750384493757-0.229098761110675))
    disp('2')
elseif voltage <= 0.138750384493757 && voltage >= 0.064823890227214
    degree=60+(40-60)*((voltage-0.138750384493757)/(0.064823890227214-0.138750384493757))
    disp('3')
elseif voltage <= 0.064823890227214 && voltage >= 0.017741543389376
    degree=40+(20-40)*((voltage-0.064823890227214)/(0.017741543389376-0.064823890227214))
    disp('4')
elseif voltage <= 0.017741543389376 && voltage >= 0
    degree=20+(0-20)*((voltage-0.017741543389376)/(0-0.017741543389376))
    disp('5')
else 
    disp('NO')
end 

