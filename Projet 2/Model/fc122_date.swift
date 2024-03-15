//
//  main.swift
//  ProjectFinal
//
//  Created by Guilherme Cintra Castro on 2023-08-09.
//





import Foundation
/*
|-----------------------------------------------------------------------------|
| er:
| Retourne er si intJour = 1 et binExposant = false
| Retourne er en exposant si intJour = 1 et binExposant = true
| Retourne la chaîne vide dans tous les autres cas
|-----------------------------------------------------------------------------|
*/
func er(intJour: Int, binExposant: Bool) ->String {
    //    Retourne er en exposant si la variable est true
        if intJour == 1 {
            if binExposant == true {
                return "ᵉʳ"
            }
            else {
                return "er"
            }
        } else {
            return""
        }
}

/*
|-----------------------------------------------------------------------------|
| jourSemaineEnLitteral:
| Retourne le jour de la semaine en littéral (1=Dimanche,...,7=Samedi)
| Retourne la première lettre en majuscule si binMajuscule vaut true
| Retourne la chaîne vide si le numéro du jour n'est pas entre 1 et 7
|-----------------------------------------------------------------------------|
*/
func jourSemaineEnLitteral(intJourSem: Int, binMajuscule: Bool) -> String {
   /* Entrez le code ici */
    var reponse = ""
     
 //    ajoute le jour de la semaine en littéral selon le jour rentré en paramètre
     switch intJourSem {
     case 1: reponse.append("dimanche")
     case 2: reponse.append("lundi")
     case 3: reponse.append("mardi")
     case 4: reponse.append("mercredi")
     case 5: reponse.append("jeudi")
     case 6: reponse.append("vendredi")
     case 7: reponse.append("samedi")
         
        
     default:
         reponse = ""
     }
     
 //    Mettre en majuscule si la variable est vrai
     if binMajuscule == true{
         reponse = reponse.capitalized
     }
     
     
     return reponse
}

/*
|-----------------------------------------------------------------------------|
| moisEnLitteral:
| Retourne le mois en littéral (1=Janvier,...,12=Décembre)
| Retourne la première lettre en majuscule si binMajuscule vaut true
| Retourne la chaîne vide si le numéro du mois n'est pas entre 1 et 12
|-----------------------------------------------------------------------------|
*/
func moisEnLitteral(intMois:Int, binMajuscule: Bool) -> String {
   /* Entrez le code ici */
    var reponse = ""
    
//    Ajoute le nom du mois à la réponse selon le numéro du mois rentré en paramètre
    switch intMois {
    case 1 : reponse.append("janvier")
    case 2 : reponse.append("février")
    case 3 : reponse.append("mars")
    case 4 : reponse.append("avril")
    case 5 : reponse.append("mai")
    case 6 : reponse.append("juin")
    case 7 : reponse.append("juillet")
    case 8 : reponse.append("août")
    case 9 : reponse.append("septembre")
    case 10 : reponse.append("octobre")
    case 11 : reponse.append("novembre")
    case 12 : reponse.append("décembre")
    default:reponse = ""
    }
    
    //    Mettre en majuscule si la variable est vrai
    if binMajuscule == true {
       reponse = reponse.capitalized
    }
    return reponse
}

/*
|-----------------------------------------------------------------------------|
| bissextile:
| Retourne true si l'année est bissextile sinon retourne false
|-----------------------------------------------------------------------------|
*/
func bissextile(intAnnee: Int)  -> Bool{
   /* Entrez le code ici */
    //    retourne vrai si une année est bissextile
        if intAnnee % 4 == 0 && intAnnee % 100 != 0 || intAnnee % 400 == 0 {
            return true
        }
        else {
            return false
        }
}

/*
|-----------------------------------------------------------------------------|
| nombreJoursAnnee:
| Retourne le nombre de jours qu'il y a dans l'année
|-----------------------------------------------------------------------------|
*/
func nombreJoursAnnee(intAnnee: Int) -> Int{
   /* Entrez le code ici */
    if bissextile(intAnnee: intAnnee) == true {
        return 366
    } else {
        return 365
    }
}

