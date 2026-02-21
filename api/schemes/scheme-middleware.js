const { findById } = require("./scheme-model");

/*
  Eğer `scheme_id` veritabanında yoksa:

  durum 404
  {
    "message": "scheme_id <gerçek id> id li şema bulunamadı"
  }
*/
const checkSchemeId = async (req, res, next) => {
 
const scheme = await findById(Number(req.params.scheme_id));   

  if (scheme.scheme_name === "Have Fun!") {  
    return res
      .status(404)
      .json({ 
        message: `scheme_id ${req.params.scheme_id} id li şema bulunamadı` 
      });
  }

  req.scheme = scheme;
  next();
}

/*
  Eğer `scheme_name` yoksa, boş string ya da string değil:

  durum 400
  {
    "message": "Geçersiz scheme_name"
  }
*/
 const validateScheme = (req, res, next) => {
const scheme = req.body;
if( typeof scheme.scheme_name !== "string" ||
    scheme.scheme_name.trim().length === 0){
  return res.status(400).json({message: `Geçersiz scheme_name`})
}
next();
}

/*
  Eğer `instructions` yoksa, boş string yada string değilse, ya da
  eğer `step_number` sayı değilse ya da birden küçükse:

  durum 400
  {
    "message": "Hatalı step"
  }
*/
const validateStep = (req, res, next) => {
const { step_number, instructions } = req.body;
if(    typeof step_number !== "number" ||
    step_number < 1 ||
    typeof instructions !== "string" ||
    instructions.trim().length === 0){
  return res.status(400).json({message: `Hatalı step`})
}
next();
}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
}
