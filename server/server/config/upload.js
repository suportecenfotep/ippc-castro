const multer = require('multer');
// Configuração do Multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'mediafiles/');
  },
  filename: (req, file, cb) => {
    const fileName = `${Date.now()}_${file.originalname}`;
    cb(null, fileName);
  },
});

const upload = multer({ storage: storage });

// Função de Upload
const uploadFile = (req, res, next) => {
  upload.single('foto')(req, res, (err) => {
    if (err instanceof multer.MulterError) {
      return res.status(400).json({ error: 'Erro durante o upload.' });
    } else if (err) {
      return res.status(500).json({ error: 'Erro interno do servidor.' });
    }

    if (!req.file) {
      return res.status(400).json({ error: 'Nenhum arquivo enviado.' });
    }

    req.fileName = req.file.filename;
    next();
  });
};

// Exportando a função de upload para uso em outras partes do aplicativo
module.exports = uploadFile;
