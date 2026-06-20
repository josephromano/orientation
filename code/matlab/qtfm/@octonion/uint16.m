function d = uint16(~) %#ok<STOUT>
% UINT16 Convert to unsigned 16-bit integer (obsolete).
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(['Conversion to uint16 from octonion is not possible. ',...
       'Try cast(q, ''uint16'')'])

% Note: this function was replaced from version 0.9 with the convert
% function, because it is incorrect to provide a conversion function
% that returns an octonion result.

end

% $Id: uint16.m 1090 2020-06-15 17:17:19Z sangwine $

% Created automatically from the quaternion
% function of the same name on 17-Feb-2020.