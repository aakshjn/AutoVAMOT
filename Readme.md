# Automation Script for Cadence using MATLAB
Scripts to run batch/single simulations in Cadence-Spectre by defining the parameter values in MATLAB. This can be done in real time for optimizationn and variability analysis of circuit designs. Read more: A. Chordia and J. N. Tripathi, "An Automated Framework for Variability Analysis for Integrated Circuits Using Metaheuristics," in IEEE Transactions on Signal and Power Integrity, vol. 1, pp. 104-111, 2022, doi: 10.1109/TSIPI.2022.3202150.

## Requirements:
1. Spectre and MATLAB on the same machine.
2. Linux Screen: https://linuxize.com/post/how-to-use-linux-screen/

## How to use:

### Initial Setup:
1. Designing the nominal circuit design in the Spectre environment and perform simulations using ADE-L/ ADE-XL (this creates a default netlist).
2. Define the paramters to be varied as variables.
3. Generate the corresponding Ocean script from the ADE-L menu.  
4. Use this script to as a template for generating a new script (this process is done in MATLAB real time) which define the simulation parameters.
5. In MATLAB, define the desired sampling algorithm. 
6. In code, where simulation results are desired, pass the design parameters on to a function (say create_ocean_script.m) to create a new ocean script.
7. Immediately following, a function (say simulate.m) runs this newly generated ocean script in Cadence and gives the result back to the MATLAB.
8. The paths defined in the above two functions needs to be corrected before use.

### Run:
1. Ensure no screens are active, if yes, kill those.
2. In a new screen, intantiate the Cadence simulation enviromnet but use ocean command interface (use command: ocean) and not the spectre environment. 
3. De-attach this screen (most probably you have to use a different terminal window to do that, because the ocean command line will not allow any bash commands).
4. Now, start the MATLAB and run the sampling code. 
5. If everything goes through, you can see the 'simulation performed sucessfully' message on the MATLAB command line after each performed simulation.


### Disclaimer:
The script has been tested only for Linux.

Please contact: Aksh Chordia, chordia.2@iitj.ac.in in case of any queries.
