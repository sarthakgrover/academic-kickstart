---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "SAZO"
subtitle: ""
summary: "Constant guard for home network security"
authors: []
tags: []
categories: []
date: 2013-01-01
lastmod: 2019-09-19T22:05:11+05:30
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

# SAZO: Securing Home Networks from Malware and Data Thefts

With the proliferation of technology in today’s households, there is a flurry of devices (Internet media streaming devices, Internet TVs, Internet radios, smartphones and tablets) which connect to the Internet, hence are open to attacks or compromises. With the growth of home networks consisting of a large number of poorly managed devices, the foremost threat faced by hosts on these networks is that they may be compromised, become sources of DDOS attacks, or sites of phishing attacks. 

Securing home networks is challenging as these networks are usually used by people who either don't know or understand the underlying functioning of malware-conception and/or ways to combat malwares. Host-based antivirus solutions such as Kaspersky, Norton, AVG, etc., and their internet suites, are the most commonly employed security measures. Besides the obvious issue of not be up-to-date with the most recent signatures, they are heavily dependent on device's operating system. The major weakness of these solutions is that they run inside the very hosts they are protecting, making them vulnerable to subversion by malware. Furthermore, such suites are not available for many devices such as internet TV, radio, gaming stations etc.

This motivates an "out of the box" solution such as Comcast’s Constant Guard - which employs anti-malware technologies at the ISP-level, making it easier to manage and tamper proof. Such Internet security services provided by ISPs can alert users if traffic is routed from, or to a notorious website. Unfortunately, these services can only view the Internet side of a customer NAT, thus detecting whether or not the home is compromised, but not knowing where. Another shortcoming of such an approach is a monitoring software is required to be installed on each device that is secured.

We propose a new approach -- SAZO (SAfe ZOne) -- to detect and warn users about compromised devices by monitoring home network traffic at the wireless router. For this, an end user, connects to Internet using a modified wireless router called a SAZO box. This box monitors the entire home traffic and detects anomalies with the help of SAZO servers in the cloud. Some advantages of this approach are 1) No need to install a monitoring agent on each device. This will obviously save storage space on the device and will not slow down other applications by consuming CPU cycles and RAM. Another issue with these agents is they need to be constantly updated to keep the malware signature database updated. This consumes the network bandwidth and often times, users might postpone updating them. More importantly, such an agent has to be explicitly installed on each device that needs protection. A user might forget to do so as new devices are added. Even if a diligent user installs it on every device, such an agent might not be available for every device and platform, 2) SAZO system offloads malware detection logic to the cloud. Not only this relieves a device from running the agent constantly but also when additional information becomes available to SAZO servers, previously undetected malware traffic can be identified, 3) For the devices that are classified as suspicious, traffic originated from them can be redirected to special inspection boxes using VPN and real-time protection. 4) Since a SAZO box is deployed at a vantage point where a home network is connected to Internet, it can tell which traffic originated from which device. This is normally not possible for solutions deployed at ISP level since the devices are behind NAT.

We study malware spread and infection from access point view, (i.e., behind a NAT box). This vantage point allows us to not only discern if malware-traffic is being routed to the network but also point out the particular intra-network device which is responsible for the incoming/outgoing malicious traffic. This approach offers two distinct advantages over ISP-level solutions:
Fine-grained monitoring: As opposed to simply reporting on suspicious traffic at a customer level, the passive measurements collected from a BISmark router can help a customer and the ISP determine the device that is the source of a security incident, and possibly also provide more details about the nature of the compromise (e.g., what applications generated the offending traffic, and when).
More reactive: Although it may not be feasible to collect fine-grained measurements all of the time, BISmark can allow operators to collect more detailed measurements that are triggered by a particular event, as configured by the ISP.  For example, the BISmark router can perform deep-packet inspection of specific flows that are triggered by particular events or observations, such as a DNS lookup to a suspicious domain.

## Background: 

### Comcast Constant Guard:
This is a suite of solutions offered by network connectivity provider Comcast to protect users from variety of attacks such as bots, phishing and password security. It helps users to secure various home network devices. However, it is required to be installed on  each device.

### BISmark passive:
This software passively monitors network traffic on OpenWRT routers and periodically sends small anonymized updates to a central server for analysis. Specifically, it collects information about the devices connected to your home network, the type and amount of network traffic transferred by these devices, the domain names of Internet sites accessed by these devices, and the frequency of such access. BISmark-Passive never inspects or captures the application-level contents of your network traffic.

### Information collected:
Record first 24 bits of the MAC address of each device connected to the router. This gives us the manufacturer of the device and lets us differentiate between classes of devices
Count number of times a particular site (domain name) is visited.
Record the type of network application your devices use, and how frequently each application is used, by recording the quantity of network traffic associated with each TCP or UDP port number. 
Collect information about the distribution of network traffic by recording the size of each unit of information (packet) transmitted through your BISmark router, as well as the date and time (microsecond accuracy) at which the transmission occurred. 

### Information not collected:
Specific URLs: We do not record the complete URL of the site visited, only the domain name query and response.
Personally Identifiable Information (PII): We do not record your name, e-mail address, mailing address, MAC addresses or IP addresses except as described above. We never request or record financial information, social security numbers, birth dates, etc.
Application packet contents: We do not monitor the contents of e-mails, chat conversations, phone calls, file downloads, Web page contents, Internet login credentials, or anything else about your online activities except as described above.

### Resources:
- File format of updates sent: https://github.com/projectbismark/bismark-passive
- Privacy statement for bismark-passive: https://github.com/projectbismark/bismark-passive/blob/master/PRIVACY.md


## Design:

![SAZO Architecture](/img/sazo_architecture.jpg)

At a high level, a SAZO box will passively capture metadata of all network flows. This metadata will be uploaded to SAZO servers where it will be categorized as either infected, suspicious or benign using various classification algorithms. SAZO servers will install triggers in the SAZO box for suspicious devices. Upon hitting such triggers, traffic generated from these devices would be redirected for further inspection to SAZO servers. Once a device is confirmed to be infected, depending on the customer’s policy, all the traffic from that device would be either redirected to DPI devices or restricted and the user will be warned.

## Links:

- Preliminary work presented as a poster at the Homesys '13 workshop, Ubicomp. [Poster](../../publication/panoptes2013.pdf)

- Preliminary code tested on bismark router. [Code](https://github.com/shahifaqeer/bismark-packages/blob/sazo/luci/luci-app-sazo/files/usr/lib/lua/luci/model/cbi/sazo/general.lua)

- Bloom filter server and client implementation. [Code](https://github.com/shahifaqeer/bloom_filter)