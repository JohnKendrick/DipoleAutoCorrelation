## Calculation of the static relative permittivty

The development of the theory closely follows the appendix in the paper by [Chen and Li](file:///home/john/Documents/Theory/Infrared/SingleCrystals/5.0049464.pdf) but I have changed the units to SI units.  Also I have taken into account the fact that the dipole moment of the cell is not zero, but it may have a permanent dipole moment.

The Displacement field $D$ is defined from Maxwells Equations ($\epsilon_0$ is the permittivity of press space) and $P$ is the induced polarisation due to an electric field.  There seems to be confusion at this point as to whether this polarisation includes the permanent dipole of the system, but since we are dealing with the electronic dipole induced by an electric field, I think this is not included.  The permittivity, $\mathbf{\epsilon}$, is given by the relationship between the Displacement field and the applied field $\mathbf{E}$;
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

For a molecular dynamics calculation of an infinite system, we have a periodic cell with a fluctuating dipole moment $\mathbf{M}$ .  The average if the dipole moment vector can be written, where $\mathbf{M}$ is a vector of the 3 components of the dipole moment, and the average is over the trajectory;
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

Here $\beta = \frac{1}{k T}$. 
We are interested in the induced dipoles which are the terms only depending on the field.  This gives;
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

The induced polarisation can be expressed in terms to the average induced dipole moments, using equation 6.

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
\frac{d}{dt}\frac{\langle M_i(t) M_j(0) \rangle }
{\langle M_i(0) M_j(0) \rangle }
\,dt \tag{15a}
$$

$$
F \phi_{ij} = 1 - i 2 \pi \omega \int_0^{\infty} 
e^{-i 2 \pi \omega t}
\frac{\langle M_i(t) M_j(0) \rangle }
{\langle M_i(0) M_j(0) \rangle }
\,dt \tag{15b}
$$



Here  $$\frac{\langle M_i(t) M_j(0) \rangle } {\langle M_i(0) M_j(0) \rangle } \tag{16}$$ 
is the dipole correlation function and needs to be calculated from the trajectory.  I am not convinced that equation 15 is right, I can't see where "1" comes from.  From my calculation I have a time series with 30,000 to 80,000 steps in it for $\mathbf{M}$ and I need to calculate the above expressions.

## Calculation of the dipole correlation function
First a few definition will be helpful.  The Nyquist frequency, which determines the band width of our spectrum is defined from the sampling frequency, which in turn is defined from the time step of the calculation.
$$
f_N = \frac{v_{sample}}{2} = \frac{1}{2 \Delta t} \tag{17}
$$

| Time Step (fs) | Nyquist Frequency ($cm^{-1}$) |
| --------------:| ---------------------------:|
|            0.5 |                       33356 |
|            1.0 |                       16678 |
|            2.0 |                        9339 |
|            3.0 |                        5559 |
|            4.0 |                        4170 |
|            5.0 |                        3336 |
|            6.0 |                        2779 |
|            7.0 |                        2382 |

The lowest frequency we can reliably measure from the trajectory is determined by the length of the trajectory.  Here I've estimated the lowest frequency from the Nyquist frequency corresponding to the trajectory length.

| Trajectory length (ps) | Low frequency ($cm^{-1}$) |
| ----------------------:| -----------------------:|
|                      1 |                    16.7 |
|                      5 |                     3.4 |
|                     10 |                     1.7 |
|                     20 |                     0.8 |

To calculate the correlation function in equation 16, we need to average over the blocks of measurements.  The above table shows that for low frequencies we need at least 1 ps blocks. 

## Implementation
Im using an fft/ifft to calculation the normalised dipole correlation functions.  The aim of the function is;
1. Pad the input arrays with zeros to remove aliasing.
2. Normalise the input arrays so that an autocorrelation function decays from 1
3. Return only the forward part of the fft.

```
def doANormalisedFFtCorrelation(dipi,dipj):
    """Calculate the correlation using a normalised FFT"""
    N = len(dipi)
    n = find_nearest_power_of_two(N)
    doublen = 2*n
    datai = np.zeros(doublen)
    dataj = np.zeros(doublen)
    normij = np.average(dipi*dipj)
    # Partition the normalisation between the two signals
    # If the normalisation is negative then this is no longer symmetric
    if normij > 0.0:
        datai[:N] = dipi / np.sqrt(normij)
        dataj[:N] = dipj / np.sqrt(normij)
    else:
        datai[:N] = dipi / -np.sqrt(-normij)
        dataj[:N] = dipj / +np.sqrt(-normij)
    f_datai = np.fft.fft(datai)
    f_dataj = np.fft.fft(dataj)
    transform = np.fft.ifft(f_datai.conj()*f_dataj)
    forwards  = np.real(transform[:N]) / N
    return forwards

```

The fft is called with the dipole deviations from the mean using blocked algorithm, to improve the statistics.  Generally the blocking does not seem to be particularly useful, but it is there if needed.  The script defaults to no blocking.

```
def fftCorrelationBlock(dipoles, nblocks, blocksize):
    """ Calculate the correlation using an fft """
    correlations = np.zeros( (3,3,blocksize) )
    # Begin loop over blocks to calculate the frequency dependent permittivity
    start = 0
    for n in range(nblocks):
        start = n * blocksize
        # Loop over the indices of the correlation matrix 
        for i in range(3):
            for j in range(3):
                correlations[i,j] += doANormalisedFFtCorrelation(dipoles[i,start:start+blocksize],dipoles[j,start:start+blocksize])
            # end for j
        # end for i
    # end for n
    return correlations / nblocks

```

The final steps for equation A13 of the Chen, Li reference are to calculate $F\phi_{ij}$, which is the fourier transform of the dipole moment correlation using equation 15a or 15b.  I have implemented both approaches and they nearly agree!  There are a few tricky bits in this.  Again the correlations have been padded with zeros, after the fft only the positive frequencies are used and the frequency is represented by the _np.arrange(blocksize)/(2*blocksize)_.   The values calculated by this routine agree with that calculated using the numerical time derivative of the correlation function.
Equation 15a is implemented as follows;
```
def calculate_fphi_from_dipole_correlation_derivatives(correlations):
    """Calculate fphi using equation A13 of Chen and Li, but by calculating the time derivative"""
    i,j,blocksize = np.shape(correlations)
    fphi = np.zeros( (3,3,blocksize), dtype=complex )
    for i in range(3):
        for j in range(3):
            correlations_dt = -derivatives(correlations[i,j],1.0)
            data1 = np.zeros(2*blocksize,dtype=complex)
            data1[:blocksize] = correlations_dt[:blocksize]
            transform = np.fft.fft(data1)
            fphi[i,j] = transform[:blocksize]
    return fphi
```
Equation 15b is implemented as follows;
```
def calculate_fphi_from_dipole_correlations(correlations):
    """Calculate fphi using equation A13 of Chen and Li"""
    i,j,blocksize = np.shape(correlations)
    fphi = np.zeros( (3,3,blocksize), dtype=complex )
    for i in range(3):
        for j in range(3):
            data1 = np.zeros(2*blocksize,dtype=complex)
            data1[:blocksize] = correlations[i,j,:blocksize]
            transform = np.fft.fft(data1)
            fphi[i,j] = 1 -2.0 * np.pi * complex(0,1) * np.arange(blocksize) * transform[:blocksize] /(2*blocksize)
    return fphi
```

The final expression for permittivity can now be assembled;

```
if use_time_derivatives:
    fphi  = calculate_fphi_from_dipole_correlation_derivatives(correlations)
else:
    fphi = calculate_fphi_from_dipole_correlations(correlations)
#
# Assemble all the terms and calculate the permittivity
#
for i in range(3):
    for j in range(3):
        L[i,j] = average_squared_dipoles[i,j] * fphi[i,j]
        permittivity[i,j] = beta / ( volume * eps0 ) * L[i,j] + unit[i,j]
```

## Results
Below are some results from an MD calculation on Cysteine Form4.  The dipole moments of the cell have been printed out every 4fs.  This figure uses equation 15a
![[Pasted image 20210815163918.png]]

There is a baseline effect which is there in the permittivities and the absorption, but because the absorption scales linearly with frequency, it is much more obvious in the absorption plot.  The effect is thought to be due to the $\omega$ multiplying the noise effects, resulting in a linear term wrt to frequency.

If equation 15b is used this artefact goes away as can be seen in the following plot.
![[Pasted image 20210815163653.png]]

For comparison purposes here is the plot from the same trajectories extracted using Travis.

![[Pasted image 20210815164322.png]]
## References

A very useful article by Girigera is here; [CrossCorrelation](file:///home/john/Documents/Theory/Infrared/SingleCrystals/2002.01750.pdf)
I am not sure if I am dealing with a stationary process.  These are processes which are time-translation invariant.  There are several indicators that it is indeed a stationary process.
1. The time origin should be irrelevant
2. The average of the dipole moments is constant in time
3. Without doubt it should be stationary up to second order, as both the average and the variance 

This article introduce the correlation function as;
$$
C_{AB}(t_0,t) = \langle A^*(t_0)B(T_0+t)\rangle \tag{18}
$$


Kneller, G. R., Keiner, V., Kneller, M., & Schiller, M. (1995). nMOLDYN: A program package for a neutron scattering oriented analysis of Molecular Dynamics simulations. Computer Physics Communications, 91(1–3), 191–214. https://doi.org/10.1016/0010-4655(95)00048-K

Chen, W., & Li, L.-S. (2021). The study of the optical phonon frequency of 3C-SiC by molecular dynamics simulations with deep neural network potential. _Journal of Applied Physics_, _129_(24), 244104. https://doi.org/10.1063/5.0049464
[Local file - Chen and Li](file:///home/john/Documents/Theory/Infrared/SingleCrystals/5.0049464.pdf)

@article{Phys2021,
author = {Chen, Wei and Li, Liang-Sheng},
doi = {10.1063/5.0049464},
file = {:home/john/Documents/Theory/Infrared/SingleCrystals/5.0049464.pdf:pdf},
issn = {0021-8979},
journal = {Journal of Applied Physics},
month = {jun},
number = {24},
pages = {244104},
publisher = {AIP Publishing LLC},
title = {{The study of the optical phonon frequency of 3C-SiC by molecular dynamics simulations with deep neural network potential}},
url = {https://aip.scitation.org/doi/10.1063/5.0049464},
volume = {129},
year = {2021}
}

[Miller - Fundamental optical properties of solids](file:/home/john/Documents/Projects/Bradford/Terahertz/LO-TO/Fundamental%20Optical%20Properties%20of%20Solids.pdf)

Miller, A. (2010). Fundamental optical properties of solids. In Handbook of Optics, Chapter 8.
@incollection{Miller2010b,
author = {Miller, Alan},
booktitle = {Handbook of Optics, Chapter 8},
chapter = {8},
file = {:home/john/Documents/Projects/Bradford/Terahertz/LO-TO/Fundamental Optical Properties of Solids.pdf:pdf},
mendeley-groups = {Local Disk},
title = {{Fundamental optical properties of solids}},
year = {2010}
}

[Fox, M. (2001). Optical Properties of Solids. Oxford: Oxford University