//
//  CalendarView.swift
//  Projet 2
//
//  Created by Guilherme Cintra Castro on 2023-08-28.
//
//  VotreNom: Guilherme Castro

import SwiftUI

struct CalendarView: View {
        
    @Environment (\.dismiss) var dismiss
    
    
       @Binding var jour: Int
       @Binding var mois: Int
       @Binding var annee: Int
       @Binding var siecle: Int
       @Binding var decenie: Int
       
        
        var joursSemaine = ["Dim",  "Lun",  "Mar", "Mer", "Jeu", "Ven", "Sam"]
        
    
    
    
    
//Fonction retournant les jours du mois précédent
    func remplirMoisDernier() -> [Int] {
        var jours: [Int] = []

        
        // Identifier le mois précédent et son année
        let moisPrecedent = mois == 1 ? 12 : mois - 1
        let anneePrecedente = mois == 1 ? annee - 1 : annee
        if annee == 1900 && mois == 1 {
            jours.append(0)
            return jours
        }
        // Obtenir le nombre de jours du mois précédent
        let nbJours = nombreJoursMois(intMois: moisPrecedent, intAnnee: anneePrecedente)

        // Remplir le tableau avec les jours
        for i in 0..<nbJours {
            jours.append(i + 1)
        }

        return jours
    }
    
    //Fonction retournant les jours du mois suivant
    func remplirMoisSuivant() -> [Int] {
        var jours: [Int] = []

        // Identifier le mois suivant et son année
        let moisSuivant = mois == 12 ? 1 : mois + 1
        let anneeSuivante = mois == 1 ? annee + 1 : annee

        
        // Obtenir le nombre de jours du mois suivant
        let nbJours = nombreJoursMois(intMois: moisSuivant, intAnnee: anneeSuivante)

        
        // Remplir le tableau avec les jours
        for i in 0..<nbJours {
            jours.append(i + 1)
        }

        return jours
    }

    //Fonction retournant les jours du mois Actuel
    func remplirJours() -> [Int] {
        var tousLesJours: [Int] = []
        
        let nbJours = nombreJoursMois(intMois: mois, intAnnee: annee)
        for i in 0..<nbJours {
            tousLesJours.append(i + 1)
        }
        
        return tousLesJours
    }
    
//    Détermine le nombre de semaines nécessaires pour créer la grille du mois en question
    func nombreDeSemainesNecessairesPourLeMois() -> Int {
        let noSeriePeremierJour = dateEnNoSerie(intJour: 1, intMois: mois, intAnnee: annee)
        let debutJour = noSerieEnJourSemaine(intNoSerie: noSeriePeremierJour) - 1
        
        let joursActuel = remplirJours()
        if joursActuel.count + debutJour < 29 {
            return 4
        }
        if joursActuel.count + debutJour  > 35 {
            
            return 6
            
        }
        else {
            return 5
        }
    }
    
