**Analysing careers in data with the StackOverflow Developer Survey
2019**
================

<br>

Data analysts and data scientists are in demand across industries.
Usually the difference between these jobs is that data scientists use
more machine learning and programming than analysts, but this boundary
can sometimes become blurred. Here I’ll use the StackOverflow 2019
Developer Survey to explore the characteristics of data analysts and
data scientists, including **salary**, **contribution to open source**,
and **coding as a hobby**.

<br>

This project was inspired by Julia Silge’s amazing analysis of [gender
and salary in the tech
industry](https://juliasilge.com/blog/salary-gender/) which I highly
recommend\!

The pre-processing steps are executed in *prepare\_data.r*. To
summarise, respondents are filtered as:

  - salary above $30,000 and below $2,000,000

  - full-time only

  - self-identified data analyst or data scientist

#### What do data analysts and data scientists earn?

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
