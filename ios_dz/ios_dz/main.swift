//
//  main.swift
//  ios_dz
//
//  Created by nikita on 23/09/2018.
//  Copyright © 2018 nikita. All rights reserved.
//

import Foundation


protocol writeInfo {
    func showInfo()
}


class CommonInfo{
    
    var id:Int,
    balance:Float,
    currency:String;
    
    init(id:Int,balance:Float,currency:String){
        self.id = id
        self.balance = balance
        self.currency = currency
    }
    
    func showCommonInfo() {
        print("id: \(self.id) balance: \(self.balance) currency: \(self.currency)")
    }
    
}


class Account : CommonInfo,writeInfo{
    var description:String,
    offer:String?;
    
    init(id:Int,balance:Float,currency:String,description:String,offer:String? = nil){
        self.description = description
        self.offer = offer
        super.init(id: id,balance: balance,currency: currency)
    }
    
    func showInfo(){
        super.showCommonInfo()
        print("description: \(self.description) offer: \(String(describing: self.offer))")
        
    }
    
}

class ReissueInfo: writeInfo{
    var date: Date,
    info: String,
    adress: String;
    
    init(date: Date, info: String, adress: String = "Головной офис"){
        self.date = date
        self.info = info
        self.adress = adress
    }
    
    func showInfo(){
        print("date: \(self.date) info: \(self.info) adress: \(self.adress)")
        
    }
}

class Card: CommonInfo,writeInfo{
    var reissueInfo: ReissueInfo?
    
    init(id:Int,balance:Float,currency:String,reissueInfo: ReissueInfo? = nil)
    {
        if let reissueInfo  = reissueInfo{
            self.reissueInfo = reissueInfo
        }
        super.init(id: id, balance: balance, currency: currency)
        
    }
    
    func showInfo() {
        print("id: \(self.id) balance: \(self.balance) currency: \(self.currency)")
        self.reissueInfo?.showInfo()
    }
    
    
}

class ServerResponse:writeInfo{
    var cards:[Card],
    accounts:[Account];
    
    init(cards: [Card], accounts: [Account])
    {
        self.cards = cards
        self.accounts = accounts
    }
    func showInfo(){
        for card in self.cards{
            card.showInfo()
        }
        
        for account in self.accounts{
            account.showInfo()
        }
    }
}

let ac1 = Account(id: 1, balance: 245, currency: "RUR", description: "desc")
let ac2 = Account(id: 2, balance: 567658, currency: "USD", description: "nothing", offer: "1010" )
let accss = [ac1, ac2]
let Date = NSDate()
let reissueInfo = ReissueInfo(date: Date as Date, info: "infa", adress: "SELCO")
let card1 = Card(id: 3, balance: 12, currency: "EUR", reissueInfo: reissueInfo)
let card2 = Card(id: 4, balance: 100, currency: "RUR")
let cardss = [card1, card2]
let response = ServerResponse(cards: cardss, accounts: accss)


var array: [writeInfo] = []

array.append(cardss[0])
array.append(cardss[1])
array.append(accss[0])
array.append(accss[1])

array.append(response)

for item in array {
    item.showInfo()
}
