The python module dipole_acf reads a file of dipole moment fluctuations for a periodic cell calculated using molecular dynamics.   The source code for the module can be found in the Source/ directory

# The CP2K MD calculation
The Example/ directory has an example file of dipole moments calculated by the CP2K package.  The input for the CP2K calculation can be found in the Example/CP2K directory.  The MD calculation generates a file of cell dipole moments which are stored in Example/CP2K/dipolemoments.traj.  

## Generating an input file
From the dipolemoments.traj file the cell dipole moments in atomic units are extracted using a grep command;

    grep ' X=' dipolemoments.traj > dipoles.traj

The dipoles.traj file will be used as input to the dipole_acf python script, but some additional information is required, which is provided by adding a new 1st line.   This line provides the MD time step in picoseconds, the volume of the cell in Angstrom$^3$, the temperature, the number of molecules in the cell and the electronic permittivity.

For the example provided the beginning of the dipoles.traj file looks like this;

```
0.5 1.073432287544E+03 300 8  2.755 0 0    0 2.712 0  0 0 2.804
    X=  0.30932431 Y= -0.79468839 Z= 0.05989735  Total= 0.85486775
    X=  0.17485809 Y= -1.03775214 Z= 0.27401013  Total= 1.08746788
    X=  0.07616791 Y= -1.29241620 Z= 0.47219299  Total= 1.37808106
    X=  0.00932536 Y= -1.54912092 Z= 0.64275954  Total= 1.67720077
    X= -0.03220649 Y= -1.79595091 Z= 0.77389641  Total= 1.95586109
    X= -0.05318371 Y= -2.01932132 Z= 0.85951953  Total= 2.19528151
    X= -0.05814824 Y= -2.20672745 Z= 0.89623873  Total= 2.38249262
    X= -0.05617437 Y= -2.34479451 Z= 0.88136139  Total= 2.50559668
    X= -0.05379532 Y= -2.42286278 Z= 0.82006523  Total= 2.55844972
```

## Examples running the script

Run the following code in the example directory; 

    ../source/dipole_acf dipoles.traj -plot

This reads the file dipoles.traj and plots the absorption spectrum.

Options available are;

   | Options               | Effects                                  |
   | --------------------- | ---------------------------------------- |
   | -blocksize  blocksize | Uses blocking and sets the blockize      |
   | -blockshift steps     | Each block starts after blockshift steps |
   | -plot                 | Plot the absorption                      |
   | -plot absorption      | Plot the absorption                      |
   | -plot dipole          | Plot the dipole fluctuation              |
   | -xlsx file            | Write a excel spreadsheet                |
   | -window exp a eps     | Use an exponentatial window              |
   | -notimederivatives    | Use equation 17b                         |
   | -correlationlength c  | Set the correlation length               |
   | -average l            | Use a moving average with length l       |
   | -fmin f               | set the minimum frequency                |
   | -fmax f               | set the maximum frequency                |
   | -tmin t               | set the minimum time                     |
   | -tmax t               | set the maximum time                     |
