﻿

&НаКлиенте
Процедура РасчитатьПроцентОшибок(Команда)
	Запись.ПроцентОшибок = Окр(Запись.НеправельныеОтветы * 100 / Запись.ВопросовВсего,0);
КонецПроцедуры
