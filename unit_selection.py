import tkinter as tk
from tkSliderWidget import Slider #custom library for lsl and usl

def get_units(diameter):

  root = tk.Tk()

  #unit selection
  v = tk.IntVar()
  v.set(2)  # initializing the choice, i.e. Python

  units = [("millimeters(mm)", 1),
     	     ("centimeters(cm)", 2),
      	     ("meters(m)", 3)]

  tk.Label(root, 
           text="""Select desired unit of measurement:""",
           justify = tk.LEFT,
           padx = 20).pack()

  for unit, val in units:
      tk.Radiobutton(root, 
                     text=unit,
                     padx = 20, 
                     variable=v, 
                     value=val).pack(anchor=tk.W)

  tk.Label(root,text="""Select number of bins for the graph output:""",justify = tk.LEFT,padx = 20).pack()

  #bins selection
  var = tk.IntVar()
  var.set(10)
  scale = tk.Scale( root, variable = var ,from_=1, to=50,orient=tk.HORIZONTAL)
  scale.pack()

  tk.Label(root,text="""Select LSL and USL values:""",justify = tk.LEFT,padx = 20).pack()

  #lsl and usl selection
  lsl = min(diameter)
  unit_factor = {1:10,2:1,3:0.01}
  slider = Slider(root, width = 400, height = 60, min_val = min(diameter)*unit_factor[v.get()], max_val = max(diameter)*unit_factor[v.get()], init_lis = [min(diameter)*unit_factor[v.get()] ,max(diameter)*unit_factor[v.get()]], show_value = True)
  slider.pack()


  root.mainloop()

  unit_dic = {1:'mm',2:'cm',3:'m'}
  bins = var.get()
  lsl,usl = slider.getValues()

  return unit_dic[v.get()],bins,lsl,usl

