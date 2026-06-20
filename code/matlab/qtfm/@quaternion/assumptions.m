function assumptions(var)
% ASSUMPTIONS  List assumptions that apply to components of quaternion.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 0)

if ~isa(var, 'quaternion') || ~isa(var.x, 'sym')
    error('First argument must be a quaternion with symbolic components.')
end

overload(mfilename, var);

end

% $Id: assumptions.m 1096 2020-06-26 16:05:23Z sangwine $
