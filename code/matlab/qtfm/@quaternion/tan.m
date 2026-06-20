function Y = tan(X)
% TAN    Tangent.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

Y = sin(X) ./ cos(X);

end

% Note. This may not be the best way to implement tan,
% but it has the merit of simplicity and will work for
% all cases for which sin and cos work.

% $Id: tan.m 1090 2020-06-15 17:17:19Z sangwine $
