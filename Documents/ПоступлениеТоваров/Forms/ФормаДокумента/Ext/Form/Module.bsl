﻿
&НаКлиенте
Процедура ТоварКоличетсвоПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные = Элементы.Товар.ТекущиеДанные;
	ТекущиеДанные.Сумма = ТекущиеДанные.Количетсво * ТекущиеДанные.Цена; 
КонецПроцедуры

&НаКлиенте
Процедура ТоварЦенаПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные = Элементы.Товар.ТекущиеДанные;
	ТекущиеДанные.Сумма = ТекущиеДанные.Количетсво * ТекущиеДанные.Цена; 
КонецПроцедуры

&НаКлиенте
Процедура ТоварСуммаПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные = Элементы.Товар.ТекущиеДанные;
	Если ТекущиеДанные.Количетсво = 0 Тогда
		ТекущиеДанные.Цена = 0;
	Иначе
		ТекущиеДанные.Цена = ТекущиеДанные.Сумма / ТекущиеДанные.Количетсво;
	КонецЕсли;

КонецПроцедуры


