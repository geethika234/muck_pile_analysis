import numpy as np
import imutils
import cv2
import cv2 as cv
import os
from skimage import morphology, measure
import argparse
import skimage.io as io
import matplotlib.pyplot as plt
import time

from skimage import color
from functools import partial
from mpl_toolkits.mplot3d import Axes3D

diameters = []

def process_one_image(val,path,factor,scale):
    img = cv2.imread(path)
    x,y,_ = img.shape
    img = cv2.resize(img,(y//scale,x//scale))
    
    kernel = np.ones((5,5),np.uint8)
    blurr_val = cv2.getTrackbarPos('blur','blur')
    canny = cv2.getTrackbarPos('canny','canny')
    size = cv2.getTrackbarPos('size','Low size')
    #size = size/10
    dst_val = cv2.getTrackbarPos('dst_va','dst_va')
    dst_val = dst_val/100
    temp_image = img.copy()
    img = cv2.bilateralFilter(img,blurr_val,75,75)
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    
    
    #gray = cv2.Canny(gray,canny_val,2*canny_val)
    gray = cv.Canny(gray, threshold1 = canny , threshold2 = 2*canny)
    
    
    
    gray = cv2.dilate(gray,kernel,iterations = 1)
    ret, thresh = cv2.threshold(gray,0,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)


    # noise removal
    opening = cv2.morphologyEx(thresh,cv2.MORPH_OPEN,kernel, iterations = 1)
    closing = cv2.morphologyEx(opening,cv2.MORPH_CLOSE,kernel, iterations = 1)
  
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
        c = max(cnts, key=cv2.contourArea)
        for c in cnts:
            contours.append(c)
    contours = sorted(contours, key=lambda x: cv2.contourArea(x),reverse = True)[2:]
        
    global diameters
    for c in contours:
        #Ignore small contours
        x,y,_ = img.shape
        if cv2.contourArea(c) > 1 and cv2.contourArea(c) < (x*y)/4:
            color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
            ((x, y), r) = cv2.minEnclosingCircle(c) #finding diameters of contours
            l = round(2*r*factor,2)
            if l > size:
                diameters.append(l)
                cv2.drawContours(temp_image,[c], 0, color,2)
                #cv2.circle(temp_image, (int(x), int(y)), int(r),(0,255,0), 1)
                #cv2.putText(temp_image, "{}cm".format(2*round(r*factor,2)), (int(x) - 10, int(y)),cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0,255,0), 2)
                
    cv2.imshow('image', temp_image)
    return #[temp_image,contours]


def fine_tune(path,factor,scale):

	cv2.namedWindow('blur', cv2.WINDOW_NORMAL)
	cv2.createTrackbar('blur','blur',25,500,partial(process_one_image,path=path,factor = factor,scale = scale))

	cv2.namedWindow('canny', cv2.WINDOW_NORMAL)
	cv2.createTrackbar('canny','canny',100,255,partial(process_one_image,path=path,factor = factor,scale = scale))
	cv2.namedWindow('Low size', cv2.WINDOW_NORMAL)
	cv2.createTrackbar('size','Low size',1,500,partial(process_one_image,path=path,factor = factor,scale = scale))
	cv2.namedWindow('dst_va', cv2.WINDOW_NORMAL)
	cv2.createTrackbar('dst_va','dst_va',10,500,partial(process_one_image,path=path,factor = factor,scale = scale))


	process_one_image(0,path,factor,scale)

	cv2.waitKey()
	blurr_val = cv2.getTrackbarPos('blur','blur')
	canny = cv2.getTrackbarPos('canny','canny')
	size = cv2.getTrackbarPos('size','Low size')
	#size = size/10
	dst_val = cv2.getTrackbarPos('dst_va','dst_va')
	dst_val = dst_val/100
	cv2.destroyAllWindows()
	return (blurr_val,canny,size,dst_val)
	
	

