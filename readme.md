# 采用二分法求注水线
## 问题背景
在所给的**实验二：物理层信道容量分析实验.pdf**文件中
## 解决方法
1. max_cvx.m文件利用了cvx工具解决问题
2. max_solve.m文件在不考虑小于零的情况下利用解析解求得答案
3. max_solve_1_1.m文件利用二分法，在考虑小于的条件下求出解析解
## 注意
* 文档格式是GB2312，github会出现乱码
* maxElement要加上一个1/T，以防止sum(max(b)) < 1这种极端情况发生(感谢室友的提醒)
