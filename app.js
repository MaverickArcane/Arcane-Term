const express = require('express')
const app = express()
const port = 8080

app.use(express.static('public'));
app.engine('html', require('ejs').renderFile);

app.get('/', (req, res) => {
  res.render("index.ejs");
})

app.listen(port, () => {
  console.log(`Frontend listening on port ${port}`)
})
