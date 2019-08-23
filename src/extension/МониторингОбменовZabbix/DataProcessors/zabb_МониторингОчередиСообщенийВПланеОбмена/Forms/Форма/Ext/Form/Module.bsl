﻿&НаСервере
Процедура КомандаПрочитатьНастройкиНаСервере()
	обработкаОбъект = РеквизитФормыВЗначение("Объект");
	настройки = обработкаОбъект.ПолучитьНастройкиМониторингаОбменов();
	ЗаполнитьЗначенияСвойств(ЭтаФорма, настройки);
КонецПроцедуры

&НаКлиенте
Процедура КомандаПрочитатьНастройки(Команда)
	КомандаПрочитатьНастройкиНаСервере();
КонецПроцедуры

&НаСервере
Процедура КомандаСохранитьНастройкиНаСервере()
	обработкаОбъект = РеквизитФормыВЗначение("Объект");
	настройки = обработкаОбъект.СтруктураНастроекМониторнигаОбменов();
	ЗаполнитьЗначенияСвойств(настройки, ЭтаФорма);
	обработкаОбъект.СохранитьНастройкиМониторингаОбменов(настройки);
КонецПроцедуры

&НаКлиенте
Процедура КомандаСохранитьНастройки(Команда)
	КомандаСохранитьНастройкиНаСервере();
КонецПроцедуры

&НаСервере        
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	КомандаПрочитатьНастройкиНаСервере();
КонецПроцедуры

&НаСервереБезКонтекста
Процедура КомандаСоздатьЭлементыМониторингаНаСервере()
	обработкаМониторингОбменов = Обработки.zabb_МониторингОчередиСообщенийВПланеОбмена.Создать();
	обработкаМониторингОбменов.СформироватьЭлементыДанныхZabbix();
КонецПроцедуры

&НаКлиенте
Процедура КомандаСоздатьЭлементыМониторинга(Команда)
	Если Модифицированность = Истина Тогда
		ПоказатьПредупреждение(Неопределено, "Перед созданием элементов мониторинга необходимо сохранить настройки.",,"Создать элементы мониторинга");
	Иначе
		КомандаСоздатьЭлементыМониторингаНаСервере();
	КонецЕсли;
КонецПроцедуры
