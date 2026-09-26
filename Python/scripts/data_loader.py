import pandas as pd

def load_data(base_path="../../data/raw"):
    orders = pd.read_csv(f"{base_path}/orders.csv")
    order_items = pd.read_csv(f"{base_path}/order_items.csv")
    products = pd.read_csv(f"{base_path}/products.csv")
    refunds = pd.read_csv(f"{base_path}/order_item_refunds.csv")
    return orders, order_items, products, refunds