    var body: some View {
        
        
        // MARK: - Mois et année
        VStack (spacing: 20) {
            Text("\(moisEnLitteral(intMois:mois,  binMajuscule:true)) \(String(format: "%d", annee))")
                .font(.title)
                .foregroundColor(.cyan)
                .bold()
            .lineLimit(1)
        
        
      
            HStack{
                // MARK: - Bouton mois précédent
                
                    Button(action: {
                           if self.mois == 1 {
                               self.mois = 12
                               self.annee -= 1
                           } else {
                               self.mois -= 1
                           }
                           if self.jour > nombreJoursMois(intMois: mois, intAnnee: annee) {
                               self.jour = 1
                           }
                    }, label: {
                        HStack{
                            
                            Image(systemName: "arrow.left")
                                .bold()
                                .padding(5)
                                
                            Text("mois")
                                .bold()
                                .padding(10)
                                
                        }.background(.cyan)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity((mois == 1 && annee == 1900) ? 0.0 : 1.0) //Bouton disparaît si nous sommes en l'an 1900 et au mois de janvier
                    }).disabled(mois == 1 && annee == 1900) //Bouton non-fonctionnel si nous sommes en l'an 1900 et au mois de janvier
                    .padding(10)
                
                Spacer()
                // MARK: - Bouton nouvelle date
                Button(action: {
                    
                    siecle = Int(annee/100)//Sert à mettre le picker à jour selon les changements sur l'année, une fois revenus à SelectDateView
                    decenie = annee%100
                    
                    dismiss()}, label: {Text("Nouvelle date")})
                    .padding()
                    .background(.cyan)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                Spacer()
                
                // MARK: - Bouton mois suivant
                
                    Button(action: {
                       
                       
                           
                           if self.mois == 12 {
                               self.mois = 1
                               self.annee += 1
                           } else {
                               self.mois += 1
                           }
                           if self.jour > nombreJoursMois(intMois: mois, intAnnee: annee) {
                               self.jour = 1
                           }
                    }, label: {
                        HStack{
                            Text("mois")
                                .bold()
                                .padding(10)
                            Image(systemName: "arrow.right")
                                .bold()
                                .padding(5)
                        }.background(.cyan)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity((mois == 12 && annee == 2199) ? 0.0 : 1.0)//Bouton disparaît si nous sommes en l'an 2199 et au mois de décembre
                    }).disabled(mois == 12 && annee == 2199) //Bouton ne marche pas si nous sommes en l'an 2199 et au mois de décembre
                    .padding(10)
                
            
            }
            // MARK: - BTNs Année
            HStack{
                
                
                // MARK: - Bouton année précédente
                Button(action: {
                    
                    
                     
                     self.annee -= 1
                     if self.jour > nombreJoursMois(intMois: mois, intAnnee: annee) {
                         self.jour = 1
                     }
                }, label: {
                    HStack{
                        
                        Image(systemName: "arrow.left")
                            .bold()
                            .padding(2)
                        Text("Année")
                            .bold()
                            .padding(10)
                    }
                    .background(.cyan)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .opacity(annee <= 1900 ? 0.0 : 1.0)
                }) .disabled(annee <= 1900)
                    .padding(10)
                Spacer()
                Button(action: {
                        self.jour = recupereJourActuel()
                        self.mois = recupereMoisActuel()
                        self.annee = recupereAnneeActuelle()
                    
                        
                }, label: {Text("Aujourd'hui")})
                    .padding()
                    .background(.cyan)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                Spacer()
                    // MARK: - Bouton année suivante
                    Button(action: {
                        
                            
                            self.annee += 1
                            if self.jour > nombreJoursMois(intMois: mois, intAnnee: annee) {
                                self.jour = 1
                            }
                    }, label: {
                        HStack{
                            Text("Année")
                                .bold()
                                .padding(10)
                            Image(systemName: "arrow.right")
                                .bold()
                                .padding(2)
                            
                        }.background(.cyan)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(annee >= 2199 ? 0.0 : 1.0)
                    }).disabled(annee >= 2199)
                    .padding(10)
               

                
            }
            
            

            
            // MARK: - Calendrier
            
            let NoSeriePremierJourDuMois = dateEnNoSerie(intJour: 1, intMois: mois, intAnnee: annee) // retourne le numéro de série du premier jour du mois actuel

            let debutCalendrier = noSerieEnJourSemaine(intNoSerie: NoSeriePremierJourDuMois) // utilise le numéro de série du premier du mois pour retourner le jour de la semaine dimanche à samedi où le mois commence
            
            
            let tabJoursMoisPrecedent = remplirMoisDernier() // Remplit le mois précédent
            let tabJoursMoisSuivant = remplirMoisSuivant()// Remplit le mois suivant
            
            let tabJoursMoisActuel = remplirJours() // Remplit le mois actuel

            //Colonnes pour le LazyVGrid
            let colonnes: [GridItem] = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]

            // MARK: - Jours de la semaine
            LazyVGrid(columns: colonnes, spacing: 15) {
                ForEach(joursSemaine, id: \.self) { jour in
                    Text(jour)
                        .font(.system(size: 12, weight: .medium))
                        .frame(width: 50, height: 50)
                }

                // MARK: - Jours du mois
                
                ForEach(1...nombreDeSemainesNecessairesPourLeMois() * 7, id: \.self) { idx in
                        //Génère des index allant de 1 à 35 ou 42 selon le nombre nécessaires de semaines pour la vue
                           
                    //Condition qui vérifie si nous sommes dans le mois actuel
                    if idx >= debutCalendrier && idx < debutCalendrier + tabJoursMoisActuel.count {
                                Text("\(tabJoursMoisActuel[idx - debutCalendrier])") // On soustrait debutCalendrier pour avoir la bonne indice du premier jour du mois
                                    .frame(width: 50, height: 50)
                                    .background(idx - debutCalendrier + 1 == jour ? .cyan : .white) // si l'index soustrait du debut calendrier + 1 est égal au jour le background est de couleur cyan
                                    .foregroundColor(idx - debutCalendrier + 1 == jour ? .white : .cyan)
                                    .cornerRadius(25)
                            }
                    //Condition qui vérifie que nous sommes dans le mois antérieur
                    else if idx < debutCalendrier {
                                let jourPrec = tabJoursMoisPrecedent.count - debutCalendrier + idx // donne l'indice de la journée du mois précédent
                                Text("\(tabJoursMoisPrecedent[jourPrec])")
                                    .foregroundColor(.gray)
                            } else {
                                
                                let idxSuivant = idx - tabJoursMoisActuel.count - debutCalendrier // idxSuivant vaut vaut 0 la première fois qu'on y rentre et ainsi de suite
                                Text("\(tabJoursMoisSuivant[idxSuivant])")
                                    .foregroundColor(.gray)
                            }
                }
                
            }

            Image("logocgg")
                
            Spacer()
        }.navigationBarBackButtonHidden(true)
        
        
    }
    
    struct CalendarView_Previews: PreviewProvider {
        static var previews: some View {
            CalendarView(jour: .constant(10), mois: .constant(11), annee: .constant(2023), siecle: .constant(20), decenie: .constant(23))
        }
    }

}
