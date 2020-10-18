function [im1] = imageProcessing(im1)
    im2=rgb2gray(im1); % Color information has been removed because we are only interested in the shapes of the objects
    im3=im2bw(im2, 0.2); % thresholding of the image with a 0.2 level
    im4=imcomplement(im3); % we have complemented the image here
    im5=imclose(im4,strel('disk',1,4)); % morphological closing
    im6=imcrop(im5, [50,15,280,50]); % cropping of the image
    [labels, numlabels]=bwlabel(im6); % connected components labelling algorithm
    im7=label2rgb(labels); % drawing the label matrix in color
    imshow(im7);
    stats = regionprops(labels, 'all'); % define an array of structures with the features of the blobs
    formFactorVector = []; % declaration of a vector which will hold the eccentricity value of every blob object
    eccentricityVector = []; % declaration of a vector which will hold the eccentricity value of every blob object
    for i = 1:numlabels
        formFactor = 4*pi*stats(i).Area/((stats(i).Perimeter)^2); %definition of the form factor formula
        formFactorVector(i) = formFactor; %populate the formFactorVector with the form factor values of each character
        eccentricity = stats(i).Eccentricity; %definition of the eccentricity value
        eccentricityVector(i) = eccentricity; %declaration of the eccentricity value
    end
    fprintf('Eccentricity values for all charaters of the tested license plate:\n');
    disp(eccentricityVector);
    fprintf('Form factor values for all charaters of the tested license plate:\n');
    disp(formFactorVector);
    recogniseCharacters(eccentricityVector, formFactorVector, numlabels); % recognise Characters function call
    
end