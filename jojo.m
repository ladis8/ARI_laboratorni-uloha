%clear all; clc; close all;
%load ('./WERKSPEJS/mereni_16_04/vypustprava')
close all
load ('./WERKSPEJS_REGULATORS/pi_test')
vypustleva = ty

plot( vypustleva(:,1) , [vypustleva(:,2), vypustleva(:,3), vypustleva(:,4), vypustleva(:,5), vypustleva(:,6)] )



