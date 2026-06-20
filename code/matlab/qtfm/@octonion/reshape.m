function a = reshape(q, varargin)
% RESHAPE Change size.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

nargoutchk(0, 1)

a = overload(mfilename, q, varargin{:});

end

% $Id: reshape.m 1090 2020-06-15 17:17:19Z sangwine $
