<h1 align="center">🏠 Nashville Housing Data Cleaning in SQL</h1>

<p align="center">
  <b>SQL Project for Cleaning and Transforming Raw Housing Data</b>
</p>

<hr>

<h2>📌 Project Overview</h2>

<p>
This project focuses on cleaning the <b>Nashville Housing Dataset</b> using SQL.  
The raw dataset contained missing values, duplicates, inconsistent formats, and unnecessary columns.  
Using SQL queries, the data was transformed into a clean and analysis-ready format.
</p>

<h2>🎯 Objectives</h2>

<ul>
  <li>Standardize date formats</li>
  <li>Handle missing property addresses</li>
  <li>Split combined address columns</li>
  <li>Convert Y/N values into Yes/No</li>
  <li>Remove duplicate records</li>
  <li>Drop unused columns</li>
</ul>

<h2>📂 Data Cleaning Process</h2>

<h3>1️⃣ Standardized Date Format</h3>
<p>Converted the <code>SaleDate</code> column into proper SQL DATE format.</p>

<h3>2️⃣ Filled Missing Property Addresses</h3>
<p>Used self joins based on <code>ParcelID</code> to populate null values.</p>

<h3>3️⃣ Split Address Columns</h3>
<p>Separated addresses into:</p>

<ul>
  <li>Property Address</li>
  <li>Property City</li>
  <li>Owner Address</li>
  <li>Owner City</li>
  <li>Owner State</li>
</ul>

<h3>4️⃣ Standardized SoldAsVacant Values</h3>

<ul>
  <li>Y → Yes</li>
  <li>N → No</li>
</ul>

<h3>5️⃣ Removed Duplicate Records</h3>
<p>Used <code>ROW_NUMBER()</code> with CTE to identify duplicates.</p>

<h3>6️⃣ Dropped Unused Columns</h3>

<ul>
  <li>OwnerAddress</li>
  <li>TaxDistrict</li>
  <li>PropertyAddress</li>
</ul>

<h2>📈 Final Outcome</h2>

<ul>
  <li>Clean and structured dataset</li>
  <li>Consistent values</li>
  <li>Ready for analysis</li>
  <li>Useful for dashboards and reports</li>
</ul>


