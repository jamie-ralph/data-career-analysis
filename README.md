An exploratory analysis of data scientists and analysts working in
industry (with a bit of predictive modelling)
================

<br>

In this project I’ll be exploring the characteristics of data scientists
and data analysts and attempt to build a model for predicting salary.
The data comes from **StackOverflow’s 2019 Developer Survey** which is a
great resource for finding out about people who develop professionally
or as a hobby. <br>

This project was inspired by Julia Silge’s analysis of [gender and
salary in the tech industry](https://juliasilge.com/blog/salary-gender/)
which I highly recommend\!

#### Notes on data preparation

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
the differences between the two groups. This left 2326 responses,
consisting of 1058 data scientists and 1268 data analysts.

The salaries used here are the converted US Dollar salaries provided by
StackOverflow.

### Exploring the data

#### What do data scientists and data analysts earn?

If we take a look at salaries overall, the range of salaries is similar
between the groups with a large positive skew.

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

The summary statistics show that the median salary for data scientists
is slightly higher than for data analysts.

| DevType        | Median salary | Min salary | Max salary |
| :------------- | ------------: | ---------: | ---------: |
| Data analyst   |       70580.5 |      30095 |    1750000 |
| Data scientist |       83192.0 |      30051 |    1920000 |

<br>

#### How is gender identity represented in the responses?

<br>

The data shows that the majority of respondents indentified as men. It’s
possible that women are under-represented in this sample, an issue that
was identified for the survey overall.

<table>

<thead>

<tr>

<th style="text-align:left;">

DevType

</th>

<th style="text-align:left;">

Man

</th>

<th style="text-align:left;">

Woman

</th>

<th style="text-align:left;">

Non-binary/genderqueer/gender non-conforming

</th>

<th style="text-align:left;">

Not available

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:left;">

89.4%

</td>

<td style="text-align:left;">

7.3%

</td>

<td style="text-align:left;">

1.6%

</td>

<td style="text-align:left;">

1.7%

</td>

</tr>

<tr>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:left;">

88.5%

</td>

<td style="text-align:left;">

8.5%

</td>

<td style="text-align:left;">

1.1%

</td>

<td style="text-align:left;">

1.9%

</td>

</tr>

</tbody>

</table>

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
