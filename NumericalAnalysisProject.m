clear
clc

j=1;   % j is for number of guesses that user wants to make
num_guess=input('How Many Guesses Do You Want To Make After The First One: ');
guess=input('Input Your First Guess For dy(1): '); % Guess for y'(1)
while j<=num_guess
    % ode23 gets y(1)=1/2 and y'(1)=guess and gives x with interval of 0.1
    % and y and y' for those x
    [X,YandDy]=ode23(@GivenF,[1 2],[1/2 guess]);
    Difference=YandDy(length(X),1)-1/3;
    % 1/3 is the Amount for y(2)=1/3
    % YandDy(length(X),1) is the amount that we get from ode23 for y(2)
    
    % If Difference is more than is it means that we have to decrease our
    % guess for y'(1)
    
    % Keep in mind that the correct guess for y'(1) is -0.25 which we get
    % from the correct function of y
    if Difference>0
        disp('Your Guess is High');
        disp('Decrease!')
        guess=input('Your New Decreased Guess: ');
    elseif Difference<0 && guess~=-0.25;
        disp('Your Guess is Low Increase');
        disp('Increase!')
        guess=input('Your New Increased Guess: ');
    else
        % When we get right guess we don't have to make anymore
        disp('Correct Guess!');
        disp('You Do Not Have To Make Any More Guesses')
        j=num_guess+1;
    end
    % This part is for getting the error
    for i=1:length(YandDy)
        error(i)=YandDy(i,1)-1/(X(i,1)+1);
    end
    j=j+1;
end
figure(1);
subplot(3,1,1);
plot(X,YandDy(:,1));
title('Shooting Method');
subplot(3,1,2);
[X1,YandDy1]=ode23(@GivenF,[1 2],[1/2 -1/4]);
plot(X1,YandDy1(:,1));
title('Main Function');
subplot(3,1,3);
plot(X,error);
title('Error');