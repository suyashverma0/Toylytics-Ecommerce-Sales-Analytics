# Toylytics Python Scripts

Put these files inside `Python/scripts/`.

- `data_loader.py` — loads all CSV files
- `data_preparation.py` — reusable date/order/product preparation
- `analysis_utils.py` — reusable KPI, customer, monthly and refund analysis

From a notebook inside `Python/notebooks/`:

```python
import sys
sys.path.append("../scripts")

from data_loader import load_data
from data_preparation import convert_dates, create_orders_analysis
from analysis_utils import calculate_kpis
```

Then load and prepare the data:

```python
orders, order_items, products, refunds = load_data("../../data/raw")

orders, order_items, products, refunds = convert_dates(
    orders, order_items, products, refunds
)

orders_analysis = create_orders_analysis(orders, order_items)
kpis = calculate_kpis(orders_analysis)
print(kpis)
```
