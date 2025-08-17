from fastapi import FastAPI

app = FastAPI(title="Template API")


@app.get("/health")
def health():
    return {"status": "ok"}
