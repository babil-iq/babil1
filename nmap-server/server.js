const express = require("express");
const { exec } = require("child_process");

const app = express();
const port = 3000;

app.use(express.json());

app.post("/scan", (req, res) => {
  const { target } = req.body;

  if (!target) {
    return res.status(400).send("Target is required");
  }

  exec(`nmap -Pn ${target}`, (error, stdout, stderr) => {
    if (error) {
      return res.status(500).send(`Error: ${stderr}`);
    }
    res.send(stdout);
  });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
