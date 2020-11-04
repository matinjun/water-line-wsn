%% 初始条件
T= 10;
a = rand(T, 1);
% b相当于1/a
b = 1./a;

%% 用二分法查找出注水线mid
minElement = min(b);
maxElement = max(b) + 1 / T; % 防止sum(max(b)) < 1
mid = mean([minElement, maxElement]);
tmp = check(mid,b);
% 非常接近0也可
while abs(tmp - 1) >= 0.0000001
    if tmp < 1
        minElement = mid;
    else
        maxElement = mid;
    end
    mid = mean([minElement, maxElement]);
    tmp = check(mid,b);
end
%% 通过注水线mid求出lambda，进而求出P以及最终结果
lambda =1/(mid * log(2));
P = zeros(T,1);
for i = 1:T
    P(i) = max([0, (1/(log(2)*lambda) - b(i))]);
end
maxans = sum(log2(1 + P.*a));
%% 绘制注水线
x = zeros(2 * T);
y1 = x;
y2 = x;
for i = 1:T
    x(2 * i -1) = i - 1;
    x(2 * i) = i;
    
    y1(2 * i - 1) = b(i);
    y1(2*i) = b(i);
    
    y2(2 * i - 1) = mid;
    y2(2 * i) = mid;
end
% 绿色线表示注水线，蓝色线表示1/a
plot(x, y1)
hold on;
plot(x, y2)
legend('1/a','注水线');

%% 约束条件函数
function res = check(x,b)
res = 0;
for i = 1:length(b)
    res = res + max([0, x-b(i)]);
end
end
