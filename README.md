Getting and Cleaning Data peer assessment
------------------------------------------

This is my submission. It requires very little setup. Run it anywhere; if there is no directory named "UCI HAR Dataset" in your working directory, the script will take care of downloading the zip file and unzipping it (and will delete the zip file to keep things clean). The source data will remain in the working directory upon completion of the script.

The only dependency (the reshape library) will be taken care of by the code.

Obviously, if the code needs to handle source data acquisition or library installation itself, it'll need an internet connection.

```bash
>source("run_analysis.R")
[1] "Script completed. To check results, run read.table function on tidyoutput.txt"
>
```

The results are outputted to tidyoutput.txt. To test the output, consider running the following in the same working directory:

```bash
>tidyOutput <- read.table("tidyoutput.txt")
>print(head(tidyOutput))
```

Thanks for your time!
-VJ
