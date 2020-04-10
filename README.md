Stack Overflow Developer Survey 2019: Exploring the characteristics of
data scientists and data analysts
================

<br>

In this project I’ll be exploring survey responses from data scientists
and data analysts in [Stack Overflow’s 2019 Developer
Survey](https://insights.stackoverflow.com/survey/2019#overview). I’ll
be using the survey responses to build statistical models of industry
salaries. This project reuses code from Julia Silge’s brilliant analysis
of [gender and salary in the tech
industry](https://juliasilge.com/blog/salary-gender/).

#### Preparing the data

To fit a more accurate model of salary the data were filtered to:

  - full-time workers

  - residing in the United States

  - salaries between between $30,000 and $300,000

  - individual contributors working in industry only (i.e. removing
    upper management and academics)

This made the data more consistent for visualising and modelling. [This
analysis by Charles
Modingwa](https://medium.com/@charlesmodingwa/2019-stack-overflow-survey-analysis-c8dac1617d40)
showed that data scientist salaries differed across countries. Filtering
only to the United States removes any unwanted effects of country and
still leaves a good sample size.

Respondents were labelled as data analysts if they identified as a “Data
or business analyst” or a data scientist if identifying as “Data
scientist or machine learning specialist”. 166 respondents identified
with both labels. These responses were removed to focus the analysis on
the differences between the two groups. This left 871 responses,
consisting of 346 data scientists and 525 data analysts.

### Part 1 - Exploring the data

Before building a model, I’ll build some exploratory plots of salary and
other variables in the survey. I chose variables based on analyses that
have already looked at modelling salaries in this dataset, combined with
some additional variables I was interested in.

#### What do data scientists and data analysts earn?

If we take a look at salaries overall, the median salary is higher for
data scientists ($120,000) than for data analysts ($84,000). Salaries
for both groups are positively skewed due to small number of respondents
earning about $150,000 or more. For modelling purposes the salaries will
be log10 transformed to make them more normally distributed.
![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

<br>

#### Does salary differ by gender identity?

The data shows that the majority of respondents indentified as men. Data
scientists had higher median salaries than data analysts across the
gender groups. It’s possible that women are under-represented in this
sample, an issue that has been identified for the survey across all
developer roles. This means that, despite the boxplot indicating only a
small gender difference between men and women, this result may not
reflect the real world. 10 respondents in this sample identified as
trans.

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

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

86.3% (453)

</td>

<td style="text-align:left;">

10.1% (53)

</td>

<td style="text-align:left;">

1.7% (9)

</td>

<td style="text-align:left;">

1.9% (10)

</td>

</tr>

<tr>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:left;">

84.4% (292)

</td>

<td style="text-align:left;">

11.3% (39)

</td>

<td style="text-align:left;">

1.4% (5)

</td>

<td style="text-align:left;">

2.9% (10)

</td>

</tr>

</tbody>

</table>

#### Do salaries increase with age?

The median age of the sample was 31. The distributions of ages were
positively skewed. If we plot a basic linear regression line we can see
that salary increases with age. This can be expected if people who are
older have more experience, something I’ll look at shortly.

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

#### Does education affect future salaries?

Median salary was higher for data scientists at each aggregated
qualification level. Overall there was a stronger positive effect of
education on median earnings in the data scientist group compared to the
data analyst group. Breaking down salaries by undergrad major and
developer type shows that data scientists who studied maths or
statistics had the highest median salary while data analysts with a
social sciences background had the lowest median salary.

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

<table>

<thead>

<tr>

<th style="text-align:left;">

UndergradMajor

</th>

<th style="text-align:left;">

DevType

</th>

<th style="text-align:right;">

Sample size

</th>

<th style="text-align:left;">

Median salary

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Mathematics or statistics

</td>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:right;">

68

</td>

<td style="text-align:left;">

$136,750

</td>

</tr>

<tr>

<td style="text-align:left;">

A natural science (ex. biology, chemistry, physics)

</td>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:right;">

35

</td>

<td style="text-align:left;">

$120,000

</td>

</tr>

<tr>

<td style="text-align:left;">

Computer science, computer engineering, or software engineering

</td>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:right;">

159

</td>

<td style="text-align:left;">

$115,000

</td>

</tr>

<tr>

<td style="text-align:left;">

Computer science, computer engineering, or software engineering

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

204

</td>

<td style="text-align:left;">

$88,000

</td>

</tr>

<tr>

<td style="text-align:left;">

Information systems, information technology, or system administration

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

61

</td>

<td style="text-align:left;">

$86,000

</td>

</tr>

<tr>

<td style="text-align:left;">

Another engineering discipline (ex. civil, electrical, mechanical)

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

30

</td>

<td style="text-align:left;">

$85,750

</td>

</tr>

<tr>

<td style="text-align:left;">

A business discipline (ex. accounting, finance, marketing)

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

47

</td>

<td style="text-align:left;">

$80,000

</td>

</tr>

<tr>

<td style="text-align:left;">

A social science (ex. anthropology, psychology, political science)

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

37

</td>

<td style="text-align:left;">

$73,000

</td>

</tr>

</tbody>

</table>

#### Do employment variables affect salary?

Median salaries were similar between respondents who develope
professionally and those who don’t develop professionally. There was an
upward trend of salary ranges as organisation size increased. <br>

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

Most respondents in the sample worked 40 hours a week. The scatterplots
here suggest that higher working hours per week may result in higher
log10 salary, but fitting a linear relationship would be confounded by
the large number of respondents on the 40 hours line.

![](README_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

#### Does coding experience affect salary?

If we take the median salary for each year of professional coding
experience, we see a positive relationship in the data analyst group.
The data scientist group is more scattered as years of professional
coding experience goes above 25.

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

The number of programming languages used had a small positive effect on
median earnings in the data analyst group, however the effect was
somewhat negative in the data scientist group.

![](README_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

#### Do open source contributors earn more?

Finally, the plot below shows that open source contributions have a
small positive effect on median salaries in the data scientist group but
less of an effect in the data analyst group.

![](README_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->
