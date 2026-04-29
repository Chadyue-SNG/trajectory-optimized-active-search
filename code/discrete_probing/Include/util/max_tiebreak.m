function [maxval, maxind] = max_tiebreak(vector, feasible_indicator, warningOn)

if nargin<2
   feasible_indicator = [];
end

if ~isempty(feasible_indicator)
  if sum(feasible_indicator) > 1, 
    feasible_inds = find(feasible_indicator);
    perm_inds = feasible_inds(randperm(numel(feasible_inds)));
  else
    perm_inds = find(feasible_indicator);
  end

else
  
  perm_inds = randperm(length(vector));
end

vector_permuted = vector(perm_inds);

[maxval, permuted_max_ind] = max(vector_permuted);

if nargin<3
   warningOn = false;
end

if warningOn && sum(vector_permuted == maxval)>1
  warning('WarnAlgorithm:tiebreakHappen', ...
    sprintf('tie break happened! tie for %d counts.', ...
    sum(vector_permuted == maxval)));
end

maxind = perm_inds(permuted_max_ind); 
