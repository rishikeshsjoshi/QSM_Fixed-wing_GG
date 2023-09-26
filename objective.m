function [fval,inputs,outputs] = objective(x,x_init,i,inputs)

    global outputs
  
    % Denormalize x
    x = x.*x_init;
    
    % Assign variable values
    outputs.deltaL(i)                               = x(1);
    outputs.beta(i)                                 = x(2);
    outputs.gamma(i)                                = x(3);
    outputs.Rp_start(i)                             = x(4);
    outputs.vk_r_i(i,1:inputs.numDeltaLelems)       = x(0*inputs.numDeltaLelems+5:1*inputs.numDeltaLelems+4);
    outputs.CL_i(i,1:inputs.numDeltaLelems)         = x(1*inputs.numDeltaLelems+5:2*inputs.numDeltaLelems+4);
    outputs.vk_r(i,1:inputs.numDeltaLelems)         = x(2*inputs.numDeltaLelems+5:3*inputs.numDeltaLelems+4);
    outputs.kRatio(i,1:inputs.numDeltaLelems)       = x(3*inputs.numDeltaLelems+5:4*inputs.numDeltaLelems+4);
    outputs.CL(i,1:inputs.numDeltaLelems)           = x(4*inputs.numDeltaLelems+5:5*inputs.numDeltaLelems+4);
   
    % Main computation
    [inputs]  = compute(i,inputs);
    
    % Objective
    fval = - outputs.P_e_avg(i)/inputs.P_ratedElec/1000;

    % fval = - outputs.P_m_o(i)/inputs.P_ratedElec/10000;
        
end                    