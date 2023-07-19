import numpy as np
import os,sys,time

#info:
#pearson corrcoef formula between f and g, vectors of size N:
# (( (f-f.mean()) @ (g-g.mean()).T )/N )/(f.std()*g.std())

def shift_right(a, shift):
    shift = shift % len(a)
    return np.concatenate((np.zeros(shift), a[:-shift]))

def shift_left(a, shift):
    shift = shift % len(a)
    return np.concatenate((a[shift:], np.zeros(shift)))


'''
### debug mode with lots of prints
#works for even sizes of f and g (aslo f and g must be vectors of same size)
def normxcorr1D_custom(f,g):
    assert f.ndim==1 and g.ndim==1
    N = f.size
    cc = np.zeros(N)
    for i in range(N):
        if i<=(N/2):
            offset = int( N-(i+N/2) )
            print('offset=',offset)
            g_shift = shift_left(g,offset)
        else:
            offset = int( i-(N/2) )
            print('offset=',offset)
            g_shift = shift_right(g,offset)
        print('-------------------------')
        print('lag=',i)
        print('f=',f)
        print('g_sh=',g_shift)
        
        cc[i] = (( (f-f.mean()) @ (g_shift-g_shift.mean()).T )/N )/(f.std()*g_shift.std())
        print('cc[',i,']=',cc[i])
        print('---------------------------------')
    return cc
'''

def normxcorr1D_custom(f,g):
    assert f.ndim==1 and g.ndim==1
    N = f.size
    cc = np.zeros(N)
    for i in range(N):
        if i<=(N/2):
            offset = int( N-(i+N/2) )
            g_shift = shift_left(g,offset)
        else:
            offset = int( i-(N/2) )
            g_shift = shift_right(g,offset)
        cc[i] = (( (f-f.mean()) @ (g_shift-g_shift.mean()).T )/N )/(f.std()*g_shift.std())
    return cc

if __name__=='__main__':
    x=np.array([0.1,0.1,1,2,3,4,5,6])
    y=np.array([1,2,3,4,5,6,-1.0,-2.0])

    #x = np.array([0.0,1,2,3])
    #y=np.array([1,2,3,0.0])

    xc = normxcorr1D_custom(x,y)

    print('cross-correlation of x and y =', xc)
