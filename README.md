Analysing data jobs in industry
================

<br>

In this project I’ll be taking a look at what data scientists and data
analysts do differently in their day-to-day work and how this relates to
their salary. The data comes from **StackOverflow’s 2019 Developer
Survey** which a great resource for finding out about people who develop
professionally or as a hobby. <br>

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
with both labels. These responses were removed to focus the analysis on
the differences between the two groups. This left 2326 responses. The
salaries used here are the converted US Dollary salaries provided by
StackOverflow.

#### What do data analysts and data scientists earn?

If we take a look at salaries overall, the range of salaries is similar
between the groups with a large positive skew.

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

The summary statistics show that the median salary for data scientists
is slightly higher than for data analysts.

| DevType        | Median salary | Min salary | Max salary |
| :------------- | ------------: | ---------: | ---------: |
| Data analyst   |       70580.5 |      30095 |    1750000 |
| Data scientist |       83192.0 |      30051 |    1920000 |
