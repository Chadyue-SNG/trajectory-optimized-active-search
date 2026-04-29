function x = norminv(p, mu, sigma)
%NORMINV Normal inverse cumulative distribution function.
%   Small compatibility helper for Octave installations without the
%   statistics package.

if nargin < 2
  mu = 0;
end

if nargin < 3
  sigma = 1;
end

x = mu - sqrt(2) .* sigma .* erfcinv(2 .* p);
x(p < 0 | p > 1 | sigma < 0) = NaN;
x(p == 0 & sigma >= 0) = -Inf;
x(p == 1 & sigma >= 0) = Inf;

end
