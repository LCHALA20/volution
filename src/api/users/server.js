const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('🚀 API Utilisateurs CVolution en ligne !');
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Serveur API Utilisateurs démarré sur http://localhost:${PORT}`);
});
