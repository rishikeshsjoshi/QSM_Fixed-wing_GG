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
    outputs.pattRadius(i)    = x(6);
    %outputs.maxRollAngle(i)  = x(6);

    % Main computation
    [inputs]  = compute(i,inputs);
    
    % Objective
%     if round(outputs.P_cycleElec(i),1) == inputs.P_ratedElec
%       fval = - outputs.PRO_mech(i) + outputs.P_cycleElec(i);
%     else
      fval = - outputs.P_cycleElec(i);
%     end
    
end                    