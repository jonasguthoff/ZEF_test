********************************************************************************
* ZEF Test - Github Training - Set up fodler structure

* Author: Jonas Guthoff
* Email: jguthoff@uni-bonn.de
********************************************************************************







* *******************************************************************************
* Set directories:
* *******************************************************************************



* Verify directory path by running

dis "`c(username)'"

if c(username)=="jonasguthoff" {
		global Sciebo   "/Users/jonasguthoff/sciebo/ZEF_test"
		global GitHub   "/Users/jonasguthoff/Github/ZEF_test"
}


* -> Generate immediately the parallel structure on Sciebo and Github  




********************************************************************************

* Create a DataWork folder for your new project
iefolder new project, projectfolder("$Sciebo")
iefolder new project, projectfolder("$GitHub")



** Employer Survey

	** Baseline
	iefolder new subfolder EmployerSurvey, projectfolder("$Sciebo")
	iefolder new round Baseline,           projectfolder("$Sciebo") subfolder("EmployerSurvey")

	** Endline
	iefolder new subfolder EmployerSurvey, projectfolder("$GitHub")
	iefolder new round Endline,            projectfolder("$GitHub") subfolder("EmployerSurvey")





	* Add readme files to all folders for github
	iegitaddmd, folder("$Sciebo/DataWork")  all automatic
	iegitaddmd, folder("$GitHub/DataWork")  all automatic 



* ******************************************************************************
* End of the Dofile !!!
* ******************************************************************************
