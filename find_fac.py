import cv2
import math
def length(path,acc_balldia,scale):
    fac = []
    def detect_ball_length(x1, y1, x2, y2):
        x_dist = (x2 - x1)
        #global fac
        y_dist = (y2 - y1)
        w=math.sqrt(x_dist * x_dist + y_dist * y_dist)
        fac.append(acc_balldia/w)
        #print(fac)
        #cv2.destroyAllWindows()
    
    def line_drawing(event,x,y,flags,param):
         global pt1_x,pt1_y,pt2_x,pt2_y,drawing
         if event==cv2.EVENT_LBUTTONDOWN:
                drawing=True
                pt1_x,pt1_y=x,y
                m=x
                n=y
            
         elif event==cv2.EVENT_LBUTTONUP:
                drawing=False
                cv2.line(img,(pt1_x,pt1_y),(x,y),color=(0,255,0),thickness=3)
                pt2_x,pt2_y=x,y
                o=x
                p=y
                detect_ball_length(pt1_x,pt1_y,pt2_x,pt2_y)
                
                
    img = cv2.imread(path)
    img = cv2.resize(img,(img.shape[:2][1]//scale,img.shape[:2][0]//scale))
    cv2.namedWindow('Ball length')
    cv2.setMouseCallback('Ball length',line_drawing) 
    #cv2.imshow('Ball length',img) 
    while(1):
        cv2.imshow('Ball length',img)
        if cv2.waitKey(1) & 0xFF == 27:
            
            break
    cv2.destroyAllWindows()
    return(fac[0])

	
