from histogram import plot
from unit_selection import get_units
import os
def merge(img_path,name,PTrnpilesphotosId,PUserby):
	files = []
	k = img_path.rfind("-")
	img_pat = img_path[:k]
	k = name.rfind("-")
	name = name[:k]
	k = img_pat.rfind("/")
	if k== -1:
		k = img_pat.rfind("\\")
	img_pa = img_pat[:k+1]
	all_files = os.listdir(img_pa)
	txt_files = filter(lambda x: x[-4:] == '.txt', all_files)
	for i in txt_files:
		p = i[:-4]
		pi = p.rfind("-")
		p = p[:pi]
		if img_pat[k+1:] == p:
			files.append(img_pa+i)

	#merged diameters
	diameter = []
	fines = []
	for file in files:
		with open(file) as f:
			content = f.read().split()
			fines.append(float(content[-1]))
			diameter += list(map(float,content[:-1]))
	try:
    		total = round(sum(fines)/len(fines),2)
	except:
    		total = round(sum(fines),2)
	unit_bins = get_units(diameter)
	dper = [1,10,25,50,75,99]
	n = input('Enter x vals for Dx with spaces(enter for default):')
	if n != '':
		dper = [int(i) for i in n.split(' ')]
		dper.sort()
	plot(diameter,img_pat,unit_bins,dper,total,1,name,PTrnpilesphotosId,PUserby)
