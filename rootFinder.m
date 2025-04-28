%This is a function that finds the roots of a polynomial function
%Completed April 27, 2025
function roots = rootFinder(funcCoeff, funcPower, minDomain, maxDomain, tolerance)
%% Setup

    % initialize variables
    count = 1; 
    check = true; 
    terms = length(funcCoeff); 
    roots = []; 
    domain = linspace(minDomain, maxDomain, 1000*(maxDomain-minDomain)); % creates matrix of many values in domain
    vals = zeros(1, length(domain)); 

    for i = 1:length(domain) % assigns values to every domain
        for j = 1:terms
            vals(i) = funcCoeff(j) * domain(i).^funcPower(j) +vals(i);     
        end
    end

    leftBound = 0;
    rightBound = 0;

%% Find roots

    for i = 1:length(vals)-1 
            if vals(i) * vals(i+1) < 0 % if product is negative, 0 is crossed
                check = false;
                leftBound = domain(i);
                rightBound = domain(i+1);
                yVal1=0;
                yVal2=0;
                for j=1:terms
                    yVal1 = funcCoeff(j) * leftBound ^ funcPower(j) + yVal1;
                    yVal2 = funcCoeff(j) * rightBound ^ funcPower(j) + yVal2;
                end
            elseif abs(vals(i)) < tolerance % check for double roots (when it touches axis without crossing)
                roots(count) = domain(i);
                count = count+1;
            end
            iterations = 0; % 1000 max iterations through for loop

%% Bisection

                while ~check  && iterations <1000 % repeat until bisection complete
                    midPoint = (leftBound+rightBound)/2; 
                    yMid = 0;
                    for k = 1:terms % create all midpoint values
                        yMid = funcCoeff(k) * midPoint^funcPower(k) + yMid;
                    end
                    if yVal1*yMid<0  
                        rightBound = midPoint; % turns midpoint into new right end
                        yVal2=0;
                        for k=1:terms
                            yVal2=funcCoeff(k) * rightBound^funcPower(k) + yVal2;
                        end
                    elseif yMid*yVal2 <0 % turns midpoint into new left end
                        leftBound = midPoint;
                        yVal1=0;
                        for k = 1:terms
                            yVal1 = funcCoeff(k) * leftBound^funcPower(k) + yVal1;
                        end
                    end
                    if abs(yMid) < tolerance % ends loop (tolerance is 1E-9)
                        check = true;
                        roots(count) = midPoint;
                        count = count + 1;
                    end
                    iterations = iterations + 1;
                end
    end
end