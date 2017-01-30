﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.РеализацияТовара.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	РеализацияТовара.Дата,
	|	РеализацияТовара.Контрагент,
	|	РеализацияТовара.Номер,
	|	РеализацияТовара.Ответсвенный,
	|	РеализацияТовара.Товар.(
	|		НомерСтроки,
	|		Номенклатура,
	|		Количество,
	|		Цена,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.РеализацияТовара КАК РеализацияТовара
	|ГДЕ
	|	РеализацияТовара.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьТоварШапка = Макет.ПолучитьОбласть("ТоварШапка");
	ОбластьТовар = Макет.ПолучитьОбласть("Товар");
	Подвал = Макет.ПолучитьОбласть("Подвал");

	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьТоварШапка);
		ВыборкаТовар = Выборка.Товар.Выбрать();
		Пока ВыборкаТовар.Следующий() Цикл
			ОбластьТовар.Параметры.Заполнить(ВыборкаТовар);
			ТабДок.Вывести(ОбластьТовар, ВыборкаТовар.Уровень());
		КонецЦикла;

		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
