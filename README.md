**Analysing careers in data with the StackOverflow Developer Survey
2019**
================

<br>

This project was inspired by Julia Silge’s amazing analysis of [gender
and salary in the tech
industry](https://juliasilge.com/blog/salary-gender/). There’s a lot of
cool analysis that can be done with the survey data, but I’ll be
focussing my analysis on “data” jobs - namely data analysts and data
scientists.

### Pre-processing

The pre-processing steps are executed in *prepare\_data.r*. To
summarise, respondents are filtered as:

  - salary above $30,000 and below $2,000,000

  - full-time only

  - self-identified data analyst or data scientist

### What’s the difference between data analysts and data scientists?

<br>

Typically people think of data science as being paid more, so let’s take
a look if that’s true\!

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

It looks like
