//为原始Date类型拓展format一个方法，用于日期显示的格式化
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	}
	if (/(y+)/.test(format))
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k])
					.substr(("" + o[k]).length));
	return format;
}
// 扩展日期类
function formatDatebox(value) {
	if (value == null || value == '') {
		return '';
	}
	var dt;
	if (value instanceof Date) {
		dt = value;
	} else {
		dt = new Date(value);
		if (isNaN(dt)) {
			value = value.replace(/\/Date\((-?\d+)\)\//, '$1'); // 标红的这段是关键代码，将那个长字符串的日期值转换成正常的JS日期格式
			dt = new Date();
			dt.setTime(value);
		}
	}

	return dt.format("yyyy-MM-dd"); // 这里用到一个javascript的Date类型的拓展方法，这个是自己添加的拓展方法，在后面的步骤3定义
}
// 扩展 dateTimeBox,使列的editor支持datetimebox
/*
 * $.extend($.fn.datagrid.defaults.editors, { datetimebox : { init:
 * function(container, options){ var input = $('<input
 * type="text">').appendTo(container); options.editable = false;
 * input.datetimebox(options); return input; }, getValue: function(target){
 * return $(target).datetimebox('getValue'); }, setValue: function(target,
 * value){ $(target).datetimebox('setValue', value); }, resize: function(target,
 * width){ $(target).datetimebox('resize', width); }, destroy : function
 * (target) { $(target).datetimebox('destroy'); }, } });
 */

