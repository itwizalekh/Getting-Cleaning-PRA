Getting and Cleaning Data peer assessment
------------------------------------------

This is my submission. It requires very little setup. Run it anywhere; if there is no "UCI HAR Dataset" in your working directory, the script will take care of downloading the zip file and unzipping it (and will delete the zip file to keep things clean). The only dependency (the reshape library) will be taken care of by the code.

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
