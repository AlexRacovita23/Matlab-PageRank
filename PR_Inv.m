function Inv = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
    sz = size(A);
    n = sz(1);
    Q = zeros(n);
    R  = zeros(n);
    for i=1:n 
        R(i,i) = norm(A(1:n, i));
        Q(1:n,i) = A(1:n, i)/R(i,i);
        for j=i+1:n
            R(i,j)=(Q(1:n,i).')*A(1:n,j);
            A(1:n,j)=A(1:n,j)-Q(1:n,i)*R(i,j);
        end
    end
    Q = Q';
    Inv = zeros(n, n);
    for i=1:n
        Inv(n,i) = Q(n,i)/R(n,n);
        
        for j = n-1:-1:1
            Inv(j,1:n) = (Q(j,1:n)-R(j,j+1:n) * Inv(j+1:n,1:n))/R(j,j);
        end
    end
    end
