from fastapi import FastAPI


app = FastAPI()


@app.get("/", tags=["root"])
def read_root():
    return {"Hello": "World"}
