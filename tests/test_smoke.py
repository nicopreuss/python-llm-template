from fastapi.testclient import TestClient
from python_llm_template.api.main import app  # <- updated import


def test_health_ok():
    client = TestClient(app)
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json()["status"] == "ok"
