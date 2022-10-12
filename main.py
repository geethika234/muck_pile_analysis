from find_fac import length
from fine_tune import fine_tune
from manual import mancon
from histogram import plot
from unit_selection import get_units
from merge import merge
from datetime import date
import sys
import cv2
import MySQLdb
path = ''
try:
	path = str(sys.argv[1])+"\\" +str(sys.argv[2])
	buff1 = cv2.imread(path)
	buff2 = buff1.shape
except AttributeError:
	path = str(sys.argv[1])+"/" +str(sys.argv[2])
	buff1 = cv2.imread(path)
	buff2 = buff1.shape

acc_ball = float(input('Enter the diameter of the scaling object in cm: '))
scale = int(input('Scale down by: '))

#get factor to find actual lenght 
factor = length(path,acc_ball,scale)

# fine tune parameters for auto contouring
blurr_val,canny,size,dst_val = fine_tune(path,factor,scale)

#Tool to draw manual contours
diameter,fines,arr = mancon(path,blurr_val,canny,size,dst_val,factor,scale,str(sys.argv[2]),str(sys.argv[3]),str(sys.argv[4]))

#print(fines)
total = sum(fines)
total = float(float(total/arr)*100)
unit_bins = get_units(diameter)


#saving diameter
org_name = path.split('.')[0]
org_name = org_name[:-2]
out_name = org_name +'.txt'
diameter_string = ''
for i in diameter:
	diameter_string += str(i) + ' '
with open(out_name, "w") as file:
    file.write(diameter_string+' '+str(total))
img_name = str(sys.argv[2]).split('.')[0]
img_name = img_name[:-2]
img_name = img_name +'.txt'
db=MySQLdb.connect("75.126.169.58", "Xliconmys0618", "XlServMys1706#", "iocllive",3306,autocommit = True)
cursor = db.cursor()
lis=[int(sys.argv[3]),img_name,out_name,int(sys.argv[4]),4]
print(lis)
result_args = cursor.callproc('PythonUpdatePilesPhotos', lis)
cursor.close()
db.close()

dper = [1,10,25,50,75,99]
n = input('Enter x vals for Dx with spaces(enter for default):')
if n != '':
	dper = [int(i) for i in n.split(' ')]
	dper.sort()

#plot the histogram

plot(diameter,path,unit_bins,dper,total,0,str(sys.argv[2]),str(sys.argv[3]),str(sys.argv[4]))
merge(path,str(sys.argv[2]),str(sys.argv[3]),str(sys.argv[4]))
