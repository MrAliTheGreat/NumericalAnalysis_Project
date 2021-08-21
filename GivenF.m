function dy=GivenF(~,y)
    % This is the function that is mentioned in the project
    % dy(1) is y'(1) and dy(2) is y'(2)
    dy=zeros(2,1);
    dy(1)=y(2);
    dy(2)=y(1)^3-y(1)*y(2);
end