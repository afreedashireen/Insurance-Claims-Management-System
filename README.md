# 📑 Insurance Claims Management System

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)  
![SQL Server](https://img.shields.io/badge/SQL%20Server-Database-red?logo=microsoftsqlserver)  
![License](https://img.shields.io/badge/License-MIT-green)

A **comprehensive system** for analyzing **insurance claims data**. This project covers **Data Modeling**, **SQL Implementation**, and **Power BI Dashboard Visualization** to improve claims process efficiency and deliver valuable business insights.

---

## 📌 Project Objectives
- 🔎 Analyze claim frequency and amounts  
- 👥 Study customer behavior and trends  
- 📊 Track policy performance  
- ⚡ Improve claims process efficiency with real-time insights  

---

## 🛠️ Tech Stack
| Tool / Technology | Purpose |
|-------------------|---------|
| **DbSchema** | Database Modeling |
| **SQL Server (SSMS)** | Database Implementation |
| **Power BI Desktop** | Dashboard & Visualization |

---

## 🔨 Project Workflow

### Phase 1: Data Modeling
- Tool: **DbSchema (Free Version)**  
- **Entities**: Customers, Policies, Claims, Payments  
- **Relationships**:  
  - Customers → Policies *(One-to-Many)*  
  - Policies → Claims *(One-to-Many)*  
  - Policies → Payments *(One-to-Many)*  

📂 Deliverables:  
✔️ `Data_Model/Data_Model_Diagram.png`  

---

### Phase 2: SQL Server Implementation
- Tool: **SQL Server Management Studio (SSMS)**  
- Steps:  
  - Create Database: `InsuranceClaimsDB`  
  - Create Tables & Insert Mock Data  
  - Run Queries for Analysis  

📂 Deliverables (inside `/SQL Scripts/`):  
- `Table_Creation.sql`  
- `Insert_Customers.sql`  
- `Insert_Policies.sql`  
- `Insert_Claims.sql`  
- `Insert_Payments.sql`  
- `Analysis.sql`  

**Sample Queries**:
- Total claims by policy type  
- Top 5 customers by premium paid  
- Monthly claim trends  
- Average claim amount by region  
- Pending claims list  

---

### Phase 3: Power BI Dashboard
- Tool: **Power BI Desktop**  
- Connected to SQL Server Database: `InsuranceClaimsDB`  

📊 **Visualizations**:
- Bar Chart → Claims count by policy type  
- Line Chart → Monthly claims trend  
- Map → Claims by customer location  
- Card KPI → Total premiums collected  
- Table → Pending claims list  

📂 Deliverables:  
- `PowerBI_dashboard/Insurance_Claims_Dashboard.pbix`  
- Screenshot → `PowerBI_dashboard/PowerBI_dashboard.png`  

---

## ✅ Key Insights
- 🚘 Most claims came from **Auto Policies**  
- 📈 Claims spiked in **March 2024**  
- 🌍 High claims activity in **California & Texas**  
- 💰 Total Premiums Collected: **$5,000+**  
- ⏳ **10% of claims are still Pending**  

---

## 📎 Folder Structure
```
INSURANCE_CLAIMSDB/
│
├── Data_Model/
│   └── Data_Model_Diagram.png
│
├── PowerBI_dashboard/
│   ├── Insurance_Claims_Dashboard.pbix
│   └── PowerBI_dashboard.png
│
├── Screenshots/
│   ├── Data_Model_Diagram.png
│   └── PowerBI_dashboard.png
│
├── SQL Scripts/
│   ├── Analysis.sql
│   ├── Insert_Claims.sql
│   ├── Insert_Customers.sql
│   ├── Insert_Payments.sql
│   ├── Insert_Policies.sql
│   └── Table_Creation.sql
```

---

## 🚀 How to Run This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/afreedashireen/Insurance-Claims-Management-System.git
   ```

2. **Open SQL Server (SSMS)**
   - Run `SQL Scripts/Table_Creation.sql`  
   - Insert mock data using scripts inside `/SQL Scripts/`  

3. **Open Power BI Desktop**
   - Load `PowerBI_dashboard/Insurance_Claims_Dashboard.pbix`  
   - Update the SQL Server connection string if required  

---

## 📜 License
This project is licensed under the **MIT License**.  

---

## 🤝 Contributing
Contributions, issues, and feature requests are welcome!  
Feel free to **fork this repo** and submit a **pull request**.  

---

## 👩‍💻 Author
**Afreeda Shireen**  
🔗 [LinkedIn](https://www.linkedin.com/in/afreeda-shireen-abba50169/) | 🌐 [GitHub](https://github.com/afreedashireen)  
