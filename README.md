# stomp.py3
Support fixes for inactive stomp.py version 3 project by jasonrbriggs@gmail.com

This is not the Official Stomp.py project. See https://github.com/jasonrbriggs/stomp.py for 
more information about the Stomp.py project.

The existing 3 series is no longer able to be installed on many distributions because 
SSLv3 is now considered insecure and is no longer available. Unfortuantely stomp.py 3.1
expects that protocol to be available and fails during install due to an attribute 
lookup error.

This code is patched to function properly with default SSL Fallbacks and no danger of
errors.
