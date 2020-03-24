Analysing data jobs in industry
================

<br>

In this project I’ll be taking a look at what data scientists and data
analysts do differently in their day-to-day work. I’ll use the
**StackOverflow 2019 Developer Survey** to explore the characteristics
of the people who do these jobs, including **salary**, **contribution to
open source**, **coding languages used**, and **coding as a hobby**.

<br>

This project was inspired by Julia Silge’s amazing analysis of [gender
and salary in the tech
industry](https://juliasilge.com/blog/salary-gender/) which I highly
recommend\!

I’ll eventually want to model salary and other characteristics in this
respondent group so the data is filtered to full-time workers earning
between $30,000 and $2,000,000 (salaries below this are unlikely to be
FTE, salaries above are most likely threshold values; see the [survey
methodology](https://insights.stackoverflow.com/survey/2019#methodology).
I’ll also filter out academics and upper management so I can focus on
individual contributors working in industry.

It turns out that **436** respondents identified with both labels. These
were removed prior to analysis because I want to focus on the
differences between the two groups.

#### What do data analysts and data scientists earn?

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
