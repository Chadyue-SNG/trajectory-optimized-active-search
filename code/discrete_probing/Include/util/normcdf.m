function p = normcdf(x, mu, sigma)
%NORMCDF Normal cumulative distribution function.
%   Lightweight implementation for Octave installations without the
%   statistics package. Supports scalar expansion through elementwise ops.

if nargin < 2 || isempty(mu)
  mu = 0;
end
if nargin < 3 || isempty(sigma)
  sigma = 1;
end

if any(sigma(:) <= 0)
  error('normcdf: sigma must be positive');
end

z = (x - mu) ./ sigma;
p = 0.5 * erfc(-z ./ sqrt(2));

end
