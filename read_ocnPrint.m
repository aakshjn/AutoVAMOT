function phase_noise_output = read_ocnPrint()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%code to make the output array using the text file generated from
%simulation
% fileID = fopen('outputtest.txt');
% formatSpec = '%f%f';
% sizeA = [2 inf];
% A = fscanf(fileID,formatSpec,sizeA);
% phase_noise_output=transpose(A);
% fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%% alternate and more efficient method:
fileID = fopen('outputtest.txt','r');
Datac = textscan(fileID, repmat('%f%f', 1, 1), 'HeaderLines',3, 'CollectOutput',1);
phase_noise_output = Datac{1};
fclose(fileID);
end
