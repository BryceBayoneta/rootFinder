This is a MATLAB function which finds the roots of a polynomial using the bisection method

Features
- Allows for custom polynomials using coefficient and power matrices
- Allows custom domain and tolerance values
- Finds multiple roots across domain

How to Use
Call function with:
```matlab
roots = rootFinder(coefficients, powers, minDomain, maxDomain, tolerance);
```
Example: 
```matlab
roots = rootFinder([1 -2 -3 4 5], [3 2 1 0], -5, 5, 1e-9);
