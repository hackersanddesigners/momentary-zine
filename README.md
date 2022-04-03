<img width="1193" alt="Screenshot 2022-03-24 at 17 54 28" src="https://user-images.githubusercontent.com/7869045/159970933-73add122-4237-490c-a5c1-8bb23254a716.png">

# Momentary Zine

Hackers & Designers build an open publishing station. At this publishing station everyone is invited to co-create and examine editorial design matters such as cross-media publishing. Using a thermal printer (receipt printer) as a point of departure the visitors were be the subject of the accumulating publication and simultaneously active content providers.

Thermo print has the characteristic of vanishing after a while. With an easy hack of the printer software we capture the temporality and actuality of the event and printed matter as such. The zine content is exclusively accumulated by speaking into a microphone. With text to speech technology the spoken word translates to text. Simultaneously an algorithm is will run an automized image search on google, grabbing some of the words randomly and adding them to the zine.


## Dependencies

Momentary Zine only runs in a Chrome browser, download here: https://www.google.com/chrome/

Install WK HTML to Pdf. This is a command line tools to render HTML into PDF and various image formats using the Qt WebKit rendering engine. Download here: http://wkhtmltopdf.org/downloads.html
 
   
## Usage

### Start the web server

  Download the momentary zine repository from github and unpack the .zip file https://github.com/hackersanddesigners/momentary-zine
  
  Open a terminal window and navigate to the _momentary-zine-master_ folder. You can do this in two ways: 
  
  1. write _cd_ followed by a space (for "change directory"), then drag and drop the folder into the terminal window

<img width="1408" alt="Screenshot 2022-04-03 at 11 37 44" src="https://user-images.githubusercontent.com/7869045/161421502-b1ddcc8c-dac9-4d46-ba9a-a6146c3eb65f.png">

Or

2. Right click on the master folder in a finder window, go to > Services > New Terminal at Folder

<img width="759" alt="Screenshot 2022-04-03 at 11 35 16" src="https://user-images.githubusercontent.com/7869045/161421569-cedddefe-b8dd-4aeb-9545-144bffafc42f.png">

  Run the following command in Terminal/Command-line from inside the directory/folder _momentary-zine-master_ you got from git. 

  $ sudo ./server.sh
  
  If it asks for a password, it wants the pass of your laptop/computer. If you don't want to keep logging in every time you restart the server, use the command _sudi -i_, fill in your password. Then run the _./server.sh_ command
  
  If you want to stop the server, hit control + C

### Configuration

**Microphone**

  If you have attached an external microphone, check the system preferences/settings for your audio devices. The USB mic we have at H&D doesn't need a driver. In your system settings, make sure the USB mic is selected as output device. 

**Receipt printer**

  If you have a printer, particularly, a receipt printer or something with non-standard format, configure it with CUPS in the browser. CUPS is a standards-based, open source printing system developed for Apple products. CUPS uses IPP Everywhere™ to support printing to local and network printers: http://www.cups.org/
  
  The receipt printer at H&D is a Star TSP100 FuturePRNT with cutting feature. You can find the necessary CUPS driver here: https://www.starmicronics.com/support/default.aspx?printerCode=CUPS_for_Mac 
  
  Put in the settings: 
  * Product type = CUPS drivers
  * Printer family = CUPS_for_Mac

  then if you scroll down you will see the recommended driver to download: [macOS CUPS Driver V4.8.0](https://www.starmicronics.com/Support/download.aspx?type=1&tabText=macOS%20CUPS%20Driver%20V4.8.0&path=DriverFolder\drvr\Star_CUPS_Driver-4.8.0_mac.zip&id=1755&referrer=https://www.google.com/) Install the driver
  
  **Setting up the printer via CUPS**
  
  Navigate to this page in Chrome browser: 

  [http://localhost:631] (http://localhost:631)
  
  As the CUPS Web Interface may be disabled by default on your Mac, you will need to enable it in order to have your Thermal Receipt printers appear on the network. A screen will then appear saying _Web Interface is Disabled_. An indication that CUPS has been disabled on your particular Mac device. 
  
  ![Web_interface_disabled_00](https://user-images.githubusercontent.com/7869045/159969739-04d4c8d0-4930-4328-84c6-a765ab6fc882.png)

  Enable CUPS by copying the command:
  
  _cupsctl WebInterface=yes_
  
  and pasting it into a terminal window (if server is running, quit first by hitting control + C), then hit enter.
  
  Now refresh the page with the url http://localhost:631, and the CUPS interface should show up and you can add your printer
  
  Under _CUPS for Administrators_ click _Adding printers and Classes_
  
  If all went well it should say _Star TSP143 (SRT_T_001)(Star TSP143 (STR_T_001))_ at the top
  
  <img width="1680" alt="Screenshot 2022-03-24 at 13 45 48" src="https://user-images.githubusercontent.com/7869045/159970816-bc18b088-24a7-412c-b928-8a6c77785537.png">
  
  Select that one and press continue
  
  You likely don't need to upload a driver file as it's already installed
  
  [INSERT REST OF STEPS HERE]
  
  If it is installed, go to _Printers_  
  
  In the dropdown that says _Administration_, choose _Set default options_
  
  * In _General_, set 72mm x 200mm as media size using the dropdown 
  * Go to _Cut Options_ and set both to **Partial cut**
  * Go o _Output Options_ and select page type: **Fixed length**

### Browse to (Only works in Chrome):

  Make sure the server is running by running the command _sudo ./server.sh_ (or _./server.sh_) from the location of the _momentary-zine-master_ folder

  Now browse to the interface by putting this url in your Chrome browser
  
  [https://localhost/index.html] (https://localhost/index.html)

  Remember to give your browser permission to access your microphone.
  
  The browser may give a warning saying the connection is not private. Click advanced and continue.
  
  ![notprivate](https://user-images.githubusercontent.com/7869045/161421807-50c6b0cd-d251-4d41-9fc8-c53014a61703.png)
  
  You should now get a white screen with in the bottom the words "Speak into the mic".

 ### Voice commands
  
  Start speaking to provide content for the momentary zine
  
  Say the word PRINT to print a segment when you are happy with it.
  
  ### Check terminal if it doesn't print
  
  You can review pending print jobs and error in the CUPS interface for troubleshooting: http://localhost:631/printers, and the terminal window gives a bunch of information, like print jobs that are loading (sometimes takes a while). 

  ### Troubleshooting
  
  No prints? Your print jobs might be sent to a different printer in your list installed printers? 
  
  Go into system settings on computer and make set the Star printer as default printer.




