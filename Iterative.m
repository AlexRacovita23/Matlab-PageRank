function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    fileID = fopen (nume,'r');
    tline = fgetl(fileID);
    V = str2num(tline);
    N = V(1);
    matrice_adiacenta = zeros(N,N);
    while ischar(tline)
       X = str2num(tline);
       tline = fgetl(fileID);
       sz = size(X);
       if (sz (2) > 2)
            for l = 3:(X(2) + 2)
                if X(1)~=X(l)
                matrice_adiacenta((X(1)), (X(l))) = 1;
                end
            end
       end
    end
    K = zeros(N,N);
    for i = 1:1:N
        for j = 1:1:N
            if matrice_adiacenta(i,j) == 1
                K(i,i) = K(i,i) + 1;
            end
        end
    end
    M = (K^(-1) * matrice_adiacenta).';
    R = zeros(N,1);
    for k = 1:1:N
        R(k,1) = 1/N;
    end
    R_ant = R;
    Ones = ones(N,1);
    D = str2num(d);
    EPS = str2num(eps);
    R = (M*R)*D + Ones*((1-D)/N);
    while (norm (R-R_ant)>=EPS)
        R_ant = R;
        R = M*R*D + ((1-D)/N)*Ones;
    end
    fclose(fileID);
    end

    