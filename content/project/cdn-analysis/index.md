---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "CDN Analysis"
subtitle: ""
summary: "Measurement and comparison of page load times across identifiable CDNs"
authors: []
tags: []
categories: []
date: 2019-01-01
lastmod: 2019-09-19T22:03:47+05:30
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Smart"
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
[Code](https://github.com/shahifaqeer/cdn-analysis)

In this work, we compared average page load times for the top 500 Alexa websites across CDNs and ASNs.

Based on our algorithm, we estimated that 300 websites are using CDNs. We find that Google CDN gives the best performance with an average total response time of 0.48s. However, multiple requests to google.* domains are in fact redirected since Google detected that we are using a script to measure response timings. The worst performer was Alibaba CDN. In general, sites using CDNs outperformed those not using CDNs when comparing median time taken to load the complete page by 0.2s. Sites not using CDNs take 5x the time for TCP handshake, and 3x the time for SSL negotiation, when compared to those using CDNs. Time taken for DNS lookup, and WAIT time for server response is same across both groups.

Grouping by ASN, we find that Google and Microsoft have the best performance, while Alibaba and ChinaNet have the worst performance. This is consistent with our timing analysis when grouped by CDNs. We found that 74.67% of detected CDN names correspond directly to the AS name. Two websites, liputan6.com and trello.com were using ASNs different from the detected CDN used to host most content on their webpages. Furthermore, we found 22 websites that were not using CDNs, hosted on ASes that also offer CDNs if needed.

For more details, please visit: [Report](../../publication/cdn-analysis2019.pdf)