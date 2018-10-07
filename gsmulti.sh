#!/bin/bash

#gst-launch-1.0 rtspsrc location=rtsp://192.168.8.1:8554/bottom latency=0 ! video/x-raw,width=160,height=120 ! m.sink_0 ! decodebin ! autovideosink \
#			   rtspsrc location=rtsp://192.168.8.1:8554/video13 latency=0 ! video/x-raw,width=160,height=120 ! m.sink_1 ! decodebin ! autovideosink \

#gst-launch-1.0 -e videomixer name=mix ! xvimagesink \
 #  rtspsrc location=rtsp://192.168.8.1:8554/bottom latency=0 ! video/x-raw,width=160,height=120 ! decodebin ! autovideosink \
    # textoverlay font-desc="Sans 24" text="CAM1" valign=top halign=left shaded-background=true ! \
     #videobox border-alpha=0 top=-200 left=-50 ! mix. \
  # videotestsrc pattern="snow" ! video/x-raw-yuv, framerate=1/1, width=350, height=250 ! \
     #textoverlay font-desc="Sans 24" text="CAM2" valign=top halign=left shaded-background=true ! \
    # videobox border-alpha=0 top=-200 left=-450 ! mix. \
   #videotestsrc pattern=13 ! video/x-raw-yuv, framerate=1/1, width=350, height=250 ! \
     #textoverlay font-desc="Sans 24" text="CAM3" valign=top halign=left shaded-background=true ! \
    # videobox border-alpha=0 top=-200 left=-850 ! mix. \
    # video/x-raw,format=\(fourcc\)AYUV 
  #   ! mix.

#gst-launch-1.0 rtspsrc location=rtsp://192.168.8.1:8554/bottom latency=0 ! video/x-raw,width=160,height=120 ! decodebin ! m.sink_0 \
#               rtspsrc location=rtsp://192.168.8.1:8554/video13 latency=0 ! video/x-raw,width=160,height=120 ! decodebin ! m.sink_1 \
 #                videomixer name=m sink_1::xpos=160 ! video/x-raw,width=320,height=120 ! xvimagesink


# gst-launch-1.0 rtspsrc location=rtsp://192.168.8.1:8554/bottom latency=0 ! decodebin ! autovideosink
gst-launch-1.0 -e videomixer name=mix \
        sink_0::xpos=0   sink_0::ypos=0  sink_0::alpha=0\
        sink_1::xpos=0   sink_1::ypos=0 \
        sink_2::xpos=200 sink_2::ypos=0 \
        sink_3::xpos=0   sink_3::ypos=100 \
        sink_4::xpos=200 sink_4::ypos=100 \
    ! xvimagesink \
rtspsrc location=rtsp://192.168.8.1:8554/video13 latency=0  
    ! mix.sink_0 \
rtspsrc location=rtsp://192.168.8.1:8554/rsdepth latency=0 
    ! mix.sink_1 \
rtspsrc location=rtsp://192.168.8.1:8554/rsir latency=0 
    ! mix.sink_2 \
rtspsrc location=rtsp://192.168.8.1:8554/rsir2 latency=0 
    ! mix.sink_3 \
rtspsrc location=rtsp://192.168.8.1:8554/bottom latency=0 
    ! mix.sink_4 \