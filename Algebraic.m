function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
    Ones = ones(N,1);
    I = eye(N);
    D = str2num(d);
    R = PR_Inv(I-D*M)*((1-D)/N)*Ones;
    fclose(fileID);
end