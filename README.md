<img width="1193" alt="Screenshot 2022-03-24 at 17 54 28" src="https://user-images.githubusercontent.com/7869045/159970933-73add122-4237-490c-a5c1-8bb23254a716.png">

# Momentary Zine

Hackers & Designers build an open publishing station. At this publishing station everyone is invited to co-create and examine editorial design matters such as cross-media publishing. Using a thermal printer (receipt printer) as a point of departure the visitors were be the subject of the accumulating publication and simultaneously active content providers.

Thermo print has the characteristic of vanishing after a while. With an easy hack of the printer software we capture the temporality and actuality of the event and printed matter as such. The zine content is exclusively accumulated by speaking into a microphone. With text to speech technology the spoken word translates to text. Simultaneously an algorithm is will run an automized image search on google, grabbing some of the words randomly and adding them to the zine.


## Dependencies

 * Install WK HTML to Pdf. Download here http://wkhtmltopdf.org/downloads.html
  
## Usage

### Start the web server

  Download the momentary zine repository from github and unpack the .zip file https://github.com/hackersanddesigners/momentary-zine

  Run the following command in Terminal/Command-line from inside the directory/folder _momentary-zine-master_ you got from git. 

  ```$ sudo ./server.sh```
  
  If it asks for a password, it wants the pass of your laptop/computer. Don't worry it's in localhost.
  
  (If you want to stop the server, hit control + C)

### Configuration

**Microphone**

  If you have attached an external microphone, check the system preferences/settings for your audio devices. The USB mic we have at H&D doesn't need a driver.

**Receipt printer**

  If you have a printer, particularly, a receipt printer or something with non-standard format, configure it with CUPS in the browser. CUPS is a standards-based, open source printing system developed by for Apple products. CUPS uses IPP Everywhere™ to support printing to local and network printers: http://www.cups.org/
  
 A copy of the driver we used (Star CUPS 4.8) is included in this repository, or can be downloaded here: https://starmicronics.com/support/download/software-manual-for-macos-cups-driver/
  
  The receipt printer at H&D is a Star TSP100 FuturePRNT with cutting feature. You can find the necessary CUPS driver here: https://starmicronics.com/support/products/tsp100iii-support-page/ The process described here is how to use momentary zine on a mac. 
    
  **Setting up the printer via CUPS**
  
  Navigate to this page in Chrome browser: 

  [http://localhost:631] (http://localhost:631)
  
  As the CUPS Web Interface may be disabled by default on your Mac, you will need to enable it in order to have your Thermal Receipt printers appear on the network. A screen will then appear saying _Web Interface is Disabled_. An indication that CUPS has been disabled on your particular Mac device. 
  
  ![Web_interface_disabled_00](https://user-images.githubusercontent.com/7869045/159969739-04d4c8d0-4930-4328-84c6-a765ab6fc882.png)

  Enable CUPS by copying the command:
  
  ```cupsctl WebInterface=yes```
  
  and pasting it into a terminal window (if server is running, quit first by hitting control + C), then hit enter.
  
  Now refresh the page with the url http://localhost:631, and the CUPS interface should show up and you can add your printer
  
  Under _CUPS for Administrators_ click _Adding printers and Classes_
  
  If all went well it should say _Star TSP143 (SRT_T_001)(Star TSP143 (STR_T_001))_ at the top under "local printers"
  
  <img width="1680" alt="Screenshot 2022-03-24 at 13 45 48" src="https://user-images.githubusercontent.com/7869045/159970816-bc18b088-24a7-412c-b928-8a6c77785537.png">
  
  Select that one and press continue. Then select the STAR TSP100 CUTTER and continue to select the right driver for the printers we have.
    
  If it is installed, go to _Printers_  
  
  In the dropdown that says _Administration_, choose _Set default options_
  
  * In _General_, set 72mm x 200mm as media size using the dropdown 
  * Go to _Cut Options_ and set both to **Partial cut**
  * Go o _Output Options_ and select page type: **Fixed length**

 If it asks for an admin password you have to input the username of your computer and the corresponding pass (again: the CUPS program is running locally not on the web, you're just viewing the tool in a browser window)

  Go to the printer settings on your computer and make sure STAR TSP100 (or whatever name you gave it) is set as default printer. 

  See STAR software manual for full explanation of options (file comes with driver).

### Browse to (Only works in Chrome):

  Make sure the server is running by running the command ```sudo ./server.sh``` from the location of the _momentary-zine-master_ folder

  Now browse to the interface by putting this url in your Chrome browser
  
  [https://localhost/index.html] (https://localhost/index.html)

  Remember to give your browser permission to access your microphone.

### Voice commands
  
  Start speaking to provide content for the momentary zine
  
  Say the word PRINT to print a segment when you are happy with it.
  
  If the tool records more than 150 characters it will automatically print to empty the buffer.
  
### Check terminal if it doesn't print
  
  Is it sent to a different printer in your installed printers? 
  
  Go into system settings on computer and make set the Star printer as default printer
  
  You can review pending print jobs and error in the CUPS interface to for troubleshooting: http://localhost:631/printers
  
  If nothing works, terminate the server process in terminal by hitting CTRL + C. Then restart the server. 

## Changing font size and image size of print

In line 17 of server.h you can edit these parameters. Typically this is set to 280 px image width and font size 24 pt.

```
template = "<div><center><img src='THE_IMAGE' style='max-width: 280px;'></center><p style='font-size: 24pt; font-family: helvetica'>THE_TEXT</p></div>"
```


## Python3 Support - Update

There is a new branch in github, in case you have python3
You can find the branch [here](https://github.com/hackersanddesigners/momentary-zine/tree/python3)

```
$ git clone https://github.com/hackersanddesigners/momentary-zine.git 

$ cd momentary-zine

$ git fetch -a

$ git checkout -b python3 origin/python3

$ sudo ./server.py
```

Consider looking at the python3 branch for further updates to this section of the README.
	