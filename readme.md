# Wp Fresh

Sync production database and media to development environment.

### What?

+ Downloads and import database from production → development
+ Downloads media (wp-content/uploads/*) from production → development

Fresh!

Yes, there are fancy plugins for this as well. This is my simple goto solution.

+ Edit credentials, folders and paths in the ``.sh``` files to match your enviroment
+ Keep the cli folder where you like, for example in your project root
+ Go to the cli folder and run the script

```bash
	cd cli && ./wpfresh.sh
```

![Sample output](https://cloud.githubusercontent.com/assets/307676/9640777/6d9cc06c-51b3-11e5-91f2-5baf27b7abfe.png)

Sample output.