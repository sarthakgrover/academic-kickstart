---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Browserlab"
subtitle: ""
summary: "Home network diagnosis and bottleneck detection"
authors: []
tags: ["networking", "bismark", "analysis"]
categories: []
date: 2014-06-01
lastmod: 2019-09-19T22:04:49+05:30
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

- Detect the performance bottleneck in a home network by collaborating between home devices.
- Created a monitoring system to collect detailed wireless measurements from synchronized devices in a home, and manage and upload this data to the centralized server for analysis.
- Tested uplink and downlink broadband performance from devices to detect if bottleneck is in the local wireless network or at the edge router.
- Link to [analysis](https://github.com/shahifaqeer/connection_performance)
- Link to [code](https://github.com/shahifaqeer/browserlab-linktest)

- We develop the browserlab daemon that listens on multiple network devices in a home, and propose collaborative bottleneck detection algorithm to identify if the access link is the bottleneck or the wireless is. Next, the daemon will be ported as a browser extension to scale the solution and collect large scale home wireless measurements.
- Link to [setup-code](https://github.com/shahifaqeer/browserlab).
- Link to [test-code](https://github.com/shahifaqeer/curltest)

- Integrating and extending the Fathom and BISmark measurement platforms to develop a home network troubleshooter for internal and external network diagnosis. The API allows a user to communicate between connected clients, and with the gateway, to issue parallel tests to analyse the home networks performance.
- Link to modified OpenWRT [bismark](https://github.com/shahifaqeer/luci-app-bismark) [build](https://github.com/shahifaqeer/my-luci-bismark-0.11)



- Programmed active traceroute test on bismark router and analyzed latency and throughput performance from routers.