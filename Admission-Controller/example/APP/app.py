from flask import Flask, request, jsonify

app = Flask(__name__)

ALLOWED_IMAGE = "nginx"

def is_allowed_image(image):
    return image == ALLOWED_IMAGE or image.startswith("nginx:")

@app.route("/validate", methods=["POST"])
def validate():
    admission_review = request.get_json()

    request_uid = admission_review["request"]["uid"]
    pod = admission_review["request"]["object"]

    containers = pod["spec"].get("containers", [])
    init_containers = pod["spec"].get("initContainers", [])

    all_containers = containers + init_containers

    for container in all_containers:
        image = container.get("image", "")

        if not is_allowed_image(image):
            return jsonify({
                "apiVersion": "admission.k8s.io/v1",
                "kind": "AdmissionReview",
                "response": {
                    "uid": request_uid,
                    "allowed": False,
                    "status": {
                        "message": f"Image '{image}' is not allowed. Only nginx images are allowed."
                    }
                }
            })

    return jsonify({
        "apiVersion": "admission.k8s.io/v1",
        "kind": "AdmissionReview",
        "response": {
            "uid": request_uid,
            "allowed": True
        }
    })

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8443,
        ssl_context=("/certs/tls.crt", "/certs/tls.key")
    )
