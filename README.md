<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nashville Housing Data Cleaning</title>
<style>
body{font-family:Arial,sans-serif;line-height:1.6;max-width:900px;margin:auto;padding:20px;background:#f4f6f8;color:#222}
.container{background:#fff;padding:30px;border-radius:16px;box-shadow:0 4px 12px rgba(0,0,0,.08)}
h1,h2{color:#1f4e79}ul{padding-left:20px}.badge{display:inline-block;background:#1f4e79;color:#fff;padding:6px 10px;border-radius:999px;font-size:14px}
</style>
</head>
<body>
<div class="container">
<h1>🏠 Nashville Housing Data Cleaning in SQL</h1>
<p class="badge">SQL Project</p>
<p>This project focuses on cleaning and transforming the <strong>Nashville Housing dataset</strong> using SQL to improve data quality and prepare it for analysis.</p>
<h2>📌 Project Objectives</h2>
<ul><li>Standardize date formats</li><li>Handle missing property address values</li><li>Split combined address fields</li><li>Clean categorical values (Y/N → Yes/No)</li><li>Remove duplicate records</li><li>Drop unused columns</li></ul>
<h2>🛠️ Tools Used</h2>
<ul><li>SQL</li><li>DBeaver / SQL Workbench</li></ul>
<h2>📂 Data Cleaning Steps</h2>
<ol>
<li><strong>Standardized Date Format:</strong> Converted SaleDate into proper DATE format.</li>
<li><strong>Filled Missing Addresses:</strong> Used self joins with ParcelID.</li>
<li><strong>Split Address Columns:</strong> Created separate property and owner address fields.</li>
<li><strong>Standardized SoldAsVacant:</strong> Y/N changed to Yes/No.</li>
<li><strong>Removed Duplicates:</strong> Used ROW_NUMBER() and CTEs.</li>
<li><strong>Dropped Unused Columns:</strong> Removed unnecessary fields.</li>
</ol>
<h2>📈 Outcome</h2>
<ul><li>Structured dataset</li><li>Consistent values</li><li>Analysis-ready data</li><li>Better for dashboards</li></ul>
<h2>🚀 Why This Project Matters</h2>
<p>Data cleaning is a critical step in analytics. This project demonstrates practical SQL skills used in real-world data jobs.</p>
<h2>📎 Author</h2>
<p><strong>Shaurya Sinha</strong><br>Aspiring Data Analyst | Learning SQL, Python & Data Science</p>
</div>
</body>
</html>
