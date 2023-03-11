function [R1, R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);
    values = zeros(1,2);
    contor = 1;
    fileID = fopen (nume,'r');
    tline = fgetl(fileID);
    V = str2num(tline);
    N = V(1);
    while ischar(tline)
       X = str2num(tline);
       tline = fgetl(fileID);
       sz = size(X);
       if (sz (2) == 1)
            if(X <= 1)
            values(contor) = X;
            contor=contor+1;
            end
       end
    end
    [PR_sortat, indice] = sort(R2, 'descend');
    y = Apartenenta(PR_sortat,values(1),values(2));
    nume = [nume, '.out'];
    file = fopen(nume, "w");
    fprintf(file, "%d\n", N);
    for i = 1:N
        fprintf(file, "%.6f\n", R1(i));
    end
    fprintf(file, "\n");
    for i = 1:N
        fprintf(file, "%.6f\n", R2(i));
    end
    fprintf(file, "\n");
    for i = 1:N
        fprintf(file, "%d %d %.6f\n", i, indice(i), y(i));
    end
    fclose(file);

end