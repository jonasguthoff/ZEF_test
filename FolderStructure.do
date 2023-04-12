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

	iefolder new subfolder EmployerSurvey, projectfolder("$GitHub")

	
	** Github - Baseline
	iefolder new round Baseline,           projectfolder("$GitHub") subfolder("EmployerSurvey")

	** Github - Endline
	iefolder new round Endline,            projectfolder("$GitHub") subfolder("EmployerSurvey")


	
	
	iefolder new subfolder HouseholdSurvey, projectfolder("$GitHub")

	
	** Github - Baseline
	iefolder new round HH_Baseline,           projectfolder("$GitHub") subfolder("HouseholdSurvey")

	** Github - Endline
	iefolder new round HH_Endline,            projectfolder("$GitHub") subfolder("HouseholdSurvey")

	
	

	
	iefolder new subfolder EmployerSurvey, projectfolder("$Sciebo")

	
	** Sciebo - Baseline
	iefolder new round Baseline,           projectfolder("$Sciebo") subfolder("EmployerSurvey")
	
	** Sciebo - Endline
	iefolder new round Endline,            projectfolder("$Sciebo") subfolder("EmployerSurvey")

	

	* Add readme files to all folders for github
	iegitaddmd, folder("$Sciebo/DataWork")  all automatic
	iegitaddmd, folder("$GitHub/DataWork")  all automatic 



* ******************************************************************************
* End of the Dofile !!!
* ******************************************************************************
