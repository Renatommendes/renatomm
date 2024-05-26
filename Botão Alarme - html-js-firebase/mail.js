const firebaseConfig = {
  apiKey: "YOUR KEY",
  authDomain: "contactform-6d378.firebaseapp.com",
  databaseURL: "https://contactform-6d378-default-rtdb.firebaseio.com",
  projectId: "contactform-6d378",
  storageBucket: "contactform-6d378.appspot.com",
  messagingSenderId: "609540408525",
  appId: "1:609540408525:web:f9f41983a1fa56eecf1584",
};
//iniciando o firebase
firebase.initializeApp(firebaseConfig);

//referenciando seu database
const contactFormDB = firebase.database().ref("contactForm");

function clickoubotao(trueOrFalse) {
  console.log("teste, clicou no botão", trueOrFalse);

  var newContactForm = contactFormDB.push();

  newContactForm.set({
    botao: trueOrFalse,
  });
}

const getElementVal = (id) => {
  return document.getElementById(id).value;
};
