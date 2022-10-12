# muck_pile_analysis

Command to run in cmd
-----------------------
$python main.py Image_folder Image_name PhotoID UserID
-----------------------

Arguments
-----------------------
Image_folder - folder path that contains the image
Image_name   - name of the image file
PhotoID      - Photo ID for Database (Any number works for the code not connected to database)
UserID	     - User ID for Database  (Any number works for the code not connected to database)
-----------------------


File Description
-----------------------
Input		- folder with input and output. 
find_fac.py 	- contains functions to find and compare the pixel length of scaling object with it's real size.
fine_tune.py	- contains functions to adjust the parameters the parameters.
histogram.py	- contains functions to make the plot(histogram).
main.py		- calling all the necessary functions.
manual.py	- contains the functions to perform manual contouring. 
merge.py	- contains the functions to plot a cumulative histogram.
tkSliderWidget	- contains custom canvas for tkinter popout windows.
unit_selection	- contains the functions to take user inputs to make the histogram. 


IOCL_DB_SCRIPT_20210505.sql - script provided by start up to connect to database.
PythonUpdatePilesPhotos.sql - script provided by start up containing the procedure.

ExampleOutput	- has the output for one of the images after analysis for reference.
-----------------------


Other Tips
-----------------------
* To only run the application without db connections, one can comment out the db connection procedure calls in the python files.
* To connect to db, use appropriate ("Hostname","dbusername","password","dbname","port") in sql scripts and main.py.
* The input image file names should be as per the naming convention, one can adjust the code to work without the convention.
-----------------------
