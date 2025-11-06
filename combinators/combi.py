import operator as O

import toolz.functoolz as F
from pipe import Pipe

star = lambda f: lambda args: f(*args)


@Pipe
def mean(xs):
    return F.pipe(xs, F.juxt(sum, len), star(O.truediv))


print([1, 2, 3] | mean)
