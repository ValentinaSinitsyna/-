function [ D A pX pY ] = Virezanie_obraza( S, X, Y, m )
% Функция вырезает конкретный образ с координатами верхней левой точки X,
% Y из матрицы S и записывает в матрицу D. В ответе возвращает вырезанный
% образ D и матрицу A без этого образа и поправки к координатам pX и pY.
%   Создаем и находим размер матрицы A
A = S;
[rows_A columns_A] = size(A);
% Создаём матрицы B и C шириной 1 столбец и высотой 1 строка
B = uint8(zeros(1,1));
C = B;
% Создаём поправочный коэфициент координаты X для матриц A и B
k_X = X - 1;
% Создаём поправочный коэфициент координаты Y для матриц A и B
k_Y = Y - 1;
% Создаём отдельный поправочный коэфициент для координаты Y для смещения в
% право
k_Y2 = 0;
% Создаём первую возбуждаемый пиксел аналогичный пикселу с координатами X,Y
% матрицы A
B(1,1) = 1;
C(1,1) = 1;
% Начинаем процесс проверки соседних пикселей и их возбуждения
stop = 0;
p = 0;
while stop == 0
    [rows_B columns_B] = size(B);
    stop = 1;
    for i = 1:rows_B
        for j = 1:columns_B
            if B(i,j) == 1;
                if j+k_Y-k_Y2-1 >= 1 && j == 1
                if (i+k_X-1 >= 1 && A(i+k_X-1,j+k_Y-k_Y2-1) == m) || (i+k_X+1 <= rows_A && A(i+k_X+1,j+k_Y-k_Y2-1) == m) || (A(i+k_X,j+k_Y-k_Y2-1) == m)
                    [rows_B2 columns_B2] = size(B);
                    B(:,2:columns_B2+1) = B;
                    B(:,1) = 0;
                    [rows_C columns_C] = size(C);
                    C(:,2:columns_C+1) = C;
                    C(:,1) = 0;
                    p = 1;
                end;
                else
                    p = 0;
                end;
                if i+k_X-1 >= 1 && A(i+k_X-1,j+k_Y-k_Y2) == m
                    B(i-1,j+p) = 1;
                    A(i+k_X-1,j+k_Y-k_Y2) = 0;
                end;
                if j+k_Y-k_Y2+1 <= columns_A && A(i+k_X,j+k_Y-k_Y2+1) == m
                    B(i,j+1+p) = 1;
                    A(i+k_X,j+k_Y-k_Y2+1) = 0;
                end;
                if i+k_X+1 <= rows_A && A(i+k_X+1,j+k_Y-k_Y2) == m
                    B(i+1,j+p) = 1;
                    A(i+k_X+1,j+k_Y-k_Y2) = 0;
                end;
                
                if i+k_X-1 >= 1 && j+k_Y-k_Y2+1 <= columns_A && A(i+k_X-1,j+k_Y-k_Y2+1) == m
                    B(i-1,j+1+p) = 1;
                    A(i+k_X-1,j+k_Y-k_Y2+1) = 0;
                end;
                if j+k_Y-k_Y2-1 >= 1 && A(i+k_X,j+k_Y-k_Y2-1) == m
                    B(i,j-1+p) = 1;
                    A(i+k_X,j+k_Y-k_Y2-1) = 0;
                end;
                if j+k_Y-k_Y2+1 <= columns_A && i+k_X+1 <= rows_A && A(i+k_X+1,j+k_Y-k_Y2+1) == m
                    B(i+1,j+1+p) = 1;
                    A(i+k_X+1,j+k_Y-k_Y2+1) = 0;
                end;
                if i+k_X+1 <= rows_A && j+k_Y-k_Y2-1 >= 1 && A(i+k_X+1,j+k_Y-k_Y2-1) == m
                    B(i+1,j-1+p) = 1;
                    A(i+k_X+1,j+k_Y-k_Y2-1) = 0;
                end;
                if j+k_Y-k_Y2-1 >= 1 && i+k_X-1 >= 1 && A(i+k_X-1,j+k_Y-k_Y2-1) == m
                    B(i-1,j-1+p) = 1;
                    A(i+k_X-1,j+k_Y-k_Y2-1) = 0;
                end;
                if p == 1
                    k_Y2 = k_Y2 + 1;
                end;
                A(i+k_X,j+k_Y-k_Y2) = 0;
                B(i,j+p) = 0;
                C(i,j+p) = 1;
                stop = 0;
            else
            end;
        end;
    end;
end;
[rows_C columns_C] = size(C);
D = zeros(rows_C+2, columns_C+2);
D(2:rows_C+1,2:columns_C+1) = C;
% Считаем поправки к координатам
pX = X-1;
pY = Y-k_Y2-1;
end

