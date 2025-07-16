🔹 Built a unified Amazon Redshift data warehouse
1. Defined business schema with tables for products, stores, customers, sales, inventory, employees, suppliers, deliveries, digital engagement, and feedback.
2. Developed SQL ETL routines to ingest and join multifaceted data (~10 tables) into a consolidated analytics-ready view, enabling cross-functional insights in one go.

🔹 Designed and optimized analytical SQL for multi-table reporting
1. Wrote a complex Redshift SQL query joining all tables to support analytics such as:
2. Total store-level revenue (SUM(total_amount))
3. Average sale per customer (SUM(total_amount)/COUNT(DISTINCT customer_id))
4. Product revenue and average rating (SUM(...), AVG(feedback_rating))
5. Inventory alerts (stock_level < reorder_level)
6. Supplier on-time delivery rate (SUM(CASE WHEN delivery_status='Delivered' THEN 1 ELSE 0)/COUNT(*))
7. Digital conversion rate (SUM(ifelse(delivery_status='Delivered',1,0)/SUM(1)) etc.)

🔹 Created QuickSight computed fields & dashboards
1. Implemented QuickSight calculated fields to visualize business KPIs:
2. ConversionRatePct = SUM(IFELSE({converted},1,0)) / SUM(1)
3. CancellationRatePct = SUM(IFELSE({delivery_status}='Cancelled',1,0)) / SUM(IFELSE({delivery_status} IN ['Delivered','Delayed','Cancelled'],1,0)) * 100
4. Inventory restock flag (IFELSE(stock_level < reorder_level, 'Restock', 'OK'))
5. Supplier On-Time Rate grouped by supplier: percentage of Delivered deliveries
6. Built interactive dashboards:
7. Bar charts for revenue by store & product
8. KPI tiles for average sale/customer, digital engagement conversion
9. Conditional visuals highlighting stores needing inventory restock

🔹 Impact & scale
1. Enabled McDonald’s-style leadership to monitor daily revenue, supply chain performance, and customer behavior across 100+ stores.
2. Reduced inventory stockouts by preemptively flagging low stock via dashboard alerts.
3. Improved supplier accountability by reporting on-time delivery metrics and delivery delay trends.

🔹 Technical stack & best practices
1. Amazon Redshift: star schema modeling and optimized joins for performance
2. SQL: window functions, CASE, JOIN, SUM/AVG, and conditional aggregation
3. QuickSight: custom aggregation fields, parameterized dashboards, and percentage formatting
4. Adhered to CI/CD, schema versioning, and data governance for dashboards




**Data Engineer – Independent Project (McDonald’s-Style Analytics)**  
- Engineered and maintained an Amazon Redshift data warehouse integrating 10+ business tables into unified reporting schema  
- Authored end-to-end SQL pipelines and large-scale joins enabling store, product, inventory, and delivery-level analytics  
- Designed QuickSight dashboards featuring calculated metrics such as delivery conversion, on-time rates, cancellation trends, and inventory health  
