Mass Domain Availability Checker Script
=========

Mass Domain Availability Checker is an easy to use tool.

I was struggling with checking **ALL** 2 char and 3 char domains with the .hu TLD.  
I needed a tool to check them easily, so... here it is! :)

Version
----

0.0.1

Installation
--------------

If you do not have "whois" installed, the script tries to 'sudo apt-get install whois'
```sh
git clone http://github.com/hocza/mdac
cd mdac
./domain.sh
```

##### Configuration

* Edit domain.sh

```sh
###SLEEP
#By default the script uses a 500ms delay. 
#For some whois servers you should increase this limit
#sleep=seconds
sleep=0.5
```

Usage
--------------

```sh
./domain.sh <TLD> [string] [list]
```
* **TLD**  You have to give the top level domain. 
For example: ./domain.sh com
* **string**  (Optional) The string that indicates that the domain is not taken.   
 For example: ./domain.sh com "Not found"  
 Default is: "Not found"
* **list**  (Optional) Custom domain list/dictionary.


If you want to check for 3 char available domains, just simply:

```sh
./domain.sh co
```
Since the script checks for 3 char domains by default.

Some whois server gives different answer if the domain is still free. You can change the default *"Not found"* string to anything you wish.

```sh
./domain.sh pl "No information available"
```

You can use custom list. For example If you're looking for two char domains instead of three. (File of the Permutations of {a..z}{a..z} included: **2clist**)

```sh
./domain.sh co "Not found" 2clist
```

Or you can use any dictionary, separated with space or enter.

To-do
-----------


* Auto detect TLD and set the proper **string**


License
----

MIT