/*
|-----------------------------------------------------------------------------|
| nombreJoursMois:
| Retourne le nombre de jours dans un mois pour une année donnée
| Retourne 0 si le mois n'est pas entre 1 et 12
|-----------------------------------------------------------------------------|
*/
func nombreJoursMois(intMois: Int, intAnnee: Int) -> Int{
   /* Entrez le code ici */
    //    Nombre de jours du mois selon l'année
        var reponse = 0;
        switch intMois {
        case 1 : reponse = 31
    //        Si l'année est bissextile février a 29 jours
        case 2: if bissextile(intAnnee: intAnnee) == true {
            reponse = 29
        } else {
            reponse = 28
        }
        case 3: reponse = 31
        case 4: reponse = 30
        case 5: reponse = 31
        case 6: reponse = 30
        case 7: reponse = 31
        case 8: reponse = 31
        case 9: reponse = 30
        case 10: reponse = 31
        case 11: reponse = 30
        case 12: reponse = 31
        default: reponse = 0
        }
        return reponse
}

/*
|-----------------------------------------------------------------------------|
| dateValide:
| Retourne true si la date est valide
| Retourne false dans le cas contraire
|-----------------------------------------------------------------------------|
*/
func dateValide(intJour: Int, intMois: Int, intAnnee: Int) -> Bool{
    /* Entrez le code ici */
    if intAnnee > 2199 || intAnnee < 1900 {
        return false
    }
    if intMois > 12 || intMois < 1 {
        return false
    }
    
//    Nombre de jours max dans le mois selon la fonction nombreJoursMois
    let joursMax = nombreJoursMois(intMois: intMois, intAnnee: intAnnee)
    
    if intJour > joursMax || intJour < 1{
        return false
    }
    
    return true
}

/*
|-----------------------------------------------------------------------------|
| dateEnNoSerie:
| Convertis une date en numéro de série et retourne ce numéro de série
| (Numéro de série: le numéro du jour à partir du 1er janvier 1900)
| Retourne 0 si la date n'est pas valide
|-----------------------------------------------------------------------------|
*/
func dateEnNoSerie(intJour: Int, intMois: Int, intAnnee: Int) -> Int {
    /* Entrez le code ici */
    var numero = 0
 //    Vérifie si la date est valide
    let valide = dateValide(intJour: intJour, intMois: intMois, intAnnee: intAnnee)
     
     if (!valide) {
          return numero
     }
     
 //    Génère un numéro de série unique
 //    Rajoute le nombre de jours de chaque année jusqu'à l'année rentrée en paramètre
 //    Ne prend pas en considération l'année 1900 puisque c'est la première année
 //    Ne prend pas l'année rentrée en paramètre
     if intAnnee > 1900{
         for i in 1900 ... intAnnee - 1 {
             numero += nombreJoursAnnee(intAnnee: i)
             
         }
         
        
         
         
     }
    //    Rajoute le nombre de jours de chaque mois jusqu'au mois rentré en paramètre
    //    Ne rentre dans la boucle for que si le mois rentré en paramètre est plus grand que janvier sinon il suffit de rajouter le nombre de jours
    //    Ne prend pas le mois rentrée en paramètre
    if intMois > 1 {
        for i in 1 ... intMois - 1 {
            numero += nombreJoursMois(intMois: i, intAnnee: intAnnee)
        }
        
    }
 //   On rajoute le nombre de jours
     numero += intJour
     
     
     return numero
}

/*
|-----------------------------------------------------------------------------|
| noSerieValide:
| Retourne true si le numéro de série est valide
| Retourne false dans le cas contraire
|-----------------------------------------------------------------------------|
*/
func noSerieValide(intNoSerie: Int) -> Bool {
    /* Entrez le code ici */
    //    Numéros de série valides
        if intNoSerie < 1 || intNoSerie > 109573 {
            return false
        } else {
            return true
        }
}

/*
|-----------------------------------------------------------------------------|
| noSerieEnJourSemaine:
| Retourne le no du jour de la semaine (entre 1 et 7)
| qui correspond à un numéro de série
| Retourne 0 si le numéro de série n'est pas valide
|-----------------------------------------------------------------------------|
*/
func noSerieEnJourSemaine(intNoSerie: Int) -> Int {
    /* Entrez le code ici */
    //  Vérifie que le numéro de série est valide
        if noSerieValide(intNoSerie: intNoSerie) == false {
            return 0
        }
    //    le jour de la semaine est le reste de la division du numéro de série par 7
    //    + 1 car le premier jour c'est un lundi
      return   intNoSerie % 7 + 1
}

