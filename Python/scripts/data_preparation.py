import numpy as np

def convert_dates(orders, order_items, products, refunds):
    orders["created_at"] = __import__("pandas").to_datetime(orders["created_at"])
    order_items["created_at"] = __import__("pandas").to_datetime(order_items["created_at"])
    products["created_at"] = __import__("pandas").to_datetime(products["created_at"])
    refunds["created_at"] = __import__("pandas").to_datetime(refunds["created_at"])
    return orders, order_items, products, refunds

def create_order_summary(order_items):
    summary = (
        order_items.groupby("order_id")
        .agg(
            total_items=("order_item_id", "count"),
            revenue=("price_usd", "sum"),
            cogs=("cogs_usd", "sum")
        )
        .reset_index()
    )
    summary["profit"] = summary["revenue"] - summary["cogs"]
    summary["profit_margin"] = np.where(
        summary["revenue"] != 0,
        summary["profit"] / summary["revenue"] * 100,
        0
    )
    return summary

def create_orders_analysis(orders, order_items):
    return orders.merge(
        create_order_summary(order_items),
        on="order_id",
        how="left"
    )

def create_product_summary(order_items, products):
    data = order_items.merge(products, on="product_id", how="left")
    summary = (
        data.groupby(["product_id", "product_name"])
        .agg(
            units_sold=("order_item_id", "count"),
            revenue=("price_usd", "sum"),
            cogs=("cogs_usd", "sum")
        )
        .reset_index()
    )
    summary["profit"] = summary["revenue"] - summary["cogs"]
    summary["profit_margin"] = np.where(
        summary["revenue"] != 0,
        summary["profit"] / summary["revenue"] * 100,
        0
    )
    return summary
