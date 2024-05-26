

const firebaseConfig = {
    apiKey: "YOUR KEY",
    authDomain: "safar-teste.firebaseapp.com",
    databaseURL: "https://safar-teste-default-rtdb.firebaseio.com",
    projectId: "safar-teste",
    storageBucket: "safar-teste.appspot.com",
    messagingSenderId: "464389769717",
    appId: "1:464389769717:web:7927a14c2aa9a5f16fb8bc"
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

var database = firebase.database();
var local = 'function/Acionamento';

function AtualizaFirebase(name, Sirene, teste){

firebase.database().ref(local).set({
    name: name ,
    Rele_Sirene: Sirene,
    Rele_Teste_Sistema:teste
});
} 
// Parte o acionamento do HTML 

const turnOnOff = document.getElementById ( 'turnOnOff' );
const turnDesliz = document.getElementById ( 'turnDesliza' );
const lamp = document.getElementById ( 'lamp' );

function lampOn () {
  //  lamp.src = './img/ligada.jpg';
    console.log("Estou aqui");
    AtualizaFirebase('Lucas',true , true);
    console.log("Passei");
}

function lampOff () {
  //      lamp.src = './img/desligada.jpg';
        AtualizaFirebase('Elder', false, false);
        turnOnOff.textContent = 'Ligar';

        //turnOnOff.textContent = 'Ligar';
        
}

function lampOnOff () {
    if ( turnOnOff.textContent == 'Ligar' ) {
      
        lampOn();
      DlampOn();
    turnOnOff.textContent = 'Desligar';
   }else{
      lampOff();
      DlampOff();
      turnOnOff.textContent = 'Ligar';
 }
}

turnOnOff.addEventListener ( 'click', lampOnOff );

function DlampOn () {
  //  lamp.src = './img/ligada.jpg';
    console.log("Estou aqui");
    AtualizaFirebase('Renato-T',true , true);
    console.log("Passei");
}

function DlampOff () {
    //lamp.src = './img/desligada.jpg';
    AtualizaFirebase('Renato-F', false, false);
    turnOnOff.textContent = 'Ligar';
}
