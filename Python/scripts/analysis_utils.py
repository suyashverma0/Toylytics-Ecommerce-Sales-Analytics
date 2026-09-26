import numpy as np

def calculate_kpis(orders_analysis):
    orders = orders_analysis["order_id"].nunique()
    customers = orders_analysis["user_id"].nunique()
    items = orders_analysis["total_items"].sum()
    revenue = orders_analysis["revenue"].sum()
    cogs = orders_analysis["cogs"].sum()
    profit = orders_analysis["profit"].sum()

    return {
        "total_orders": orders,
        "total_customers": customers,
        "total_items": items,
        "total_revenue": revenue,
        "total_cogs": cogs,
        "total_profit": profit,
        "average_order_value": revenue / orders if orders else 0,
        "profit_margin": profit / revenue * 100 if revenue else 0
    }

def create_customer_summary(orders_analysis):
    summary = (
        orders_analysis.groupby("user_id")
        .agg(
            total_orders=("order_id", "nunique"),
            total_revenue=("revenue", "sum"),
            total_profit=("profit", "sum")
        )
        .reset_index()
    )
    summary["customer_type"] = np.where(
        summary["total_orders"] > 1, "Repeat", "One-time"
    )
    return summary

def create_monthly_summary(orders_analysis):
    data = orders_analysis.copy()
    data["year_month"] = data["created_at"].dt.to_period("M")
    return (
        data.groupby("year_month")
        .agg(
            orders=("order_id", "nunique"),
            revenue=("revenue", "sum"),
            profit=("profit", "sum")
        )
        .reset_index()
    )

def create_refund_summary(refunds, order_items, products):
    data = refunds.merge(
        order_items[["order_item_id", "product_id"]],
        on="order_item_id", how="left"
    ).merge(
        products[["product_id", "product_name"]],
        on="product_id", how="left"
    )
    return (
        data.groupby(["product_id", "product_name"])
        .agg(
            refund_records=("order_item_refund_id", "count"),
            refund_amount=("refund_amount_usd", "sum")
        )
        .reset_index()
    )
