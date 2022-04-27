# -*- coding: utf-8 -*-
"""
Created on Sun Dec 20 19:05:14 2020

@author: good good study
"""

import math
fuc=0.5
A=[]
for i in range(50):
    A.append(fuc/50)
    fuc+=0.1
B=[(i+1)*math.pi/(50) for i in range(100)]#一个圆上不同位置
n=1.6
r2=1.047
Gam=[]
for i in range(11):
    Gam.append(0.314*i)
Gam=[1.047,1.832,2.617,4.287]
def fuck(gam):
    dic={}
    for a in A:
        dic[a]=[]
        for b in B:
            es=math.sin(math.atan(math.cos(b)/(math.sin(b)*math.cos(a))))
            ep=math.cos(math.atan(math.cos(b)/(math.sin(b)*math.cos(a))))
            a2=math.asin(math.sin(a)/n)
            ep2=(2*math.cos(a)/(n*math.cos(a)+math.cos(a2)))*ep
            es2=(2*math.cos(a)*math.sin(a2)/math.sin(a+a2))*es
            e2=ep2*ep2+es2*es2
            e2=math.pow(e2,0.5)
            r1=math.atan(es2/ep2)-math.atan(es/ep)
            bet=math.atan(es2/ep2)
            es3=e2*math.sin(bet+r2)
            ep3=e2*math.cos(bet+r2)
            es4=(2*math.cos(a2)*math.sin(a)/math.sin(a+a2))*es3
            ep4=(2*n*math.cos(a2)/(math.cos(a2)+n*math.cos(a)))*ep3
            r3=math.atan(es4/ep4)-math.atan(es3/ep3)
            r=r1+r2+r3
            gam2=math.atan(math.cos(b-gam)/(math.sin(b-gam)*math.cos(a)))-math.atan(math.cos(b)/(math.sin(b)*math.cos(a)))
            fck=math.cos(gam2-r)
            dic[a].append(fck*fck)
    st=''
    for a in A:
        i=0
        for b in B:
            st+=str(math.tan(a)*math.cos(b))+' '+str(math.tan(a)*math.sin(b))+' '+str(dic[a][i])+'\n'
            i+=1
    with open(str(gam)+'.txt','w') as file:
        file.write(st)

for i in Gam:
    fuck(i)

'''
lst='['
for i in dic:
    lst=lst+str(dic[i])
    lst=lst+';'
lst=lst[0:len(lst)-1]
lst=lst+']'
print(lst)
print(B)
'''
'''
string=''
print(dic.keys(),'   ',dic[key])
for key in dic.keys():
    string=string+str(key)+'\t'+str(dic[key])+'\n'
print(string)
'''