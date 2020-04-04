Stack Overflow Developer Survey 2019: Exploring the characteristics of
data scientists and data analysts
================

<br>

In this project I’ll be exploring survey responses from data scientists
and data analysts in [Stack Overflow’s 2019 Developer
Survey](https://insights.stackoverflow.com/survey/2019#overview). I’ll
be using the survey responses to model industry salaries (converted to
US Dollars or USD). Huge credit goes Julia Silge’s brilliant analysis of
[gender and salary in the tech
industry](https://juliasilge.com/blog/salary-gender/) from which I’ve
re-used R code for cleaning and filtering the data.

#### Notes on data preparation

To fit a more accurate model of salary the data were filtered to:

  - full-time workers

  - salaries between between $30,000 and $300,000

  - individual contributors working in industry only (i.e. removing
    upper management and academics)

Respondents were labelled as data analysts if they identified as a “Data
or business analyst” or a data scientist if identifying as “Data
scientist or machine learning specialist”. 405 respondents identified
with both labels. These responses were removed to focus the analysis on
the differences between the two groups. This left 2150 responses,
consisting of 973 data scientists and 1177 data analysts.

### Exploring the data

#### What do data scientists and data analysts earn?

If we take a look at salaries overall, the median salary for data
scientists is slightly higher than for data analysts.
![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

| DevType        | Median salary | Min salary | Max salary |
| :------------- | ------------: | ---------: | ---------: |
| Data analyst   |         68000 |      30095 |     284664 |
| Data scientist |         76416 |      30000 |     300000 |

<br>

#### Demographics

##### Gender identity

The data shows that the majority of respondents indentified as men. Data
scientists had higher median salaries than data analysts across the
gender groups. It’s possible that women are under-represented in this
sample, an issue that has been identified for the survey overall. This
means between-gender differences may not generalise beyond the sample.
16 respondents in this sample identified as trans.

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

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

89.4% (1052)

</td>

<td style="text-align:left;">

7.4% (87)

</td>

<td style="text-align:left;">

1.4% (17)

</td>

<td style="text-align:left;">

1.8% (21)

</td>

</tr>

<tr>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:left;">

88.7% (863)

</td>

<td style="text-align:left;">

8.1% (79)

</td>

<td style="text-align:left;">

1.2% (12)

</td>

<td style="text-align:left;">

2.0% (19)

</td>

</tr>

</tbody>

</table>

##### Age

The median age of the sample was 31. The distributions of ages were
similar for data analysts and data scientists. There was no clear
relationship between age and salary for either group.

![](README_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

##### Sexuality

The majority of the sample identified solely as heterosexual. A small
number of respondents identified with more than one sexuality. There
were no differences in sexuality between data analysts and data
scientists.

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

#### Education

Breaking down salaries by undergrad major and developer type shows that
data scientists who studied maths or statistics had the highest median
earnings whereas data analysts who’d studied maths or statistics had the
lowest.

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

<th style="text-align:right;">

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

163

</td>

<td style="text-align:right;">

90066

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

101

</td>

<td style="text-align:right;">

83000

</td>

</tr>

<tr>

<td style="text-align:left;">

Another engineering discipline (ex. civil, electrical, mechanical)

</td>

<td style="text-align:left;">

Data scientist

</td>

<td style="text-align:right;">

85

</td>

<td style="text-align:right;">

75237

</td>

</tr>

<tr>

<td style="text-align:left;">

A natural science (ex. biology, chemistry, physics)

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

61

</td>

<td style="text-align:right;">

73328

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

492

</td>

<td style="text-align:right;">

72697

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

127

</td>

<td style="text-align:right;">

70548

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

83

</td>

<td style="text-align:right;">

70000

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

90

</td>

<td style="text-align:right;">

68725

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

505

</td>

<td style="text-align:right;">

68705

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

51

</td>

<td style="text-align:right;">

68000

</td>

</tr>

<tr>

<td style="text-align:left;">

A humanities discipline (ex. literature, history, philosophy)

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

37

</td>

<td style="text-align:right;">

64800

</td>

</tr>

<tr>

<td style="text-align:left;">

Mathematics or statistics

</td>

<td style="text-align:left;">

Data analyst

</td>

<td style="text-align:right;">

66

</td>

<td style="text-align:right;">

61825

</td>

</tr>

</tbody>

</table>
