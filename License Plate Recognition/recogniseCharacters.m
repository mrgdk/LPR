function [eccentricityVector, formFactorVector, numlabels] =  recogniseCharacters(eccentricityVector, formFactorVector, numlabels)
    disp('The license plate is: ');
    for i = 1:numlabels
        
        %%
        %%  all those values have been obtained by checking the stats of the
        %%  eccentricity and form factor for each character and placing 
        %%  each character in their specific eccentricity and form factor range
        %% 
        %%  in order to obtain those ranges, the method we used was to check
        %%  the minimum and maximum eccentricty and form factor values for
        %%  each character in all of the picture samples.
        %%
        %%  there is no specific order for those characters
        %%  we encountered them sequentially and added them accordingly
        
       
       if eccentricityVector(i) > 0.70 && eccentricityVector(i) < 0.75
           fprintf('5');
       elseif eccentricityVector(i) > 0.75 && eccentricityVector(i) < 0.8
            fprintf('2');
       elseif eccentricityVector(i) > 0.90 && eccentricityVector(i) < 0.95
            fprintf('-');
       elseif eccentricityVector(i) > 0.60 && eccentricityVector(i) < 0.70
           if(formFactorVector(i) > 0.2932 && formFactorVector(i) < 0.3039)
                fprintf('7');
           elseif formFactorVector(i) > 0.2482 && formFactorVector(i) < 0.2735
                fprintf('N');
           elseif formFactorVector(i) > 0.5285 && formFactorVector(i) < 0.5548
                fprintf('P');
           end
       elseif eccentricityVector(i) > 0.80 && eccentricityVector(i) < 0.82
            fprintf('M');
       elseif eccentricityVector(i) > 0.82 && eccentricityVector(i) < 0.9
            fprintf('J');
       elseif eccentricityVector(i) > 0.35 && eccentricityVector(i) < 0.60
           if(formFactorVector(i) > 0.5579 && formFactorVector(i) < 0.5833)
               fprintf('D');
           elseif(formFactorVector(i) > 0.2214 && formFactorVector(i) < 0.2341)
               fprintf('X');
           elseif(formFactorVector(i) > 0.3481 && formFactorVector(i) < 0.3648)
               fprintf('9');
           end
       else
           fprintf('?');
       end
    end
    fprintf('\n');
end