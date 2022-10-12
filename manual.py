import cv2
import numpy as np
import random as rng
from functools import partial
from datetime import datetime
import MySQLdb
pt1_x , pt1_y = None , None
drawing = False

def process_one_image(img_path,blur_val,cann,size,dst_val,factor,scale):
	img = cv2.imread(img_path)
	#img = cv2.resize(img, (1500, 1000))
	#img= cv2.add(img,np.array([-50.0]))
	img = cv2.resize(img, (img.shape[:2][1]//scale,img.shape[:2][0]//scale))
	temp_image = img.copy()
	temp = img.copy()
	img = cv2.bilateralFilter(img,blur_val,75,75)
	
	#gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY,(0.1,0.2,0.7),1)
	gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
	kernel = np.ones((5,5),np.uint8)
	#gray = cv2.GaussianBlur(gray,(5,5),0)
	#gray = cv2.Canny(gray,50,100,(5,5),5,8)
	gray = cv2.Canny(gray,cann,2*cann)
	gray = cv2.dilate(gray,kernel,iterations = 1)
	ret, thresh = cv2.threshold(gray,0,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)

	# noise removal
	kernel = np.ones((5,5),np.uint8)
	#kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(5,5))
	opening = cv2.morphologyEx(thresh,cv2.MORPH_OPEN,kernel, iterations = 1)
	closing = cv2.morphologyEx(opening,cv2.MORPH_CLOSE,kernel, iterations = 1)
	#closing = cv2.erode(closing,kernel,iterations = 2)
	#cv2.imshow('mati',closing)
	
	# sure background area
	sure_bg = cv2.dilate(thresh,kernel,iterations=1)

	# Finding sure foreground area
	dist_transform = cv2.distanceTransform(sure_bg,cv2.DIST_L2,3)

	# Threshold
	ret, sure_fg = cv2.threshold(dist_transform,dst_val*dist_transform.max(),255,0)

	# Finding unknown region
	sure_fg = np.uint8(sure_fg)
	unknown = cv2.subtract(sure_bg,sure_fg)

	# Marker labelling
	ret, markers = cv2.connectedComponents(sure_fg)

	# Add one to all labels so that sure background is not 0, but 1
	markers = markers+1

	# Now, mark the region of unknown with zero
	markers[unknown==255] = 0

	markers = cv2.watershed(img,markers)
	
	img[markers == -1] = [255,0,0]

	#------------------------------------
	import imutils
	import random as rng
	contours = []

	# loop over the unique labels, and append contours to all_cnts
	labels = markers
	for label in np.unique(labels):
			if label == 0:
					continue

			# draw label on the mask
			mask = np.zeros(thresh.shape, dtype="uint8")
			mask[labels == label] = 255

			# detect contours in the mask and grab the largest one
			cnts = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
			#im2, cnts, hierarchy = cv2.findContours(mask.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
			cnts = imutils.grab_contours(cnts)
			#c = max(cnts, key=cv2.contourArea)
			for c in cnts:
				contours.append(c)

	# Draw new contours in red color
	for c in contours:
			#Ignore small contours
			x,y,_ = img.shape
			if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
				color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
				((x, y), r) = cv2.minEnclosingCircle(c)
				#color = (255,0,0)
				l = round(2*r*factor,2)
				if l > size:
								cv2.drawContours(temp_image,[c], 0, color,2)
				'''((x, y), r) = cv2.minEnclosingCircle(c)
				cv2.circle(temp_image, (int(x), int(y)), int(r), color, 1)
				cv2.putText(temp_image, "#{}".format(2*round(r,2)), (int(x) - 10, int(y)),cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)'''
				
	#print(i)
	#print(contours)
	return (temp_image,contours)

def er_add(cnts,fine_cnts,cnpoint):
	valp = cv2.getTrackbarPos('valp','valp')
	#print(cnpoint)
	if valp == 2:
		cnts.append(cnpoint)
	if valp == 1:
		fine_cnts.append(cnpoint)



#brute force for case 2
#brute force
def remove_inside_points(contours,fine_cnts,ref_contour):
	try:
		for i in range(len(contours)):
			cnt = contours[i]
			cnt_zip = [[ref_contour, tuple(x[0])] for x in contours[i]]
			find = lambda x: cv2.pointPolygonTest(x[0], x[1], False)
			cnt_check = np.array(list(map(find,cnt_zip)))
			cnt_out = cnt[cnt_check <= 0] #points inside are removed, only points on and outside stays
			contours[i] = cnt_out
		for i in range(len(fine_cnts)):
			cnt = fine_cnts[i]
			cnt_zip = [[ref_contour, tuple(x[0])] for x in fine_cnts[i]]
			find = lambda x: cv2.pointPolygonTest(x[0], x[1], False)
			cnt_check = np.array(list(map(find,cnt_zip)))
			cnt_out = cnt[cnt_check <= 0] #points inside are removed, only points on and outside stays
			fine_cnts[i] = cnt_out
	except:
		return(0,0)

	return (contours,fine_cnts)

def draw(path, cnts,fine_cnts, factor,size,scale):
	temp_image = cv2.imread(path)
	temp_image = cv2.resize(temp_image, (temp_image.shape[:2][1]//scale,temp_image.shape[:2][0]//scale))
	for c in cnts:
				#Ignore small contours
				x,y,_ = temp_image.shape
				if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
					color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
					#color = (255,0,0)
					((x, y), r) = cv2.minEnclosingCircle(c)
					#color = (255,0,0)
					l = round(2*r*factor,2)
					if l > size:
									cv2.drawContours(temp_image,[c], 0, color,2)
	for c in fine_cnts:
				#Ignore small contours
				x,y,_ = temp_image.shape
				if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
					#color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
					#color = (255,0,0)
					((x, y), r) = cv2.minEnclosingCircle(c)
					#color = (255,0,0)
					l = round(2*r*factor,2)
					if l > size:
						cv2.drawContours(temp_image,[c], 0, (0,0,255),2)
	#Saving contoured image to output file
	org_name = path.split('/')[-1]
	out_name = 'output/'+ org_name.replace('_O.','_F.')
	cv2.imwrite(out_name,temp_image)
	
	return(temp_image)
				
	
#def drawing_contour(img,cnts,path):
def drawing_contour(img):
		contour_points = []
		def line_drawing(event,x,y,flags,param):#, drawing = False,pt1_x = None,pt1_y = None):
				global pt1_x,pt1_y,drawing
				if event==cv2.EVENT_LBUTTONDOWN:
						drawing=True
						pt1_x,pt1_y=x,y
						#print(path)
						#print(pt1_x,pt1_y)
						contour_points.append([[pt1_x,pt1_y]])

				elif event==cv2.EVENT_MOUSEMOVE:
						if drawing==True:
								cv2.line(img,(pt1_x,pt1_y),(x,y),color=(255,0,0),thickness=5)
								pt1_x,pt1_y=x,y
								#print(pt1_x,pt1_y)
								contour_points.append([[pt1_x,pt1_y]])

				elif event==cv2.EVENT_LBUTTONUP:
						drawing=False
						cv2.line(img,(pt1_x,pt1_y),(x,y),color=(255,0,0),thickness=5) 
						#print(pt1_x,pt1_y)
						contour_points.append([[pt1_x,pt1_y]])
						'''cnts = remove_inside(cnts,contour_points)
						cnts.append(contour_points)
						img = draw(path, cnts)'''


		#img = cv2.imread(path)
		x,y,_ = img.shape
		#img = cv2.resize(img,(y//4,x//4))
		cv2.namedWindow('LASSO',cv2.WINDOW_NORMAL)

		cv2.setMouseCallback('LASSO',line_drawing)#,drawing = False,pt1_x = None,pt1_y = None))

		while(1):
				cv2.imshow('LASSO',img)
				if cv2.waitKey(1) & 0xFF == 27:
						break
						
		contour_points = np.array(contour_points)
		return contour_points


def calc_dia(cnts,fine_cnts,factor,size,img):
	dia=[]
	fines=[]
	temp_image = img.copy()
	for c in cnts:
			#Ignore small contours
			x,y,_ = img.shape
			if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
				#color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
				((x, y), r) = cv2.minEnclosingCircle(c)
				#color = (255,0,0)
				l = round(2*r*factor,2)
				if l > size:
					dia.append(l)
					cv2.putText(temp_image, "#{}".format(2*round(r*factor,2)), (int(x) - 10, int(y)),cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255,0,0), 2)
	for c in fine_cnts:
			#Ignore small contours
			x,y,_ = img.shape
			if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
				fines.append(cv2.contourArea(c))
				cv2.putText(temp_image, "#{}".format(2*round(r*factor,2)), (int(x) - 10, int(y)),cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0,0,0), 2)
	return(dia,temp_image,fines)
	
def NONE(val):
	pass

def mancon(img_path,blur_val,cann,size,dst_val,factor,scale,name,PTrnpilesphotosId,PUserby):
	temp_image,cnts = process_one_image(img_path,blur_val,cann,size,dst_val,factor,scale)
	cv2.namedWindow('valp', cv2.WINDOW_NORMAL)
	cv2.createTrackbar('valp','valp',0,2,NONE)
	fine_cnts = [] 
	while(1):
		contour_points = drawing_contour(temp_image)
		c,b = remove_inside_points(cnts,fine_cnts,contour_points) #added
		if c == 0:
			break
		else:
			cnts = c
			fine_cnts = b
		er_add(cnts,fine_cnts,contour_points)
		temp_image = draw(img_path, cnts,fine_cnts,factor,size,scale)
		
	diameter,dia_image,fines = calc_dia(cnts,fine_cnts,factor,size,temp_image)
	x,y,_ = temp_image.shape
	#print(cnts)
	k = img_path.rfind("O")
	img_pat = img_path[:k] + "F" + img_path[k+1:]
	k = name.rfind("O")
	img_name = name[:k] + "F" + name[k+1:]
	cv2.imwrite(img_pat,dia_image)
	cv2.destroyAllWindows()
	#print(fines)
	db=MySQLdb.connect("75.126.169.58", "Xliconmys0618", "XlServMys1706#", "iocllive",3306,autocommit = True)
	cursor = db.cursor()
	lis=[int(PTrnpilesphotosId),img_name,img_pat,int(PUserby),int(1)]
	print(lis)
	result_args = cursor.callproc('PythonUpdatePilesPhotos', lis)
	#com = 'call PythonUpdatePilesPhotos(18,"hi","h",5,"2021-5-15 16:46:00",1);'
	#print(com)
	#cursor.execute(com)
	cursor.close()
	db.close()
	return(diameter,fines,x*y)