/*
|-----------------------------------------------------------------------------|
| dateEnJourSemaine:
| Retourne le no du jour de la semaine (entre 1 et 7)
| qui correspond à une date
| Retourne 0 si la date n'est pas valide
|-----------------------------------------------------------------------------|
*/
func dateEnJourSemaine(intJour: Int, intMois: Int, intAnnee: Int) -> Int {
   /* Entrez le code ici */
    //    vérifie que la date est valide
        if dateValide(intJour: intJour, intMois: intMois, intAnnee: intAnnee) == false {
            return 0
        }
        
    //    Retourne le jour de la semaine
        
        let intNoSerie = dateEnNoSerie(intJour: intJour, intMois: intMois, intAnnee: intAnnee)
        return noSerieEnJourSemaine(intNoSerie: intNoSerie)
}

/*
|-----------------------------------------------------------------------------|
| noSerieEnJourDansDate:
| Retourne le no du jour dans une date
| qui correspond à un numéro de série
| Retourne 0 si le numéro de série n'est pas valide
|-----------------------------------------------------------------------------|
*/
func noSerieEnJourDansDate(intNoSerie: Int) -> Int {
   /* Entrez le code ici */
    //    Variable annee va servir à recevoir l'année de la date en question
        var annee = 0;
    //    variable date sera la valeur retournée
        var date = intNoSerie
        
    //    Vérifie si le numéro est valide
        if noSerieValide(intNoSerie: intNoSerie) == false {
            return 0
        }
        
        
        
        for i in 1900 ... 2199{
    //       Tant que la variable date est plus grande que le nombe de jours de l'année on la soustrait
            if  date > nombreJoursAnnee(intAnnee: i){
                date = date - nombreJoursAnnee(intAnnee: i)
                
            } else {
    //            variable annee reçoit l'année dans laquel se trouve la date
                annee = i
                break
            }
            
           
            
        }
        
        for i in 1 ... 12 {
    //       Tant que la variable date est plus grande que le nombe de jours du mois on la soustrait
                if date >  nombreJoursMois(intMois: i, intAnnee: annee) {
                    date = date - nombreJoursMois(intMois: i, intAnnee: annee)
                } else {
                    break
                }
        }
        return date
}

/*
|-----------------------------------------------------------------------------|
| noSerieEnMoisDansDate:
| Retourne le no du du mois dans une date
| qui correspond à un numéro de série
| Retourne 0 si le numéro de série n'est pas valide
|-----------------------------------------------------------------------------|
*/
func noSerieEnMoisDansDate(intNoSerie: Int) -> Int {
    /* Entrez le code ici */
    //    Variable annee va servir à recevoir l'année de la date en question
        var annee = 0;
    //    variable date sera la valeur retournée
        var date = intNoSerie
        
    //    Vérifie si le numéro est valide
        if noSerieValide(intNoSerie: intNoSerie) == false {
            return 0
        }
        
        
        
        for i in 1900 ... 2199{
    //       Tant que la variable date est plus grande que le nombe de jours de l'année on la soustrait
            if  date > nombreJoursAnnee(intAnnee: i){
                date = date - nombreJoursAnnee(intAnnee: i)
                
            } else {
    //            variable annee reçoit l'année dans laquel se trouve la date
                annee = i
                break
            }
            
           
            
        }
        
        for i in 1 ... 12 {
    //       Tant que la variable date est plus grande que le nombe de jous du mois on la soustrait
                if date >  nombreJoursMois(intMois: i, intAnnee: annee) {
                    date = date - nombreJoursMois(intMois: i, intAnnee: annee)
                } else {
                    date = i
                    break
                }
        }
        return date
}

/*
|-----------------------------------------------------------------------------|
| noSerieEnAnneeDansDate:
| Retourne l'année dans une date
| qui correspond à un numéro de série
| Retourne 0 si le numéro de série n'est pas valide
|-----------------------------------------------------------------------------|
*/
func noSerieEnAnneeDansDate(intNoSerie: Int) -> Int {
    /* Entrez le code ici */
    //    Variable annee va servir à recevoir l'année de la date en question
        var annee = 0;
    //    variable date reçoit le numéro de série
        var date = intNoSerie
        
    //    Vérifie si le numéro est valide
        if noSerieValide(intNoSerie: intNoSerie) == false {
            return 0
        }
    
    
    for i in 1900 ... 2199{
//       Tant que la variable date est plus grande que le nombe de jours de l'année on la soustrait
        if  date > nombreJoursAnnee(intAnnee: i){
            date = date - nombreJoursAnnee(intAnnee: i)
            
        } else {
//            variable annee reçoit l'année dans laquel se trouve la date
            annee = i
            break
        }
    }
    return annee
    
}

/*
|------------------------------------------------------------------------------|
| recupereJourActuel:
| Retourne le jour actuel
|------------------------------------------------------------------------------|
*/
func recupereJourActuel() -> Int {
   /* Entrez le code ici */
    let date = Date()
    return Calendar.current.component(.day, from: date)
     
}

