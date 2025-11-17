from flask import Flask, redirect, render_template, request
from counter import Counter

app = Flask(__name__)
cnt = Counter()

@app.route("/")
def index():
    return render_template("index.html", value=cnt.value)

@app.route("/increment", methods=["POST"])
def increment():
    cnt.increase()
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    cnt.reset()
    return redirect("/")

@app.route("/type_value", methods=["POST"])
def type_value():
    new_value = request.form.get("new_value", type=int)
    if new_value is not None:
        cnt.increment(new_value - cnt.value)
    return redirect("/")