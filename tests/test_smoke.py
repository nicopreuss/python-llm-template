from fastapi.testclient import TestClient
from llm_template.api.main import app

def test_health_ok():
    client = TestClient(app)
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json()["status"] == "ok"
