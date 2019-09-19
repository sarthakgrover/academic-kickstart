---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "BCH Decoder"
subtitle: ""
summary: "Implementation of a soft decision decoder using Trellis on FPGA"
authors: []
tags: []
categories: []
date: 2009-09-01
lastmod: 2019-09-20T00:44:32+05:30
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

- Implemented a real-time trellis decoder for BCH codes using VHDL on Xilinx ISE and configured it on FPGA.
- Dedicated hardware was shown to achieve higher data rate compared to software implementation.