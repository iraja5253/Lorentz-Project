![[Pasted image 20260717041418.png|628]]
So like what we mean above is:
$$ \frac{\Delta \dot{x}}{\Delta x} \approx \frac{d \dot{x}}{d x} = \frac{d f(x)}{d x} (\text{which is btw the Jacobian matrix}) \implies \Delta \dot{x} = \frac{d f(x)}{d x} \Delta x \quad \text{ or } \quad \dot{Y} = J Y$$
Consider $\epsilon$ as a small deviation i.e. $\Delta x = \epsilon$ from the initial position $x_0$ , then:
$$\frac{\dot{\epsilon}}{\epsilon} \approx \frac{d f(x_0 + \epsilon)}{d \epsilon} \implies \epsilon = \exp(-\lambda t) $$ $\lambda$ is the Lyapunov exponent.

--- 
**Ergodic**: 

---
**Lyapunov (Floquet) exponents of a periodic orbit**
For a periodic orbit of period T, the relevant "Lyapunov exponents" are the Floquet exponents: $$\mu_i = \log(|\lambda_i|) / T$$where $\lambda_i$ are  the eigenvalues of the monodromy matrix $M = \Phi(T)$, the state-transition matrix obtained by integrating the variational equation  $$d\Phi/dt = J(x(t)) * \Phi$$and $\Phi(0) = I$  alongside the orbit itself over one period. One exponent is always ~0 (flow direction, since $x(0)=x(T)$ for a periodic orbit); for a chaotic saddle-type periodic orbit of Lorenz you typically get one positive, one ~0, one negative exponent.