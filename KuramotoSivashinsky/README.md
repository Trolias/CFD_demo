# 1D Kuramoto-Sivashinsky Numerical Solver

This repository contains a numerical implementation of the **1D Kuramoto-Sivashinsky (KS) equation**. The solver is designed to handle the stiff nature of the equation using advanced exponential time integration.

## Mathematical Formulation

The Kuramoto-Sivashinsky equation is a partial differential equation known for its chaotic behavior, often used to model laminar flame fronts or reaction-diffusion systems. It is defined as:

$$\frac{\partial u}{\partial t} = -\nu \frac{\partial^4 u}{\partial x^4} - \frac{\partial^2 u}{\partial x^2} - u \frac{\partial u}{\partial x}$$

In the Fourier domain, this transforms into a system of Ordinary Differential Equations (ODEs) for each wavenumber $k$:

$$ \hat{u}_t = \mathbf{L}\hat{u} + \mathbf{N}(\hat{u}, t)$$

where:
* **Linear operator:** $\mathbf{L} = k^2 - \nu k^4$
* **Nonlinear operator:** $\mathbf{N} = -\frac{i k}{2} \mathcal{F}(u^2)$

## Numerical Scheme

To overcome the numerical stiffness introduced by the fourth-order hyper-diffusion term, this code implements the **Exponential Time Differencing (ETD)** schemes. 

Specifically, the integration follows the **ETDRK4** (4th-order Exponential Time Differencing Runge-Kutta) method. This approach treats the linear part exactly using an integrating factor, which allows for significantly larger time steps compared to standard explicit Runge-Kutta methods.

## Credits & References

* **Inspiration:** The numerical implementation logic is heavily influenced by the [Machine Learning Simulation](https://www.youtube.com/@MachineLearningSimulation) YouTube channel.
* **Core Methodology:** The time-stepping schemes are based on the definitive work by Cox and Matthews:

> **S.M. Cox, P.C. Matthews**, *Exponential Time Differencing for Stiff Systems*, Journal of Computational Physics, Volume 176, Issue 2, 2002, Pages 430-455.  
> ISSN 0021-9991 | [https://doi.org/10.1006/jcph.2002.6995](https://doi.org/10.1006/jcph.2002.6995)

### Abstract
We develop a class of numerical methods for stiff systems, based on the method of exponential time differencing. We describe schemes with second- and higher-order accuracy, introduce new Runge–Kutta versions of these schemes, and extend the method to show how it may be applied to systems whose linear part is nondiagonal. We test the method against other common schemes, including integrating factor and linearly implicit methods, and show how it is more accurate in a number of applications.
