   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               your_project_name                                      *
   *               MASTER DO_FILE                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PURPOSE:      Write intro to project here

       ** OUTLINE:      PART 0: Standardize settings and install packages
                        PART 1: Set globals for dynamic file paths
                        PART 2: Set globals for constants and varlist
                               used across the project. Install all user-contributed
                               commands needed.
                        PART 3: Call the task-specific master do-files 
                               that call all dofiles needed for that 
                               task. Do not include Part 0-2 in a task-
                               specific master do-file


       ** IDS VAR:      list_ID_var_here         //Uniquely identifies households (update for your project)

       ** NOTES:

       ** WRITTEN BY:   names_of_contributors

       ** Last date modified: 11 Apr 2023
       */

*iefolder*0*StandardSettings****************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 0:  INSTALL PACKAGES AND STANDARDIZE SETTINGS
   *
   *           - Install packages needed to run all dofiles called
   *            by this master dofile.
   *           - Use ieboilstart to harmonize settings across users
   *
   * ******************************************************************** *

*iefolder*0*End_StandardSettings************************************************
*iefolder will not work properly if the line above is edited

   *Install all packages that this project requires:
   *(Note that this never updates outdated versions of already installed commands, to update commands use adoupdate)
   local user_commands ietoolkit       //Fill this list will all user-written commands this project requires
   foreach command of local user_commands {
       cap which `command'
       if _rc == 111 {
           ssc install `command'
       }
   }

   *Standardize settings accross users
   ieboilstart, version(12.1)          //Set the version number to the oldest version used by anyone in the project team
   `r(version)'                        //This line is needed to actually set the version from the command above

*iefolder*1*FolderGlobals*******************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 1:  PREPARING FOLDER PATH GLOBALS
   *
   *           - Set the global box to point to the project folder
   *            on each collaborator's computer.
   *           - Set other locals that point to other folders of interest.
   *
   * ******************************************************************** *

   * Users
   * -----------
 
 
	 dis "`c(username)'"


    * Jonas
    if c(username)=="jonasguthoff"  {
    global Sciebo  "/Users/jonasguthoff/sciebo/ZEF_test"
    global Github  "/Users/jonasguthoff/Github/ZEF_test"
    }



* These lines are used to test that the name is not already used (do not edit manually)
*round*Endline*Baseline*********************************************************
*untObs*************************************************************************
*subFld*EmployerSurvey**********************************************************
*iefolder will not work properly if the lines above are edited


   * Project folder globals
   * ---------------------

   global dataWorkFolder         "$Sciebo/DataWork"
   global dataWorkGithub         "$Github/DataWork"

*iefolder*1*FolderGlobals*subfolder*********************************************
*iefolder will not work properly if the line above is edited


   *EmployerSurvey sub-folder globals
   global EmployerSurvey         "$dataWorkFolder/EmployerSurvey" 
   global EmployerSurvey_encrypt "$encryptFolder/Subfolder EmployerSurvey Encrypted" 
   
*iefolder*1*FolderGlobals*master************************************************
*iefolder will not work properly if the line above is edited

   global mastData               "$dataWorkFolder/MasterData" 

*iefolder*1*FolderGlobals*encrypted*********************************************
*iefolder will not work properly if the line above is edited

   global encryptFolder          "$dataWorkFolder/EncryptedData" 


*iefolder*1*RoundGlobals*rounds*Endline*Endline*********************************
*iefolder will not work properly if the line above is edited

   *Endline folder globals
   global Endline                "$dataWorkFolder/EmployerSurvey/Endline" 
   global Endline_encrypt        "$encryptFolder/Subfolder EmployerSurvey Encrypted/Round Endline Encrypted" 
   global Endline_dt             "$Endline/DataSets" 
   global Endline_do             "$dataWorkGithub/EmployerSurvey/Endline/Dofiles" 
   global Endline_out            "$Endline/Output" 


*iefolder*1*RoundGlobals*rounds*Baseline*Baseline*******************************
*iefolder will not work properly if the line above is edited

   *Baseline folder globals
   global Baseline               "$dataWorkFolder/EmployerSurvey/Baseline" 
   global Baseline_encrypt       "$encryptFolder/Subfolder EmployerSurvey Encrypted/Round Baseline Encrypted" 
   global Baseline_dt            "$Baseline/DataSets" 
   global Baseline_do            "$dataWorkGithub/EmployerSurvey/Baseline/Dofiles" 
   global Baseline_out           "$Baseline/Output" 

*iefolder*1*FolderGlobals*endRounds*********************************************
*iefolder will not work properly if the line above is edited


*iefolder*1*End_FolderGlobals***************************************************
*iefolder will not work properly if the line above is edited


*iefolder*2*StandardGlobals*****************************************************
*iefolder will not work properly if the line above is edited

   * Set all non-folder path globals that are constant accross
   * the project. Examples are conversion rates used in unit
   * standardization, different sets of control variables,
   * adofile paths etc.

   do "$dataWorkGithub/global_setup.do" 


*iefolder*2*End_StandardGlobals*************************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*RunDofiles**********************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 3: - RUN DOFILES CALLED BY THIS MASTER DOFILE
   *
   *           - When survey rounds are added, this section will
   *            link to the master dofile for that round.
   *           - The default is that these dofiles are set to not
   *            run. It is rare that all round-specfic master dofiles
   *            are called at the same time; the round specific master
   *            dofiles are almost always called individually. The
   *            exception is when reviewing or replicating a full project.
   *
   * ******************************************************************** *


*iefolder*3*RunDofiles*Endline*Endline******************************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the Endline master dofile
       do "$dataWorkGithub/EmployerSurvey/Endline/Endline_MasterDofile.do" 
   }


*iefolder*3*RunDofiles*Baseline*Baseline****************************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the Baseline master dofile
       do "$dataWorkGithub/EmployerSurvey/Baseline/Baseline_MasterDofile.do" 
   }

*iefolder*3*End_RunDofiles******************************************************
*iefolder will not work properly if the line above is edited

