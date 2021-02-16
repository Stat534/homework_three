HW3
================

### Q1. GP Regression in 2D (12 points)

This question will continue the theme from the GP Demo on Friday
February 12.

#### Simulate GP regression in 2D (4 points)

Simulate and visualize a GP in 2d with a covariate structure. To keep
this simple, consider an additive relationship with the covariates, x1
and x2. While not required, take some time to explore the impacts of
changing the total number of sampling locations as well as the
parameters in the GP.

#### Stan (4 points)

Now modify the Stan code to estimate this model in 2D. Report how well
your code recovers the parameters (sigmasq, phi, beta0?, beta1?, beta2?)
from your simulated dataset.

#### Make Predictions for a set of locations (4 points)

Using your results from the stan model, make predictions at a set of
locations. The locations can be the entire surface, or just a handful of
points in the space. Include these results in a figure.
