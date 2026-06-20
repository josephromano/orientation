function d = int8(~) %#ok<STOUT>
% INT8 Convert to signed 8-bit integer (obsolete).
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(['Conversion to int8 from quaternion is not possible. ',...
       'Try cast(q, ''int8'')'])

% Note: this function was replaced from version 0.9 with the convert
% function, because it is incorrect to provide a conversion function
% that returns a quaternion result.

end

% $Id: int8.m 1090 2020-06-15 17:17:19Z sangwine $
