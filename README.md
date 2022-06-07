# Welcome to the outdoorsy app!

## Features:

### **Upload your data**
Upload your CSV or pipe-delimited files containing your vehicle data. Currently
your data files must contain the following columns in the following order and have
no header row:

```
first_name,last_name,email,vehicle_type,vehicle_name,length
```

Here are two examples of valid input data file contents:

```
Greta,Thunberg,greta@future.com,sailboat,Fridays For Future,32’
Xiuhtezcatl,Martinez,martinez@earthguardian.org,campervan,Earth Guardian,28 feet
Mandip,Singh Soin,mandip@ecotourism.net,motorboat,Frozen Trekker,32’
Jimmy,Buffet,jb@sailor.com,sailboat,Margaritaville,40 ft
```

and

```
Ansel|Adams|a@adams.com|motorboat|Rushing Water|24’
Steve|Irwin|steve@crocodiles.com|RV|G’Day For Adventure|32 ft
Isatou|Ceesay|isatou@recycle.com|campervan|Plastic To Purses|20’
Naomi|Uemura|n.uemura@gmail.com|bicycle|Glacier Glider|5 feet
```

### **Analyze your data**
...by _looking at it_

### **Sort your data**
...by either name (last name + first name) or vehicle type

Enjoy!

## Getting started

* Install the version of Ruby specified in the `.ruby-version` file here
* Run `bundle install` to install dependencies
* Run `bin/rails db:create` to create your local SQLite database
* Run `bin/rails server` to start your local server
* Navigate to http://localhost:3000/ and start uploading and analyzing your business data!

## Deploying the app
* Forthcoming

## Contributing
* How to run the test suite

## Things to think about/upcoming features:
* Improve styles
* Test coverage
* SQLite sorts upper case letters before lower case letters, which is not ideal for our user-facing sort feature
* We currently have a denormalized data model, with person data alongside vehicle information in the vehicles table
* As our data grows we will need to paginate or limit the size of our result set
* So far the data we have for this application is clean and consistent. But CSVs come in all shapes and sizes
* Factor out our text strings driving the UI using the Rails internationalization framework
