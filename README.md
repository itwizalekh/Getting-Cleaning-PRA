Getting and Cleaning Data peer assessment
------------------------------------------

This is my submission for the JHU/Coursera [Getting and Cleaning Data](https://www.coursera.org/course/getdata) class [peer assessment](https://class.coursera.org/getdata-002/human_grading/view/courses/972080/assessments/3/submissions) (enrollment required for access). My script requires very little setup. Run it anywhere; if there is no directory named "UCI HAR Dataset" in your working directory, the script will take care of downloading [the zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipping it (and will delete the zip file to keep things clean). The source data will remain in the working directory upon completion of the script.

The only R library dependency (the reshape library) will be installed by the code if it isn't available.

Obviously, if the code needs to handle source data acquisition or library installation itself, it'll need an internet connection.

```bash
> source("run_analysis.R")
[1] "Script completed. To check results, run read.table function on tidyoutput.txt"
>
```

The results are outputted to tidyoutput.txt. To test the output, consider running the following checks in the same working directory:

```bash
> tidyOutput <- read.table("tidyoutput.txt")
> nrow(tidyOutput)
[1] 180
> ncol(tidyOutput)
[1] 68
> print(head(tidyOutput))
...
```

Thanks for your time!
-VJ
