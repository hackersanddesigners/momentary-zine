#! /usr/bin/env python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import SocketServer
import ssl
import urlparse
import urllib, json

import syslog
import time
import sys
import random
import threading

from subprocess import call

template = "<div><center><img src='THE_IMAGE' style='max-width: 130px;'></center><p style='font-size: 14pt; font-family: helvetica'>THE_TEXT</p></div>"
print_content = ''
char_count = 0

def print_page(content):
  html_file = open('zine.html', 'w')
  html_file.write(content)
  html_file.close()
  #wkhtmltopdf --page-width 100mm --page-height 200mm test.html test.pdf
  call(["wkhtmltopdf", "--page-width", "80mm", "--page-height", "200mm", "zine.html", "zine.pdf"])
  call(["lp", "zine.pdf"])
  return

def create_content(str, img):
  content = template.replace('THE_IMAGE', img)
  content = content.replace('THE_TEXT', str)

  global char_count
  char_count = char_count + len(str)
  global print_content
  print_content += content

  print char_count
  if char_count > 150:
    print_page(print_content)
    #t = threading.Thread(target=print_page, args=(print_content,))
    #t.start() 
    char_count = 0
    print_str = ''

def get_image(str):
  url = 'https://www.googleapis.com/customsearch/v1?q=' + str + '&num=10&cx=015700006039354317064:q1iz_ozoiqg&key=AIzaSyBgfVQouscDUruWKEGIg36ZzroWiukq36U&alt=json'
  resp = urllib.urlopen(url)
  data = json.loads(resp.read())
  n = random.randint(0, len(data['items']) - 1)

  try:
    return data['items'][n]['pagemap']['cse_image'][0]['src']
  except Exception, e:
    return ' '
  
class S(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        #self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        self._set_headers()
        f = open('./' + self.path)
        try:
          self.wfile.write(f.read())
          f.close()
          return
        except IOError:
          self.send_error(404, 'file not found')

    def do_HEAD(self):
        self._set_headers()

    def do_POST(self):
        print dir(self)
        # Extract and print the contents of the POST
        length = int(self.headers['Content-Length'])
        post_data = urlparse.parse_qs(self.rfile.read(length).decode('utf-8'))
        for key, value in post_data.iteritems():
            print '%s=%s' % (key, value)
            if key == 'str':
              str = value[0]
              strs = str.split(' ')
              n = random.randint(0, len(strs) - 1)
              image_url = get_image(str)

              print image_url
              create_content(str, image_url) 

              self._set_headers()
              self.wfile.write(image_url)
              return
        self._set_headers()
        self.wfile.write('Failed image search.')
    
            
def run_server(server_class=HTTPServer, handler_class=S, port=443):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    httpd.socket = ssl.wrap_socket (httpd.socket, certfile='./77867815_localhost.pem', server_side=True)
    print 'Starting httpd...'
    httpd.serve_forever()
    
if __name__ == '__main__':
    run_server()

