﻿Процедура Печать(ТабДокумент, Ссылка) Экспорт 
	 //Получаем макет по его названию (модуль объекта)
	 Макет = Обработки.Тест.ПолучитьМакет("МакетНеправельныеОтветы");
	 
	 
	 //Получаем доступ к разделу "Шапка"
	 Шапка = Макет.ПолучитьОбласть("Шапка");
	 //Добавляем шапку в табличный документ
	 ТабДокумент.Вывести(Шапка);
	 
	 Вопрос = Макет.ПолучитьОбласть("СтрокаВопрос|Вертикаль");
	 //Получаем доступ к разделу "Строка"
	 Строка = Макет.ПолучитьОбласть("Строка");
	 
	 Контроль = ""; 
	 Для Каждого Стр из Ссылка Цикл
	      //Заполняем строку макета данными полей справочника
		  Если Контроль = "" ИЛИ Контроль <> Стр.Вопрос Тогда
	      		Вопрос.Параметры.Вопрос = Стр.Вопрос;
				Контроль = Стр.Вопрос;
				ТабДокумент.Вывести(Вопрос);
		  КонецЕсли; 
		  Строка.Параметры.Ответ = Стр.Ответ;
		  Строка.Параметры.ПравельныйОтвет = Стр.ПравельныйОтвет;
		  //Добавляем строку в табличный документ
	      ТабДокумент.Вывести(Строка);
		  Если Строка.Параметры.ПравельныйОтвет = Истина Тогда
		      ТабДокумент.Области.Строка.ЦветТекста= WebЦвета.Красный;
		  КонецЕсли;	  

	 КонецЦикла;

КонецПроцедуры	