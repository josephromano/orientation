function a = abs(q)
% ABS Absolute value, or modulus, of a quaternion.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2015, 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

if isnumeric(q.x)    
    if isreal(q)
        
        % We use here a method based on Cayley-Dickson form and the Matlab
        % function hypot, which avoids overflow for large values.
        
        if isempty(q.w)
            a = hypot(abs(q.x), abs(complex(q.y, q.z)));
        else
            a = hypot(abs(complex(q.w, q.x)), abs(complex(q.y, q.z)));
        end
    
    else
    
        % Here, for biquaternions, we cannot use hypot and we use the
        % obvious formula, which was used for all quaternions up to version
        % 1.4 of this file (in the CVS repository, prior to conversion to
        % SVN).
        
        if isempty(q.w)
            a = sqrt(         q.x.^2 + q.y.^2 + q.z.^2);
        else
            a = sqrt(q.w.^2 + q.x.^2 + q.y.^2 + q.z.^2);
        end
        
    end

elseif isa(q.x, 'sym')

    % For symbolic inputs we can use the simple formulas below for real and
    % complex cases.

    if isempty(q.w)
        a = sqrt(         q.x.^2 + q.y.^2 + q.z.^2);
    else
        a = sqrt(q.w.^2 + q.x.^2 + q.y.^2 + q.z.^2);
    end

end

end

% $Id: abs.m 1093 2020-06-20 19:38:15Z sangwine $
