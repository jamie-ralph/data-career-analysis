Analysing data jobs in industry
================

<br>

In this project I’ll be taking a look at what data scientists and data
analysts do differently in their day-to-day work. I’ll use the
**StackOverflow 2019 Developer Survey** to explore the characteristics
of the people who do these jobs, including **gender**, **contribution to
open source**, **coding languages used**, and **coding as a hobby**.
I’ll also look at how these characteristics relate to **salary**.

<br>

This project was inspired by Julia Silge’s analysis of [gender and
salary in the tech industry](https://juliasilge.com/blog/salary-gender/)
which I highly recommend\!

#### Preparing the data

To fit a more accurate model of salary the data were filtered to:

  - full-time workers

  - salaries between between $30,000 and $2,000,000 (salaries below this
    are unlikely to be full-time, salaries above are most likely
    threshold values; see the [survey
    methodology](https://insights.stackoverflow.com/survey/2019#methodology))

  - individual contributors working in industry only (i.e. removing
    upper management and academics)

Respondents were labelled as data analysts if they identified as a “Data
or business analyst” or a data scientist if identifying as “Data
scientist or machine learning specialist”. 436 respondents identified
with both labels. These were removed prior to analysis because I wanted
to focus on the differences between the two groups. This left 2326
responses for the analysis.

#### What do data analysts and data scientists earn?

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
