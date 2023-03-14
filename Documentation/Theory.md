## Calculation of the static relative permittivty

The development of the theory closely follows the appendix in the paper by [Chen and Li](file:///home/john/Documents/Theory/Infrared/SingleCrystals/5.0049464.pdf) but the units have been changed to SI units.  Also account is taken of the fact that the dipole moment of the cell is not zero, but it may have a permanent dipole moment.

The displacement field $\mathbf{D}$ is defined from Maxwell's equations, $\epsilon_0$ is the permittivity of free space) and $\mathbf{P}$ is the induced polarisation due to an electric field.  The permittivity, $\mathbf{\epsilon}$, is given by the relationship between the displacement field and the applied field $\mathbf{E}$ as expressed in equation 1.
$$
\mathbf{D} = \mathbf{P} + \epsilon_0 \mathbf{E} = \mathbf{\epsilon} \mathbf{E} \tag{1}
$$

The induced polarisation and the permittivity are also related to the susceptibility $\mathbf{\chi}$ 

$$
 \mathbf{P} = \epsilon_0 \mathbf{\chi} \mathbf{E} \tag{2}
$$

$$
 \mathbf{\epsilon} = \epsilon_0 ( \mathbf{1 + \chi} ) \tag{3a}
$$
or defining the relative permittivity (dielectric constant), $\mathbf{\epsilon_r}$;
$$
 \mathbf{\epsilon_r} = \frac{\mathbf{\epsilon}}{\epsilon_0} =  \mathbf{1 + \chi} \tag{3b}
$$

For a molecular dynamics calculation of an infinite system, we have a periodic cell with a fluctuating dipole moment $\mathbf{M}$ .  The average of the dipole moment vector ($\mathfb{M_{av}}) can be written as shown in equation 4, where $\mathbf{M}$ is a vector of the 3 components of the dipole moment, and the average is over the trajectory;
$$
\mathbf{M_{av}} = \langle \mathbf{M} \rangle \tag{4}
$$

The average of the square of the dipole moment can be written;

$$
\langle \bf M M \rangle = \left[ { \begin{array}{ccc}
\langle M_x M_x \rangle & \langle M_x M_y \rangle & \langle M_x M_z \rangle \\
\langle M_y M_x \rangle & \langle M_y M_y \rangle & \langle M_z M_z \rangle \\
\langle M_z M_x \rangle & \langle M_z M_y \rangle & \langle M_z M_z \rangle 
\end{array} } \right] \tag{5}
$$

The polarisation and the average of the induced dipole moment $\mathbf{M_I}$ are related ($V$ is the volume of the cell);
$$
\mathbf{P} = \frac{\langle \mathbf{M_I} \rangle }{V} \tag{6}
$$
$$
\mathbf{M_I} = \mathbf{ M - M_{av}} \tag{7}
$$

The expectation value of the dipole moment of a system perturbed by a field $\bf E$ according to Chen and Li (equation A6) is;
$$
\langle \mathbf{M} \rangle_E = \langle\mathbf{M}\rangle + \beta \langle \mathbf{M} ( \mathbf{M} - \langle \mathbf{M} \rangle ) \rangle \cdot \mathbf{E} \tag{8}
$$

Here $\beta = \frac{1}{k T}$.   We are interested in the induced dipoles which are the terms only depending on the field.  This gives;
$$
\langle \mathbf{M_I} \rangle_E =  \beta \langle \mathbf{M} ( \mathbf{M} - \langle \mathbf{M} \rangle ) \rangle \cdot \mathbf{E} \tag{9}
$$

Since the total dipole moment permittivity is related to the field through the permittivity tensor (Equation 1);

$$
\mathbf{\epsilon} \cdot \mathbf{E} = \epsilon_0 \mathbf{E} + \mathbf{P} \tag{10a}
$$
$$
\mathbf{\epsilon_r} \cdot \mathbf{E} = \mathbf{E} + \frac{\mathbf{P}}{\epsilon_0} \tag{10b}
$$

The induced polarisation can be expressed in terms of the average induced dipole moments, using equation 6.

$$
\mathbf{\epsilon_r} \mathbf{E} = \mathbf{E} + \frac{\beta}{V \epsilon_0} \langle \mathbf{M_I} \rangle_E \tag{11}
$$
Substituting the expectation value of the induced dipole moment (equation 9) and cancelling out the field, gives;

$$
\mathbf{\epsilon_r} = \mathbf{1} + \frac{\beta}{V \epsilon_0}
\langle \mathbf{M} ( \mathbf{M} - \langle \mathbf{M} \rangle ) \rangle \tag{12}

$$

This equation gives the static permittivity and is different to that derived in the paper (A10), and to what most other people use (I have only seen applications to liquids where the average dipole is 0)

The next step is to calculate the frequency dependent permittivity.

## Frequency dependent permittivity
The starting equation for this is equation A13 in the paper by Chen and Li;
$$
\mathbf{\epsilon_r}(\omega) = \frac{\beta}{\epsilon_0 V} \mathbf{L} + \mathbf{1} \tag{13}
$$
$$
L_{ij} = \langle M_i(0) M_j(0) \rangle F \phi_{ij} \tag{14}
$$

$$
F \phi_{ij} = \int_0^{\infty} 
e^{-i 2 \pi \omega t}
\frac{d C_{ij}(t)}{dt}
\,dt \tag{15a}
$$

$$
F \phi_{ij} = 1 - i 2 \pi \omega \int_0^{\infty} 
e^{-i 2 \pi \omega t}
C_{ij}(t)
\,dt \tag{15b}
$$



Here  $$C_{ij}(t) = \frac{\langle M_i(t) M_j(0) \rangle } {\langle M_i(0) M_j(0) \rangle } \tag{16}$$ 
$C_{ij}(t)$ is the dipole correlation function and needs to be calculated from the trajectory.  

## Electronic contribution to permittivity

The final contribution to the total permittivity comes from the the electronic contribution to the permittivity at zero frequency, $\mathbf{\epsilon_{optical}}$.  This term is calculated by a DFT calculation.  The final total permittivty is then;
$$\mathbf{\epsilon_{total}(\omega)}=\mathbf{\epsilon_{optical}}+\mathbf{\epsilon_r}(\omega) \tag{17}
$$
## Calculation of the dipole correlation function
First a few definition will be helpful.  The Nyquist frequency, which determines the band width of our spectrum is defined from the sampling frequency, which in turn is defined from the time step of the calculation.

$$
f_N = \frac{v_{sample}}{2} = \frac{1}{2 \Delta t} \tag{18}
$$
## The Discrete Dipole Moment Correlation Function
Typically the dipole moment correlation function is calculated from the cell dipole moments calculated by CP2K at \SI{0.5}{fs} time intervals.  A typical trajectory will contain over 60,000 data points.
A discrete version of Equation 15a was used to calculate $F \phi_{ij}$ as Equation 15b seemed to have more numerical problems.
The time derivative of the dipole moment correlation function was calculated using numerical differentiation.
Various signal processing ideas were used in processing the correlation function.
If there is a sequence of calculated dipole moments at regular intervals the sequence can be written as a vector $ \mathbf{M_i} $.
If the sequence is long enough it can be sampled at different starting points along the sequence, the starting points being separated by a correlation depth, $N_{corr}$.
The correlation depth is chosen to be an integer power of two so that the discrete fast Fourier transform can be used in the calculation of equation 15a.
In this way a single trajectory can be split into several, hopefully independent trajectories, each of which can be used to calculate a dipole correlation function which can be averaged.

The correlation function can now be written as a vector $\mathbf{C}_{i,j}$ of length $N_{corr}$.  
For a perfect simulation of sufficient length and sufficient size, the function should decay to zero in an exponential manner as the phonons scatter have a lifetime related to the decay of the correlation function.
In practice the systems that are simulated are small and are often not simulated for long enough to determine the system phonon lifetimes.
To compensate for this a window function, $\mathbf{W}$ is applied to the correlation function to ensure that it behaves in a physical manner.

Thus the new correlation function is written as a convolution of the window function with the correlation function;

$$
\mathbf{C^{'}}_{i,j} = \mathbf{W} \odot \mathbf{C}_{i,j} \tag{19}
$$

The elements of the window function are written as an exponential;

$$
\mathbf{W}(k) = e^{-(k-1) a} \tag{20}
$$

where the index k runs from 1 to $N_{corr}$.
The parameter $a$ determines the decay rate of the exponential and as the Fourier transform of an exponential is a Lorentzian, it also imposes a Lorentzian line shape onto the signal.
In addition to applying a window to the correlation function, the function can be padded with zeros so that the total number of points in the signal is $ p N_{corr} $ where p is the padding factor.

A combination of parameters which have been foiund to be useful in calculating spectra is summarised in the table below:

   | Setting | $N_{corr}$ | Decay parameters ($a$) | Padding factor ($p$) |
   | ------- | ---------- | ---------------------- | -------------------- |
   | Default | 8192       | 5.0                    | 4                    |
   | Narrow  | 16384      | 4.0                   |  2                    |

The Default setting tend to produce peaks which are too broad at low frequencies.  The Narrow setting compensates for this but increases the noise in the spectrum.

## Calculation of the Absorption Spectrum

The trace of the total permittivity tensor is used as an estimate of the permittivity of a powder containing randomly oriented crystallites.
From this the absorption coefficient ($A$) is calculated from the resulting imaginary component of the refractive index ($k$).
In the equations below the dependence on the frequency and hence the wavelength ($\lambda$) is implicit.  The units of $A$ are inverse distance.

$$
\mathbf{\epsilon}_{total} = \mathbf{\epsilon}_r + \mathbf{\epsilon}_{optical} \tag{21}
$$

$$
(n + i k)^2  = Tr{\mathbf{\epsilon}_{total} } \tag{22}
$$

$$
A  = 4 \pi \frac{n}{\lambda} \tag{23}
$$

## References

Chen, W., & Li, L.-S. (2021). The study of the optical phonon frequency of 3C-SiC by molecular dynamics simulations with deep neural network potential. _Journal of Applied Physics_, _129_(24), 244104. https://doi.org/10.1063/5.0049464