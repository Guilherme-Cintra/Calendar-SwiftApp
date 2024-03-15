//
//  SelectDateView.swift
//  Projet 2
//
//  Created by Guilherme Cintra Castro on 2023-08-28.
//
//  VotreNom: Guilherme Castro

import SwiftUI

struct SelectDateView: View {
    
    
// Afficher les pickers avec le jour actuel
    @State var jour = recupereJourActuel()
    @State var mois = recupereMoisActuel()
    
    @State var siecle = recupereAnneeActuelle()/100
    @State var decenie = recupereAnneeActuelle()%100
    @State var annee = recupereAnneeActuelle()
    

    func updateAnnee(){ //Fonction utilisé plus tard sur le picker pour changer la valeur de l'année
        annee = siecle * 100 + decenie
    }
    
    var body: some View {
        NavigationView {
            VStack {

               
                    
                    Image("logocgg")
                        .resizable()
                        .scaledToFit()
                        
                    .frame(width: 200)
                    
                
                   
            

                // MARK: - TITRE
                Text("Sélection de la date désirée")
                    .padding()
                    .bold()
                    .foregroundColor(.cyan)
                    .font(.title)
                
                
                
                
                
                HStack {
                    // MARK: - JOUR PICKER
                    Picker("Jour", selection: $jour) {
                        ForEach(1 ... 31, id: \.self) {
                            jour in
                            Text("\(jour)").tag(jour)
                            
                        }
                    }
                        
                    
                    // MARK: - MOIS PICKER
                    Picker("Mois", selection: $mois) {
                        ForEach(1 ... 12, id: \.self) {
                            mois in
                            Text("\(moisEnLitteral(intMois:mois, binMajuscule:true))").tag(mois)
                        }
                    }
                    
                    // MARK: - PICKER SIÈCLE
                    Picker("Siècle", selection: $siecle) {
                        ForEach(19 ... 21, id: \.self) {
                            value in
                            Text("\(String(format: "%d", value))").tag(value)
                                
                        }
                    }
                    .onChange(of: siecle) { annee in
                        //Appelle la fonction pour mettre l'année à jour
                        updateAnnee()
                        
                    }

                    

                    // MARK: - PICKER DÉCÉNIE
                    Picker("Décénie", selection: $decenie) {
                        ForEach(00 ... 99, id: \.self) {
                            valeur in
                            Text("\(String(format: "%02d", valeur))").tag(valeur)
                        }
                    }
                    .onChange(of: decenie) {annee in
                        //Appelle la fonction pour mettre l'année à jour
                        updateAnnee()
                    }

                    
                    
                    
                }
                HStack {
                    
                    // MARK: - BOUTON ACTUALISER
                    Button(action: {
//                        Remet les pickers et la date au jour d'aujourd'Hui
                        jour = recupereJourActuel()
                        mois = recupereMoisActuel()
                         siecle = Int(recupereAnneeActuelle()/100)
                         decenie = recupereAnneeActuelle()%100
                        
                    }, label: {
                        Text("Actualiser")
                    })
                    .padding(14)
                    .background(.cyan)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    
                    // MARK: - BUTTON CALENDRIER
                    if dateValide(intJour: jour, intMois: mois, intAnnee: annee) {
//                        Envoie les varibales dans la vue calendrier
                        NavigationLink(destination: CalendarView(jour: $jour, mois: $mois, annee: $annee, siecle: $siecle, decenie: $decenie)) {
                                            Text("Calendrier")
                                        }
                                        .padding(14)
                                        .background(Color.cyan)
                                        .cornerRadius(20)
                                        .foregroundColor(.white)
                        
                    }
                }
                // MARK: - DATE AFFICHÉE
                
                Text("\(dateEnLitteralLong(intJour:jour, intMois: mois, intAnnee: annee, binMoisMajuscule: false))").foregroundColor(.cyan)
                Spacer()
            }
        }
    }
}

struct SelectDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView()
    }
}
