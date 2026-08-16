const express = require("express");

const app = express();
const PORT = 8888;

app.get("/", (req, res) => {
    res.send("DevSecOps Lab 5 - CI/CD Pipeline is working!");
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Application running on port ${PORT}`);
});
