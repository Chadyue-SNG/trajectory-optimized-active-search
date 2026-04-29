function y = normpdf(x, mu, sigma)
%NORMPDF Normal probability density function without Octave statistics pkg.

if nargin < 2
  mu = 0;
end
if nargin < 3
  sigma = 1;
end

z = (x - mu) ./ sigma;
y = exp(-0.5 .* z .^ 2) ./ (sqrt(2*pi) .* sigma);
y(sigma <= 0) = NaN;

end
