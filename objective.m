function [fval,inputs,outputs] = objective(x,x_init,i,inputs)

    global outputs
  
    % Denormalize x
    x = x.*x_init;
    
    % Assign variable values
    outputs.deltaL(i)        = x(1);
    outputs.VRI(i)           = x(2);
    outputs.CL(i)            = x(3);
    outputs.avgPattEle(i)    = x(4);
    outputs.pattAngRadius(i) = x(5);
    outputs.maxRollAngle(i)  = x(6);

    % Main computation
    [inputs]  = compute(i,inputs);
    
    % Objective
    fval = -outputs.P_cycleElec(i);
    
end                    