/*
|------------------------------------------------------------------------------|
| recupereMoisActuel:
| Retourne le mois actuel
|------------------------------------------------------------------------------|
*/
func recupereMoisActuel() -> Int {
   /* Entrez le code ici */
    let date = Date()
    return Calendar.current.component(.month, from: date)
}

/*
|------------------------------------------------------------------------------|
| recupereAnneeActuelle:
| Retourne l'année actuelle
|------------------------------------------------------------------------------|
*/
func recupereAnneeActuelle() -> Int {
   /* Entrez le code ici */
    let date = Date()
    return Calendar.current.component(.year, from: date)
}

/*
|-----------------------------------------------------------------------------|
| dateEnFormatCourt:
| Retourne la date dans un format court: jj/mm/aaaa
| Par exemple: '01/06/2012'
|-----------------------------------------------------------------------------|
*/
func dateEnFormatCourt(intJour: Int, intMois: Int, intAnnee: Int) -> String {
    /* Entrez le code ici */
    let date = ""
//    Vérifie si la date est valide
    if dateValide(intJour: intJour, intMois: intMois, intAnnee: intAnnee) == false {
        return date
    }
    
    
    var jour = ""
    var mois = ""
    let annee = String(intAnnee)
    
//    Si le jour est plus petit que 10 alors on le retourne avec un 0 devant
    if intJour < 10 {
        jour = "0\(intJour)"
    } else {
        jour = String(intJour)
    }
    
//    Si le mois est plus petit que 10 alors on le retourne avec un 0 devant
    if intMois < 10 {
        mois = "0\(intMois)"
    } else {
        mois = String(intMois)
    }
    
    return "\(jour)/\(mois)/\(annee)"
}

/*
|-----------------------------------------------------------------------------|
| dateEnLitteralCourt:
| Retourne la date dans un format littéral court
| Si le jour est 1, er est en exposant
| Par exemple: '2 juin 2012'
| Offre la possibilité d'afficher la 1ère lettre du mois en majuscule
|-----------------------------------------------------------------------------|
*/
func dateEnLitteralCourt(intJour: Int, intMois: Int, intAnnee: Int, binMoisMajuscule: Bool) -> String {
    /* Entrez le code ici */
    var date = ""
    var jour = ""
    var mois = ""
    var annee = ""
    
//    Vérifie si la date est valide
    if dateValide(intJour: intJour, intMois: intMois, intAnnee: intAnnee) == false {
        return date
    }
    
//    Si c'est le premier du mois on appelle la fonction er pour mettre 1 en exposant, sinon jour reçoit intJour
    if intJour == 1 {
        jour = "1\(er(intJour: intJour, binExposant: true))"
    } else {
        jour = String(intJour)
    }
     
//    Si la booléenne est true alors le nom du mois sera en majuscule
    if binMoisMajuscule == true {
        mois = moisEnLitteral(intMois: intMois, binMajuscule: true)
                } else {
            mois = moisEnLitteral(intMois: intMois, binMajuscule: false)
        }
    
    annee = String(intAnnee)
    
    date = "\(jour) \(mois) \(annee)"
    
    return date
}

/*
|-----------------------------------------------------------------------------|
| dateEnLitteralLong:
| Retourne la date dans un format littéral long
| Si le jour est 1, er est en exposant
| Par exemple: 'Mercredi, le 21 mars 2012'
| Offre la possibilité d'afficher la 1ère lettre du mois en majuscule
|-----------------------------------------------------------------------------|
*/
func dateEnLitteralLong(intJour: Int, intMois: Int, intAnnee: Int,  binMoisMajuscule: Bool) -> String {
    /* Entrez le code ici */
    //    variable date recevra le résultat de la fonction dateEnLitteralCourt
        var date = ""
        
    //    Variable jour recevra le résultat de dateEnJourSemaine qui sera utilisé pour dire le jour de la semaine en littéral
        var jour = 0
        
    //    Vérifie si la date est valide
        if dateValide(intJour: intJour, intMois: intMois, intAnnee: intAnnee) == false {
            return date
        }
        
       date = dateEnLitteralCourt(intJour: intJour, intMois: intMois, intAnnee: intAnnee, binMoisMajuscule: binMoisMajuscule)
        
        jour = dateEnJourSemaine(intJour: intJour, intMois: intMois, intAnnee: intAnnee)
        
        return "\(jourSemaineEnLitteral(intJourSem: jour, binMajuscule: true)), le \(date)"
}
