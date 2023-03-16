function phase_noise_output = simulate(input_array)
% function to give out the phase noise from the input vector x ,
% dimensionality = 1X7
% First we generate the ocean script, then we simulate based on this
% ocean script and then parse the output from the ocean script to matlab 


%%%%%%% deleting the older output file %%%%%%%
if exist('outputtest.txt', 'file')==2
  delete('outputtest.txt');
end

%%%%%%%% deleting the older output file for harmonic frequency %%%%%%%%
if exist('outputtestfreq.txt', 'file')==2
  delete('outputtestfreq.txt');
end

%%%%%%% generating ocean script for simulation %%%%%%%%
gen_ocean_script(input_array); %ocn script updation for current input

%%%%%%% function to simulate the ocean script %%%%%%%
system('./ocean_simulation_script_new.sh' ) %Matlab command to run script on terminal

%%%%% checking and staying till the file is generated
while 1
    if isfile('outputtest.txt')
        break
    end
end
disp('simulation performed successfully');


%%%%%%% parsing and returning the phase noise output %%%%%%%%
phase_noise_output = read_ocnPrint(); %Output extraction
end