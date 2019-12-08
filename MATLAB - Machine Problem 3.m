function [coefficients] = Prob3(datapoints)
	x = datapoints(:,1);
	y = datapoints(:,2);
	errorvector=zeros(1,length(datapoints)-1);

	if length(datapoints)<=10
	    for n=1:length(datapoints)-1
	        coefficients=polyfit(x,y,n);
	        f=polyval(coefficients,x);
	        errorvector(n)=norm(y-f);
	    end 
    else
	    for n=1:10
	      coefficients=polyfit(x,y,n);
	      f=polyval(coefficients,x);
	      errorvector(n)=norm(y-f);
	    end 
	end
	
	n=find(errorvector==min(errorvector));
	coefficients=polyfit(x,y,n);
	
	plot(min(x):0.0001:max(x),polyval(coefficients,min(x):0.0001:max(x)),'r'),hold on
	scatter(x,y,'markerfacecolor','k','markeredgecolor','k')
	axis tight
	grid on
	xlabel 'x_i'; ylabel 'y_i'; title 'Best Fit for Data Points (x_i, y_i)'
	legend('graph of best fit','data points(x_i,y_i)')
	

	end