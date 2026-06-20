function test_symbolic
% Test code for the quaternion symbolic functions

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing symbolic functionality ...')

% Start with the constructor to make sure that all the ways of building a
% quaternion with symbolic components will work correctly.

q = quaternion('a'); % Make a quaternion with symbolic zero vector part.
p = quaternion(a);   % This should be identical to q, since it has the same
                     % scalar part.
if p ~= q
    error('Symbolic test 1 fails.')
end

if vector(p) ~= 0
    error('Symbolic test 2 fails.')
end

syms a b c d

q = quaternion(a, b, c, d);
p = quaternion(a, vector(q));

if p ~= q
    error('Symbolic test 3 fails.')
end

q = quaternion('t', vector(q));
p = quaternion(t, b, c, d);

if p ~= q
    error('Symbolic test 4 fails.')
end

clear t

p = quaternion('x', 'y', 'z');
q = quaternion(x, y, z);

if p - q ~= 0 % Do a subtraction here rather than comparing p with q so we
              % test a bit more code.
    error('Symbolic test 5 fails.')
end

clear x y z

p = quaternion('w', 'x', 'y', 'z');
q = quaternion(w, x, y, z);

if p - q ~= 0 % Do a subtraction here rather than comparing p with q so we
              % test a bit more code.
    error('Symbolic test 5 fails.')
end

% A couple of further tests on the constructor.

if ~eval(cast(qi, 'sym') == quaternion(sym(1), sym(0), sym(0)))
   error('Symbolic test 6 fails.') 
end

if ~eval(cast(unit(quaternion(1,1,1)), 'sym') == ...
         unit(quaternion(sym(1), sym(1), sym(1))))
     error('Symbolic test 7 fails.')
end

% Test the inverse, and also simplification down to unity.

p = inv(q);
r =  p .* q;

if eval(simplify(r) ~= 1)
    error('Symbolic test of inverse fails.')
end

% Now check out theorem proving. This is a much more demanding test of the
% toolbox code, but tests are bit harder to devise.

% Perpendicular vectors negate on re-ordering. That is uv = -vu provided u
% and v are orthogonal. Note that we use the elementwise multiply on the
% LHS and the matrix multiply on the RHS, in order to verify that these two
% products both give the same result.

syms w x y z
v = quaternion(b, c, d);
u = quaternion(x, y, z);
assume(scalar_product(u, v) == 0); % Declares u perpendicular to v
if ~isAlways(u .* v == -v * u)
    error('Symbolic test fails: perpendicular vectors do not negate on re-ordering.')
end

% Test that a unit pure quaternion squares to minus 1. We can do this test
% in more than one way.

if simplify(unit(u).^2) ~= -1
   error('Symbolic test fails: unit pure quaternion squared fails to simplify to -1.') 
end

assume(abs(v) == 1);
if ~isAlways(v^2 == -1) % NB We use the matrix square here, but elementwise
                        % square in the previous test, deliberately.
   error('Symbolic test fails: unit pure quaternion fails to square to -1.') 
end

% TODO Insert some more demanding tests here.

disp('Passed')

end

% $Id: test_symbolic.m 1103 2020-07-20 18:44:32Z sangwine $
