dipole_acf dipoles.traj -plot  -blocksize  8192 -blockshift 1024 -window exp 1 5 -xlsx ir_spectra_from_cell_dipole.xlsx
# This settings gives more resolved peaks at low frequencies
dipole_acf dipoles.traj -plot  -blocksize 16384  -blockshift 1024 -xlsx ir_spectra_from_cell_dipole_narrow.xlsx -pad 2 -window exp 1 4
