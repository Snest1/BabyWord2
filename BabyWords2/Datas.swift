//
//  Data.swift
//  BabyWords2
//
//  Created by Admin on 16.01.2019.
//  Copyright © 2019 Developer Inspirus. All rights reserved.
//

import Foundation
import UIKit



// sprashivat po ocheredi. oshibka - sbros
// dobavit slov
// dobavit russkie
// dobavit cifra
// nastrijka na ekrane kolva cifr
// dobavlat slova i kartinki vnutri
//ostanavlivat izuchenie kakihto slov
// raznoobrazit   ti umnica

class Datas {
    
    static let Words = Datas()
    
    var RealAnswerIs = (eng: "", rus: "")
    var SelectedAnswerIs = (eng: "", rus: "", curIndex: 0, showedIndex: 0)

//    //  brother snowman baby        iam masha       green grandmother grandfather red hand  leg  head  nose  scarf   uho  glaza  rot  TVset telephone
//    // hello  table  chair  shkaf  door   bed    polka   lamp  button   cat  dog   brovi   hair  finger  shtory  polotence    zubi  mouse bear  house  korridor
//    // gostinnaya   detskay   zal     zhivot  spina  gubi   floor  potolok   etazh  arm   knees   book  room   apelsin
//    // 1 2 3 4 5 6    100
//    // what is your name
//    // moscow
//    //run   go  swim
//    //flower
//
    var  set = [
//        (eng: "1000",   rus: "1000",     image: "gray",     fontcolor: .black),
//        (eng: "1000000",  rus: "1000000",     image: "white",     fontcolor: .black),
//        (eng: "100",  rus: "100",    image: "black",     fontcolor: UIColor(red: 255/255.0,     green: 255/255.0,     blue: 255/255.0,     alpha: 0.8))
        (eng: "Gray",   rus: "Серый",     image: "gray",     fontcolor: .black),
        (eng: "White",  rus: "Белый",     image: "white",     fontcolor: .black),
        (eng: "Black",  rus: "Черный",    image: "black",     fontcolor: UIColor(red: 255/255.0,     green: 255/255.0,     blue: 255/255.0,     alpha: 0.8)),
//        (eng: "Orange", rus: "Оранжевый", image: "orangecolour",     .black),     //????
// rozoviy
        (eng: "Yellow", rus: "Жёлтый",    image: "yellow",     fontcolor: .yellow),
        (eng: "Red",   rus: "Красный",   image: "red",   fontcolor: .black),
        (eng: "Blue",   rus: "Синий",   image: "blue",   fontcolor: .black),
        (eng: "Green",   rus: "Зелёный",   image: "green",   fontcolor: .black),
        (eng: "Boy",    rus: "Мальчик",   image: "boy",    fontcolor: .black),
        (eng: "Girl",   rus: "Девочка",   image: "girl",   fontcolor: .black),
        (eng: "Mother", rus: "Мама",      image: "mather", fontcolor: .black),
        (eng: "Father", rus: "Папа",      image: "father", fontcolor: .black),
        (eng: "Sister",   rus: "Сестра",   image: "Сестра",   fontcolor: .black),
        (eng: "Brother",   rus: "Брат",   image: "Brother",   fontcolor: .black),
        (eng: "Grandmother",   rus: "Бабушка",   image: "Grandmum",   fontcolor: .black),
        (eng: "Grandfather",   rus: "Дедушка",   image: "Granddad",   fontcolor: .black),
        (eng: "Baby",   rus: "Малыш",   image: "Baby",   fontcolor: .black),
        (eng: "Body",   rus: "Тело",   image: "Body",   fontcolor: .black),
        (eng: "Hand",   rus: "Рука",   image: "Hand",   fontcolor: .black),
        (eng: "Leg",   rus: "Нога",   image: "leg",   fontcolor: .black),
        (eng: "Eyes",   rus: "Глаза",   image: "Eyes",   fontcolor: .black),
        (eng: "Nose",   rus: "Нос",   image: "nose",   fontcolor: .black),
        (eng: "Head",   rus: "Голова",   image: "Head",   fontcolor: .black),
        (eng: "Cat",   rus: "Кошка",   image: "cat",   fontcolor: .black),
        (eng: "Dog",   rus: "Собака",   image: "dog",   fontcolor: .black),
        (eng: "Mouse",   rus: "Мышь",   image: "mouse",   fontcolor: .black),
        (eng: "Bear",   rus: "Медведь",   image: "bear",   fontcolor: .black),
        (eng: "Apple",   rus: "Яблоко",   image: "apple",   fontcolor: .black),
        (eng: "Orange",   rus: "Апельсин",   image: "orange",   fontcolor: .black),  //?????
        (eng: "Banana",   rus: "Банан",   image: "banana",   fontcolor: .black),
        (eng: "One",   rus: "Один",   image: "1",   fontcolor: .black),
        (eng: "Two",   rus: "Два",   image: "2",   fontcolor: .black),
        (eng: "Three",   rus: "Три",   image: "3",   fontcolor: .black),
        (eng: "Four",   rus: "Четыре",   image: "4",   fontcolor: .black),
        (eng: "Five",   rus: "Пять",   image: "5",   fontcolor: .black),
        (eng: "Six",   rus: "Шесть",   image: "6",   fontcolor: .black),
        (eng: "Seven",   rus: "Семь",   image: "7",   fontcolor: .black),
        (eng: "Eight",   rus: "Восемь",   image: "8",   fontcolor: .black),
        (eng: "Nine",   rus: "Девять",   image: "9",   fontcolor: .black),
        (eng: "Ten",   rus: "Десять",   image: "10",   fontcolor: .black),
        (eng: "Hundred",   rus: "Сто",   image: "100",   fontcolor: .black),
 //       (eng: "Table",   rus: "Стол",   image: "table",   fontcolor: .black),
 //       (eng: "Chair",   rus: "Стул",   image: "chair",   fontcolor: .black),
        (eng: "Go",   rus: "Ходить",   image: "go",   fontcolor: .black),
        (eng: "Swim",   rus: "Плавать",   image: "swim",   fontcolor: .black),
        (eng: "Run",   rus: "Бегать",   image: "run",   fontcolor: .black)
        ]
    
    //   snowman         iam masha      scarf TVset telephone
    
    // hello  shkaf  door   bed    polka   lamp  button    finger  shtory  polotence    bear  house  korridor
    
    // gostinnaya   detskay   zal    floor  potolok   etazh  arm   knees   book  room   apelsin
    
    //
    
    // what is your name
    
    // moscow
    
    //
    
    //flower

    
    
    
}
