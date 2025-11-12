import pandas as pd

def summarize_catalog(path: str) -> pd.DataFrame:
    df = pd.read_csv(path)
    summary = (
        df.groupby(['domain', 'criticality'])
          .agg(report_count=('report_id', 'count'))
          .reset_index()
    )
    return summary
