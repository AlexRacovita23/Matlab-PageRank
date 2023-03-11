function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
    a=1/(val2-val1);
    b=-val1/(val2-val1);
    dim_vector = size(x);
    N = dim_vector(1);
    y=zeros(N,1);

    for i=1:N
        if x(i)<val1
            y(i)=0;
        end
        if x(i)val2
            y(i)=1;
        end
        if a*x(i)+b<0
            y(i)=0;
            continue
        end
        y(i)=a*x(i)+b;
    end
end
            


	