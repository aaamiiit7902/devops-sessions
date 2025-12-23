import json, os, random, time, uuid
from datetime import datetime, timezone

SERVICE = os.getenv("SERVICE_NAME", "demo-logger")
levels = ["INFO", "INFO", "INFO", "WARN", "ERROR"]
msgs = ["request_ok","db_ok","cache_hit","cache_miss","slow_request","payment_failed"]

while True:
    level = random.choice(levels)
    event = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "service": SERVICE,
        "level": level,
        "msg": random.choice(msgs),
        "trace_id": str(uuid.uuid4()),
        "user_id": random.randint(1000, 1100),
        "latency_ms": random.randint(5, 1500),
    }
    print(json.dumps(event), flush=True)
    time.sleep(1)