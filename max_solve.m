T = 10;
a = rand(T, 1);

lambda = T / (log(2) * (1 + sum(1./a)));

P = zeros(T, 1);
for i = 1:T
    % �򵥵���lambda����ȡ���ᵼ��ĳЩֵ�ǳ���
    % P(i) = max([0, (1/(lambda * log(2)) - 1/a(i))]); 
    P(i) = (1/(lambda * log(2)) - 1/a(i));
end
maxians = sum(log(1 + P.*a)/log(2));

