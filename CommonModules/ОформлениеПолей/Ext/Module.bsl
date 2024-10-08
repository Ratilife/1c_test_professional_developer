﻿&НаКлиентеНаСервереБезКонтекста
Функция ДобавитьОформляемоеПоле(КоллекцияОформляемыхПолей, ИмяПоля) Экспорт
	
	ПолеЭлемента 		= КоллекцияОформляемыхПолей.Элементы.Добавить();
	ПолеЭлемента.Поле 	= Новый ПолеКомпоновкиДанных(ИмяПоля);
 
	Возврат ПолеЭлемента;
	
КонецФункции	

&НаКлиентеНаСервереБезКонтекста
Функция СоздатьГруппуЭлементовОтбора(Знач КоллекцияЭлементов, Представление, ТипГруппы) Экспорт
	
	Если ТипЗнч(КоллекцияЭлементов) = Тип("ГруппаЭлементовОтбораКомпоновкиДанных") Тогда
		КоллекцияЭлементов = КоллекцияЭлементов.Элементы;
	КонецЕсли;
	
	ГруппаЭлементовОтбора = НайтиЭлементОтбораПоПредставлению(КоллекцияЭлементов, Представление);
	Если ГруппаЭлементовОтбора = Неопределено Тогда
		ГруппаЭлементовОтбора = КоллекцияЭлементов.Добавить(Тип("ГруппаЭлементовОтбораКомпоновкиДанных"));
	Иначе
		ГруппаЭлементовОтбора.Элементы.Очистить();
	КонецЕсли;
	
	ГруппаЭлементовОтбора.Представление    = Представление;
	ГруппаЭлементовОтбора.Применение       = ТипПримененияОтбораКомпоновкиДанных.Элементы;
	ГруппаЭлементовОтбора.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.Недоступный;
	ГруппаЭлементовОтбора.ТипГруппы        = ТипГруппы;
	ГруппаЭлементовОтбора.Использование    = Истина;
	
	Возврат ГруппаЭлементовОтбора;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция ДобавитьЭлементКомпоновки(ОбластьДобавления,
									Знач ИмяПоля,
									Знач ВидСравнения,
									Знач ПравоеЗначение = Неопределено,
									Знач Представление  = Неопределено,
									Знач Использование  = Неопределено,
									знач РежимОтображения = Неопределено,
									знач ИдентификаторПользовательскойНастройки = Неопределено) Экспорт
	
	Элемент = ОбластьДобавления.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	Элемент.ЛевоеЗначение = Новый ПолеКомпоновкиДанных(ИмяПоля);
	Элемент.ВидСравнения = ВидСравнения;
	
	Если РежимОтображения = Неопределено Тогда
		Элемент.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.Недоступный;
	Иначе
		Элемент.РежимОтображения = РежимОтображения;
	КонецЕсли;
	
	Если ПравоеЗначение <> Неопределено Тогда
		Элемент.ПравоеЗначение = ПравоеЗначение;
	КонецЕсли;
	
	Если Представление <> Неопределено Тогда
		Элемент.Представление = Представление;
	КонецЕсли;
	
	Если Использование <> Неопределено Тогда
		Элемент.Использование = Использование;
	КонецЕсли;
	
	Если ИдентификаторПользовательскойНастройки <> Неопределено Тогда
		Элемент.ИдентификаторПользовательскойНастройки = ИдентификаторПользовательскойНастройки;
	ИначеЕсли Элемент.РежимОтображения <> РежимОтображенияЭлементаНастройкиКомпоновкиДанных.Недоступный Тогда
		Элемент.ИдентификаторПользовательскойНастройки = ИмяПоля;
	КонецЕсли;
	
	Возврат Элемент;
	
КонецФункции

Функция ДобавитьУсловноеОформление(ФормаОбъекта, ПараметрыОформления, Отбор) экспорт
	// Эта строка кода заменяет префикс "Объект." в строке отбора на пустую строку. Это делается для того, чтобы можно было обратиться к полю в форме напрямую.
	ПолеОформления = СтрЗаменить(Отбор.ТЧ,"Объект.","");
	//Эта строка кода добавляет новый элемент в коллекцию условного оформления формы.
	НовыйЭлемент = ФормаОбъекта.УсловноеОформление.Элементы.Добавить(); 
	
	Для Каждого Элемент Из ПараметрыОформления Цикл
		
		Если Элемент.Ключ="Поле" Тогда
			//Если ключ элемента равен "Поле", то ПолеОформления присваивается значение этого элемента.
			ПолеОформления = Элемент.Значение;
		Иначе
			//Если ключ элемента не равен "Поле", то значение этого элемента устанавливается как значение параметра оформления нового элемента.
			НовыйЭлемент.Оформление.УстановитьЗначениеПараметра(Элемент.Ключ, Элемент.Значение);	
		КонецЕсли;	
		
	КонецЦикла;
	//тот код устанавливает использование нового элемента в Истина, что означает, что он будет использоваться.
	НовыйЭлемент.Использование = Истина;
	
	// Эта строка кода добавляет новый элемент в коллекцию полей нового элемента.
	ОформляемыеПоля = НовыйЭлемент.Поля.Элементы.Добавить();
	//Этот код создает новое поле компоновки данных и присваивает его новому элементу.
	ОформляемыеПоля.Поле = Новый ПолеКомпоновкиДанных(ПолеОформления);
	//Эта строка кода добавляет новый элемент в коллекцию отбора нового элемента.
	ЭлементОтбор = НовыйЭлемент.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	//Этот код создает новое поле компоновки данных и присваивает его левому значению элемента отбора.
	ЭлементОтбор.ЛевоеЗначение 	= Новый ПолеКомпоновкиДанных(Отбор.ТЧ+"."+Отбор.Поле);
	//Если в отборе указан вид сравнения, то он присваивается элементу отбора.
	Если Отбор.Свойство("ВидСравнения") Тогда
		ЭлементОтбор.ВидСравнения  	= Отбор.ВидСравнения;
	Иначе	
		ЭлементОтбор.ВидСравнения  	= ВидСравненияКомпоновкиДанных.Равно;
	КонецЕсли;
	//Значение отбора присваивается правому значению элемента отбора.
	ЭлементОтбор.ПравоеЗначение = Отбор.Значение;	
	//Эта строка кода возвращает структуру, содержащую новый элемент и отбор.
	Возврат Новый Структура("Элемент, Отбор", ФормаОбъекта.УсловноеОформление.Элементы.Количество()-1, НовыйЭлемент.Отбор.Элементы.Количество()-1);
	
КонецФункции