grep -q -F 'Kaminario' /usr/lib/python2.7/dist-packages/cinder/exception.py || \
sudo sed -i '$a \ \ \n\nclass KaminarioCinderDriverException(VolumeDriverException):\n\    \message = _("KaminarioCinderDriver failure: %(reason)s")\n\n\nclass KaminarioRetryableException(VolumeDriverException):\n\    \message = _("Kaminario retryable exception: %(reason)s")' \
/usr/lib/python2.7/dist-packages/cinder/exception.py
