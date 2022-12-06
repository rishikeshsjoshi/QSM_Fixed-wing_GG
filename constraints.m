function [c, ceq] = constraints(i,inputs)
  
  global outputs
   
  %% Min clearance between ground and bottom point of pattern
  c(1)   = inputs.minGroundClear - outputs.H_minPatt(i) + outputs.pattRadius(i); 
  
  %% Capping for max. reel-out electrical power
  c(2)   = max(outputs.PROeff_elec_osci(i,:)) - inputs.F_peakElecP*inputs.P_ratedElec; 
  
  %% Capping for requested electrical rated power
  c(3)   = outputs.P_cycleElec(i) - inputs.P_ratedElec; 
  
  %% Min required radius to turn
  c(4)   = outputs.wingSpan/2 - outputs.pattRadius(i);
  
  %% Avg. patt. elevation > patt. angular radius
  c(5)   = outputs.pattAngRadius(i) - outputs.avgPattEle(i);
  
  %% Required argument
  ceq    = outputs.rollAngleC(i) - outputs.rollAngleG(i);
 
end