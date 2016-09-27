# Momentary Zine

Hackers & Designers build an open publishing station. At this publishing station everyone is invited to co-create and examine editorial design matters such as cross-media publishing. Using a thermal printer (receipt printer) as a point of departure the visitors were be the subject of the accumulating publication and simultaneously active content providers.

Thermo print has the characteristic of vanishing after a while. With an easy hack of the printer software we capture the temporality and actuality of the event and printed matter as such. The zine content is exclusively accumulated by speaking into a microphone. With text to speech technology the spoken word translates to text. Simultaneously an algorithm is will run an automized image search on google, grabbing some of the words randomly and adding them to the zine.


## Dependencies

  - Install http://wkhtmltopdf.org/downloads.html
  
## Usage

### Start the websserver

  $ sudo ./server.sh

### Configuration

  If you have attached an external microphone, check the system preferences/settings for your audio devices.

  If you have a printer, particularly, a receipt printer or something with non-standard format, configure it with CUPS in the browser.

  [http://localhost:631] (http://localhost:631)


### Browse to (Only works in Chrome):

  [https://localhost/index.html] (https://localhost/index.html)

  Remember to give your browser permission to access your microphone.

  




