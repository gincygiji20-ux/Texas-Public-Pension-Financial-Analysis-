# Texas Public Pension Financial Analysis

## 1. Executive Summary

This project analyzes publicly available financial data from the Texas Pension Review Board to evaluate the financial performance and cash flow patterns of Texas public pension plans.

Using **MySQL and Power BI**, the analysis examines pension plan assets, contributions, benefit payments, and non-investment cash flow across different reporting years and asset-size categories.

The analysis identified pension plans experiencing negative non-investment cash flow, examined changes in net assets, and evaluated the relationship between pension plan size and financial performance.

The findings provide insights into pension fund financial trends and highlight plans that may require further investigation.

## 2. Business Problem

Public pension plans must manage financial resources effectively to meet retirement benefit obligations while maintaining long-term financial sustainability.

Understanding the relationship between pension assets, contributions, benefit payments, and cash flow is essential for identifying potential financial risks.

This project addresses the following business questions:

1. Which pension plans experienced the largest changes in net assets between reporting years?
2. Which pension plans have the highest negative non-investment cash flow?
3. How does non-investment cash flow vary across pension plan asset-size categories?
4. Do larger pension plans experience greater negative cash flow than smaller plans?
5. Which pension plans show unusual financial patterns that may require further investigation?

## 3. Methodology

**Data Collection and Preparation**
- Obtained publicly available pension financial data from the Texas Pension Review Board.
- Imported the dataset into MySQL for analysis.
- Reviewed financial variables, pension plan identifiers, and reporting years.

**Data Cleaning and Validation**
- Identified missing values in financial variables.
- Reviewed duplicate records and inconsistent pension plan information.
- Examined missing data and reporting-year differences.
- Prepared the dataset for financial comparisons and trend analysis.

**Exploratory Data Analysis Using SQL**
- Analyzed pension plan net assets, contributions, and benefit payments.
- Calculated year-over-year changes in pension plan net assets.
- Identified pension plans experiencing negative non-investment cash flow.
- Grouped pension plans by asset-size category to compare financial performance.
- Identified financial outliers and plans with unusually high negative cash flow.

**Data Visualization Using Power BI**
- Developed an interactive financial dashboard.
- Visualized changes in pension plan assets across reporting years.
- Compared pension contributions, benefit payments, and other financial metrics.
- Created interactive filters to explore pension plan financial trends.

## 4. Skills 

**Technical Skills**
- **SQL (MySQL):** Data cleaning, filtering, aggregation, grouping, financial calculations, and year-over-year comparisons.
- **Power BI:** Dashboard development, data visualization, financial reporting, and interactive filtering.
- **Microsoft Excel:** Data preparation, validation, and initial data exploration.

**Analytical Skills**
- Exploratory Data Analysis (EDA)
- Financial Data Analysis
- Cash Flow Analysis
- Trend Analysis

## 5. Results and Key Findings

### 1. Negative non-investment Cash Flow

The analysis revealed that all four pension plan asset-size categories had negative average non-investment cash flow.

This indicates that, on average, cash outflows exceeded non-investment cash inflows across these categories.

Negative non-investment cash flow may increase reliance on investment returns or existing pension assets to meet benefit obligations.

However, negative cash flow does not necessarily indicate financial instability.

### 2: Contribution vs Benefits

The Power BI analysis showed that average benefit payments exceeded average contributions across the displayed fiscal years.

This highlights the importance of monitoring contribution inflows, benefit obligations, and investment performance to support long-term pension financial sustainability.

### 3: Relationship Between Pension Plan Size and Cash Flow

The analysis found that larger pension plans generally experienced a greater percentage of negative non-investment cash flow than smaller plans.

This suggests that pension plan asset size may be associated with differences in cash flow patterns.


### 4: Changes in Pension Plan Net Assets

Year-over-year comparisons identified pension plans experiencing increases and decreases in total net assets.

Changes in net assets may be influenced by investment returns, contributions, benefit payments, and expenses.

These findings highlight the importance of monitoring pension financial performance across multiple reporting periods.

### 5: Identification of Financial Outliers

The SQL analysis identified pension plans with unusually high negative cash flow percentages and significant changes in net assets.

These plans may require additional investigation to understand whether the financial patterns reflect normal pension operations, investment activity, or potential financial risks.


<img width="1000" height="400" alt="image" src="https://github.com/user-attachments/assets/6e3d8ab6-892d-472f-be0f-875f33907468" />


## 6. Business Recommendations

**1. Monitor Negative Cash Flow**

Pension administrators should regularly monitor non-investment cash flow to identify plans experiencing persistent negative cash flow.

**2. Investigate Financial Outliers**

Plans with unusually large negative cash flow percentages or significant declines in net assets should be reviewed to understand the underlying financial factors.

**3. Monitor Investment Dependence**

Pension plans experiencing negative non-investment cash flow should evaluate the role of investment returns and existing assets in supporting benefit obligations.

**4. Use Financial Dashboards for Decision-Making**

Interactive Power BI dashboards can help pension administrators and financial analysts monitor financial trends, compare pension plans, and identify potential areas of concern.

## 7. Next Steps

- **Investment Performance Analysis:** Incorporate investment return data to evaluate the relationship between investment performance and pension asset growth.
- **Funding Status Analysis:** Incorporate actuarial liabilities and funded ratios to better assess pension financial sustainability.
- **Dashboard Enhancement:** Add additional financial KPIs, cash flow comparisons, and year-over-year performance indicators to the Power BI dashboard.

---
