# Insurance-Claims-Management-System
Insurance Claims Management System
📂 Project Repository
A comprehensive system for analyzing insurance claims data. This project covers Data Modeling, SQL Implementation, and Power BI Dashboard Visualization.

📌 Project Objective
Develop an Insurance Claims Management System to:

Analyze claim frequency and amounts
Study customer behavior
Track policy trends
Improve claims process efficiency
🛠️ Tech Stack
Tool / Technology	Purpose
DbSchema	        Database Modeling (Free Version)
SQL Server (SSMS)	Database Implementation (Developer Edition)
Power BI Desktop	Data Visualization (Free)
🔨 Project Workflow
Phase 1: Data Modeling
Tool: DbSchema (Free Version)
Entities Designed:
Customers: CustomerID, Name, Age, Location
Policies: PolicyID, PolicyType, StartDate, EndDate, PremiumAmount, CustomerID
Claims: ClaimID, PolicyID, CustomerID, ClaimAmount, ClaimDate, Status
Payments: PaymentID, PolicyID, AmountPaid, PaymentDate
Relationships:
Customers → Policies (One-to-Many)
Policies → Claims (One-to-Many)
Policies → Payments (One-to-Many)
Deliverable:
✔️ InsuranceClaimsDB_Model.dbschema
✔️ Exported as PDF/PNG image of the schema diagram.
Phase 2: SQL Server Implementation
Tool: SQL Server Management Studio (SSMS)
Steps:
Create Database: InsuranceClaimsDB
Create Tables: SQL scripts generated from DbSchema.
Insert Data: Mock data inserted into tables.
Example Queries:
Total claims by policy type
Top 5 customers by premium paid
Monthly claim trends
Average claim amount by region
Pending claims list
Deliverables:
✔️ SQL_Scripts/ folder
Table_Creation.sql
Insert_Claims.sql
Insert_Payments.sql
Insert_Policies.sql
Insert_Customers.sql
Analysis.sql
Phase 3: Power BI Dashboard
Tool: Power BI Desktop
Connection: SQL Server Database (InsuranceClaimsDB)
Visualizations:
📊 Bar Chart: Claims count by policy type
📈 Line Chart: Monthly claims trend
🌍 Map: Claims by customer location
💰 Card KPI: Total premiums collected
📃 Table: Pending claims list
Filters & Interactivity:
Slicers by PolicyType, Region, ClaimStatus
Deliverable:
✔️ Insurance_Claims_Dashboard.pbix
✔️ Dashboard screenshots in /Documentation/Screenshots/
✅ Key Insights
🚀 Most claims are from Auto Policies
📈 Claims spiked in March 2024
🌍 Most claims originated from California & Texas
💰 Total Premiums Collected: $5,000+
⏳ 10% of claims are still Pending
📎 Folder Structure
pgsql
Insurance-Claims-Management-System/
│
├── Data_Model_Diagram/
│   └── InsuranceClaimsDB_Model.dbschema
│   └── Schema_Diagram.png
│
├── SQL_Scripts/
│   └── Table_Creation.sql
│   └── Table_Creation.sql
│   └──Insert_Claims.sql
│   └──Insert_Payments.sql
│   └──Insert_Policies.sql
│   └──Insert_Customers.sql
│   └──Analysis.sql
│
├── PowerBI_Dashboard/
│   └── Insurance_Claims_Dashboard.pbix
│
├── Documentation/
│   └── README.md
│   └── Screenshots/
│       ├── Dashboard_Overview.png
│       ├── Claims_by_PolicyType.png
│       ├── Monthly_Claims_Trend.png
│       └── Pending_Claims_Table.png
│
└── LICENSE
💡 How to Run This Project
Clone the repository:
git clone https://github.com/afreedashireen/Insurance-Claims-Management-System.git
Open SSMS:
Run Table_Creation.sql and Data_Insertion.sql
Open Power BI Desktop:
Load the Insurance_Claims_Dashboard.pbix
Update the connection string if needed
📜 License
This project is licensed under the MIT License.

🤝 Contributing
Feel free to fork this repo, raise issues, or contribute with PRs!

🙌 Acknowledgments
Microsoft SQL Server & Power BI Docs
DbSchema Free Edition
👩‍💻 Author
Afreeda Shireen
[LinkedIn](https://www.linkedin.com/in/afreeda-shireen-abba50169/) | GitHub
