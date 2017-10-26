/*
 * JavaScript Common Library v1.0
 * 
 * jQuery plugins
 * 
 * Encode: UTF-8
 * Author: chenr
 *
 */

 //namespace: jcl.ui


//extend js Object method

Date.prototype.getDays = function() { 
    return new Date(this.getFullYear(), this.getMonth()+1, 0).getDate();
};
Date.prototype.toYmdString = function() { 
    return this.getFullYear() +'-'+ (this.getMonth()<9?'0':'')+(this.getMonth()+1)+'-'+(this.getDate()<10?'0':'')+this.getDate();
};
String.prototype.lengths=function(charset){
	if(/^gbk$/i.test(charset)){
		return this.replace(/[^\x00-\xff]/g,"**").length; 
	}else{
		return this.replace(/[\u0080-\u07ff]/g,"**").replace(/[\u0800-\uffff]/g,"***").length;
	}
};
String.prototype.trim=function(){ 
	return this.replace(/^[\s\u00A0]*|[\s\u00A0]*$/g, '');
};

//=============================================================================

jcl = window.jcl||{
	env : {
		contextPath: '',
		profile:{},
		isIE6: /msie 6\.0/i.test(navigator.userAgent)
	},
	namespace : function(){
		var o, d;
	    for(var i = 0; i < arguments.length; i++){
	    	d = arguments[i].split(".");
	    	o = window[d[0]] = window[d[0]] || {};
	    	for(var j = 1; j < d.length; j++){
	    		 o = o[d[j]] = o[d[j]] || {};
	    	}
	    }
	    return o;
	},
	message : {
		get : function(key, arr, defvalue){
			var message = '';
			if(null == key) return message;
			if(this[key]){
				message = (this[key]).toString();
				if(arr && arr instanceof Array){
					for(var i = 0; i < arr.length; i++){
						message = message.replace('{'+i+'}', arr[i]);
					}
				}
			}else{
				if(defvalue != undefined){
					message = defvalue;
				}else if(typeof(arr) == 'string'){
					message = arr;
				}else{
					message = key;
				}
			}

			return message;
		}
	},
	code : {
		get:function(category, code){
			var codes = this.getCodes(category);
			if(codes){
				if(codes[code]){
					return codes[code];
				}
			}
			return code;
		},
		getCodes:function(category){
			if(this[category]){
				return this[category];
			}
			return {};
		},
		selector:function(id, category, title){
			var codes = this.getCodes(category);
			var htmlstr = '';
			if(title){//text,value
				htmlstr += '<option value="'+title['value']+'">'+title['text']+'</option>';
			}
			for(var i in codes){
				htmlstr += '<option value="'+i+'">'+codes[i]+'</option>';
			}
			jQuery('#'+id).html(htmlstr);
		}
	},
	convert : function(v, render){
		if(render){
			if(typeof(render) == 'function'){//自定义转化器
				return render(v);
			}else{
				if(jcl.util.convert[render]){//公用转化器
					return jcl.util.convert[render](v);
				}
				if(jcl.code[render]){//代码表转化
					if(jcl.code[render][v]){
						return jcl.code[render][v];
					}
				}
			}
		}
		return v;
	},
	go : function(uri){
		var url = [jcl.env.contextPath, uri].join('');
		window.location.href = url;
	}
};
jcl.ns = jcl.namespace;
jcl.ns("jcl.ui", "jcl.util");

jcl.util.convert = {
	date : function(v){
		try{
			var d = new Date(parseInt(v, 10));
			var month = (d.getMonth() + 1).toString();
			var year = (d.getFullYear()).toString();
			var day = (d.getDate()).toString();
			return [year,
			        (month.length < 2 ? "-0":"-"), month,
			        (day.length < 2 ? "-0":"-"), day
			        ].join("");
		}catch(e){
			return v;
		}
	},
	datetime:function(v){
		try{
			var d = new Date(parseInt(v, 10));
			var month = (d.getMonth() + 1).toString();
			var year = (d.getFullYear()).toString();
			var day = (d.getDate()).toString();
			var hour = (d.getHours()).toString();
			var min = (d.getMinutes()).toString();
			var sec = (d.getSeconds()).toString();
			return [year,
			        (month.length < 2 ? "-0":"-"), month,
			        (day.length < 2 ? "-0":"-"), day,
			        (hour.length < 2 ? " 0":" "), hour,
			        (min.length < 2 ? ":0":":"), min,
			        (sec.length < 2 ? ":0":":"), sec
			        ].join("");
		}catch(e){
			return v;
		}
	}
};

//=============================================================================

//jquery plugin bgiframe for ie6
(function($){
	$.fn.bgiframe = (/msie 6\.0/i.test(navigator.userAgent) ? function(s) {
	    s = $.extend({
	        top     : 'auto', // auto == .currentStyle.borderTopWidth
	        left    : 'auto', // auto == .currentStyle.borderLeftWidth
	        width   : 'auto', // auto == offsetWidth
	        height  : 'auto', // auto == offsetHeight
	        opacity : true,
	        src     : 'javascript:false;'
	    }, s);
	    var html = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="'+s.src+'"'+
	                   'style="display:block;position:absolute;z-index:-1;'+
	                       (s.opacity !== false?'filter:Alpha(Opacity=\'0\');':'')+
	                       'top:'+(s.top=='auto'?'expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+\'px\')':prop(s.top))+';'+
	                       'left:'+(s.left=='auto'?'expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+\'px\')':prop(s.left))+';'+
	                       'width:'+(s.width=='auto'?'expression(this.parentNode.offsetWidth+\'px\')':prop(s.width))+';'+
	                       'height:'+(s.height=='auto'?'expression(this.parentNode.offsetHeight+\'px\')':prop(s.height))+';'+
	                '"/>';
	    return this.each(function() {
	        if ( $(this).children('iframe.bgiframe').length === 0 )
	            this.insertBefore( document.createElement(html), this.firstChild );
	    });
	} : function() { return this; });
	
	// old alias
	$.fn.bgIframe = $.fn.bgiframe;
	
	function prop(n) {
	    return n && n.constructor === Number ? n + 'px' : n;
	}

})(jQuery);

//jcl depend on jquery lib
(function($){
	
	//设定AJAX请求的默认Method=POST
	jcl.ajax = function(options){

		var _needLoading = !!options.loading;
		jcl.ajax.loading = jcl.ajax.loading || new jcl.ui.Loading({id:'jcl-ajax-loading'});
		jcl.ajax.loading.count = jcl.ajax.loading.count || 0;
		if(_needLoading)
			_show();

		// var _needLoading = !!options.loading;
		// var _loading = null;
		// if(_needLoading){
		// 	_loading = new jcl.ui.Loading({id:'jcl-ajax-loading'});
		// 	_loading.show();
		// }
		function _hide(){
			jcl.ajax.loading.count --;
			if(jcl.ajax.loading.count == 0){
				jcl.ajax.loading.hide();
			}
		}

		function _show(){
			jcl.ajax.loading.count ++;
			jcl.ajax.loading.show();
		}
		
		function _showError(message, url){
//			var dialog = new jcl.ui.Dialog({id:'jcl-ajax-error', width: 400});
//			dialog.addHtml(message);
//			dialog.show();
			jcl.ui.messagebox.show({
				title:jcl.message.get('ui.common.messagebox.error', 'error'),
				icon:'icon-msg-error',
				btn: { text : jcl.message.get('ui.common.messagebox.ok', 'OK'), 
					   click: function(btn, msgbox){
							msgbox.hide();
							if(url){
								jcl.go(url);
							}
					   }
				},
				text:message
			});
//			jcl.msg.error(message);
		}
		$.ajax($.extend({
			type:'POST',
			error:function(jqXHR, status, e){
				_showError('['+status +']: '+ e.message);
				// if(_needLoading)_loading.hide();
				if(_needLoading) _hide();
			},
			success:function(data, status, jqXHR){
				// if(_needLoading)_loading.hide();
				if(_needLoading) _hide();
				if(data.error){
					var message = '';
					for(var i = 0; i < data.error.length; i++){
						message += jcl.message.get(data.error[i]);
					}
					_showError(message, data.url);
				}else{
					if(this.callback)
						this.callback(data);
				}
			},
			callback:function(){}
		}, options));
	};

	jcl.postJSON = function(uri, params, callback, loading){
		var url = [jcl.env.contextPath, uri].join('');
		url += ((url.indexOf('?') != -1) ? '&' : '?' ) + 'format=json&t=' + new Date().getTime();
		var _loading = true;
		if(loading != undefined){_loading = loading;}
		jcl.ajax({
			loading: _loading,
			url : url,
			data: params,
			dataType: 'json',
			callback: function(data){
				if(typeof(data) == 'object'){
					//TODO 处理业务异常
					//if(common_callback(data)){;}
					callback(data);
				}else{
					//TODO 处理其他服务异常
				}
			}
		});
	};

	jcl.ui.Mask = function(options){

		var _self = this;

		this.opts = $.extend({
			zindex : 500
		}, options);

		this.jqDom = (function(opts){
			var jqDom = $('<div class="mask" style="z-index:'+opts.zindex+'"></div>').prependTo('body');
			return jqDom;
		})(this.opts);

		
		function _getIndex(jqDom){
			var zindex = jqDom.css('z-index');

			//需要向上递归，取到非零值
			if(!isNaN(zindex) && zindex>0){
				return zindex;
			}
			//如果到达顶层，就返回0
			if(jqDom.is('body,html')){
				return 0;
			}else{
				return _getIndex(jqDom.parent());
			}
		}

		function _hideSelectBox(dom){
			var maskzIndex = _self.opts.zindex;
			$(dom).find('select').each(function(){
				var zindex = _getIndex($(this));
				if(isNaN(zindex) || parseInt(zindex) < maskzIndex){
					var maskcount = ($(this).data('maskcount') || 0 ) + 1;
					$(this).data('maskcount', maskcount).css('visibility', 'hidden');
				}
			});
		}
		function _showSelectBox(dom){
			$(dom).find('select').each(function(){
				var maskcount = $(this).data('maskcount');
				if(maskcount){
					if(maskcount == 1){
						$(this).css('visibility', 'visible').removeData('maskcount');
					}else{
						$(this).data('maskcount', maskcount-1);
					}
				}
			});
		}

		//开启检测tab键获取焦点，并过滤
		function _bindFilterFocus(){
			var maskzIndex = _self.opts.zindex;
			var list = $(document).data('masklist') || [];
			if(list.length == 0){
				$(document).bind('focusin.mask', function(e){
					_filterFocus();
				});
			}
			//如果已加入焦点过滤处理，则不在重复加入
			for(var i = 0; i < list.length; i++){
				if(_self === list[i].mask){
					return;
				}
			}
			list.push({zindex: maskzIndex, mask: _self});
			list.sort(function(x, y){
				return y.zindex - x.zindex;
			});
			$(document).data('masklist', list);
		}

		//关闭检测tab键获取焦点过滤
		function _unbindFilterFocus(){
			var list = $(document).data('masklist') || [];
			if(list.length == 0) return;
			for(var i = 0; i < list.length; i++){
				if(_self === list[i].mask){
					list.splice(i, 1);
					break;
				}
			}
			if(list.length == 0){
				$(document).unbind('focusin.mask');
			}
		}

		//过滤mask之下的焦点获取
		function _filterFocus(){
			if(!document.activeElement) return;
			var list = $(document).data('masklist') || [];
			if(list.length == 0) return;
			var maskzIndex = list[0].zindex;
			var dom = $(document.activeElement);
			if(dom.is('body,html')){return;}
			if(_getIndex(dom) < maskzIndex){
				dom.blur();
				var divs = $(document).find('a,input,select,textarea,checkbox,radio');
				for(var i = 0; i < divs.length; i++){
					dom = divs.eq(i);
					if(_getIndex(dom) > maskzIndex){
						dom.focus();
						return;
					}
				}
			}
		}

		function _resize(){
			_self.jqDom.width($(window).width()).height($(window).height());
			_self.jqDom.width('100%');
			_self.jqDom.height($(document).height());
		}
		
		this.show = function(){
			//如果不是document， 需要设置宽度
			var jqDom = this.jqDom;
			jqDom.css('opacity', 0.66).show();
			if(jcl.env.isIE6){
				_hideSelectBox(document);
			}
			$(window).bind('resizes', _resize);
			_bindFilterFocus();
			_filterFocus();
			_resize();
		};
		this.hide = function(){
			if(jcl.env.isIE6){
				this.jqDom.fadeOut('slow', function(){_showSelectBox(document);});
			}else{
				this.jqDom.fadeOut('slow');
			}
			
			$(window).unbind('resizes', _resize);
			_unbindFilterFocus();
		};
	};

	//使当前对象始终在窗口中居中
	$.fn.middle = function(){
		var $this = this;
		if($this.data('middle')) return;
		$this.css({'position':'absolute'});
		
		var resizeEventHandler = function(){
			var top = $(window).height() - $this.height();
			top = top > 0 ? top/2 : 0;
			top += $(window).scrollTop();
			var left = $(window).width() - $this.width();
			left = left > 0 ? left/2 : 0;
			$this.css({'top': top+'px', 'left': left + 'px'});
		};
		$(window).bind('resize scroll', resizeEventHandler);
		resizeEventHandler();
		$this.data('middle', resizeEventHandler);
		return this;
	};
	//取消当前对象始终在窗口中居中
	$.fn.unmiddle = function(){
		var resizeEventHandler = this.data('middle');
		if(this.data('middle')){
			$(window).unbind('resize scroll', resizeEventHandler);
			this.removeData('middle');
		}
		return this;
	};

	jcl.ui.Loading = function(options){
		var _self = this;
		this.opts = $.extend({
			zindex : 900,
			text: jcl.message.get('ui.common.loading')
		}, options);

		this.jqDom = (function(opts){
			var jqDom = $('<div class="loading" style="z-index:'+opts.zindex+'; display:none;"><span>'+opts.text+'</span></div>').prependTo('body');
			_self.mask = new jcl.ui.Mask({zindex: opts.zindex - 1});
			return jqDom;
		})(this.opts);
		
		this.show = function(){
			this.jqDom.show().middle();
			this.mask.show();
		};
		this.hide = function(){
			this.mask.hide();
			this.jqDom.unmiddle().fadeOut();
		};
	};

	jcl.ui.Box = function(options){
		var _width = 0;
		
		var _defaults = {
			id:'',
			title:'',
			width:'auto',
			minWidth: 688
		};
		var $box = this;
		
		function _init(){
			var opts = $box.opts;
			var id = opts.id;
			if(!id){
				id = 'box_' + new Date().getTime();
				opts.id = id;
			}
			if(typeof(opts.width) == 'number'){
				_width = opts.width;
			}else{
				_width = $(window).width() - 20;
				_width = (_width < opts.minWidth ? opts.minWidth : _width);
			}
			if($('#'+id).length==0){
				$('body').prepend('<div class="box" id="'+id+'" style="width:'+opts.width+'px;"></div>');
			}
			
			var htmlstr = '';
			//标题栏
			htmlstr +='<div class="box-title-wrap-m">';
			htmlstr +='<div class="box-title-wrap-l"><div class="box-title-wrap-r">';
			htmlstr +='<div class="box-title">'+opts.title+'</div>';
			htmlstr +='</div></div></div>';	
			
			//内容栏
			htmlstr +='<div class="box-content-wrap-b box-b-border"><div class="box-content-wrap-t">';
			htmlstr +='<div class="box-content"></div>';
			htmlstr +='</div></div>';	
			
			var $this = $('#' + opts.id);
			$this.empty().html(htmlstr).width(_width);
			if(opts.width == 'auto'){
				$(window).resize(function(){
					var width = $(window).width() - 20;
					width = (width < opts.minWidth ? opts.minWidth : width);
					$this.width(width);
				});
			}
		}
		this.opts = $.extend(_defaults, options);
		
		this.addDom=function(domId){
			$('#'+$box.opts.id).find('.box-content').append($('#'+domId));
		};
		
		this.addHtml = function(html){
			$('#' +$box.opts.id).find('.box-content').append(html);
		};
		_init();
	};
	
	jcl.ui.Dialog = function(options){
	
		var _defaults = {
			id: null,
			zindex : 700,
			title: '',
			width: 500,
			closeable: true,
			modal:true
		};
		var _mask = null;
		
		var $dialog = this;
		
		function _init(){
			var opts = $dialog.opts;
			var id = opts.id;
			if(!id){
				id = 'dialog_' + new Date().getTime();
				opts.id = id;
			}
			var $this = $('#'+id);
			if($this.length==0){
				$('body').prepend('<div id="'+id+'" class="dialog box" style="z-index:'+opts.zindex+'; width:'+opts.width+'px; display:none;"></div>');
				$this = $('#'+id);
			}
			
			var htmlstr = '';
			var hasTitle = (opts.title != '' || opts.closeable);
			if(hasTitle){
				htmlstr += '<div class="box-title-wrap-m"><div class="box-title-wrap-l"><div class="box-title-wrap-r">';
				htmlstr += opts.closeable ? '<a href="javascript:void(0);" class="box-btn-close"></a>' : '';
				htmlstr += '<div class="box-title">'+opts.title+'</div>';
				htmlstr += '</div></div></div>';
			}
			htmlstr += '<div class="box-content-wrap-b box-b-border"><div class="box-content-wrap-t'+(hasTitle ? '':' box-t-border')+'">';
			htmlstr += '<div class="box-content">';
			
			htmlstr += '</div></div></div>';
			
			$this.empty().append(htmlstr);
			
			if(opts.modal){
				_mask = new jcl.ui.Mask({id:'mask_'+id, zindex: opts.zindex - 1 });
			}
			if(opts.closeable){
				$('#'+id).find('.box-btn-close').click(function(){
					$dialog.hide();
				});
			}
		}
		this.opts = $.extend(_defaults, options);
		
		this.addDom = function(domId){
			$('#' +$dialog.opts.id).find('.box-content').append($('#'+domId));
		};
		this.addHtml = function(html){
			$('#' +$dialog.opts.id).find('.box-content').append(html);
		};
		this.show = function(){
			$('#' + $dialog.opts.id).show().middle();
			if(_mask)_mask.show();
		
		};
		this.hide = function(){
			if(_mask)_mask.hide();
			$('#' + $dialog.opts.id).unmiddle().hide();
		};
		_init();
		return this;
		
	};
	jcl.ui.messagebox = {
		OK: 'ok',
		dialog : null,
		show : function(options){
			var _msgbox = this;
			var _btns = {'ok' :{ text : jcl.message.get('ui.common.messagebox.ok', 'OK'), click: function(btn, msgbox){
					msgbox.hide();
				}
			}};
			if(this.dialog == null){
				this.dialog = new jcl.ui.Dialog(options);
				var htmlstr = '<table><tr><td><div class="box-icon"></div></td><td><div class="box-msg"></div></td></tr></table>';
				htmlstr += '<div class="box-btn"></div>';
				this.dialog.addHtml(htmlstr);
			}
			var $dialog = $('#' + this.dialog.opts.id);
			$dialog.width(options.width || 400);
			$dialog.find('.box-title').text(options.title || '');
			$dialog.find('.box-icon').attr('class', 'box-icon '+(options.icon || 'icon-msg-none'));
			$dialog.find('.box-msg').width($dialog.width()- 84).text(options.text || '');
			if(options.btn){
				var $boxbtn = $dialog.find('.box-btn').empty();
				function _btn(btn){
					if(typeof(btn) == 'string'){
						if(_btns[btn]){
							_btn(_btns[btn]);
						}
					}else{
						var id = 'messagebox-btn-'+new Date().getTime();
						var htmlstr ='<input type="button" class="btn" value="'+btn.text+'" id="'+id+'"/>';
						$boxbtn.append(htmlstr);
						$boxbtn.find('#'+id).click(function(){
							btn.click(this, _msgbox);
						});
					}
				}
				if(options.btn instanceof Array){
					for(var i = 0; i < options.btn; i++){
						var btn = options.btn[i];
						_btn(btn);
					}
				}else {
					_btn(options.btn);
				}
			}
			
			this.dialog.show();
		},
		hide : function(){
			this.dialog.hide();
		}
	};
	jcl.msg = {
		error: function(msg){
			jcl.ui.messagebox.show({
				title:jcl.message.get('ui.common.messagebox.error', 'error'),
				icon:'icon-msg-error',
				btn: jcl.ui.messagebox.OK,
				text:msg
			});
		},
		warn: function(msg){
			jcl.ui.messagebox.show({
				title:jcl.message.get('ui.common.messagebox.warn', 'warn'),
				icon:'icon-msg-warn',
				btn: jcl.ui.messagebox.OK,
				text:msg
			});
		},
		info: function(msg){
			jcl.ui.messagebox.show({
				title:jcl.message.get('ui.common.messagebox.info', 'info'),
				icon:'icon-msg-info',
				btn: jcl.ui.messagebox.OK,
				text:msg
			});
		}
	};
	
	jcl.ui.Grid = function(options){
		var _outBorderWidth = 2;//最外层边框
		var _checkboxColumnWidth = 35;//选择框列宽度
		var _cellBorderWidth = 2;//单元格左右边框
		var _scrollerWidth = 19;//滚动条宽度
		var _scrollerBorderWidth = 1;//滚动条列边框宽度
		var _colws = [];//列宽度列表
		var _width = 0;//grid的宽度
		var $grid = this;
		
		var _defaults = {
		    id: null,
			title:'',
			columns:[],
			checkboxEnable:true,
			pagebar:true,
			width: 'auto',
			minWidth: 688,
			height:265,
			ds: null, //{url, params, callback}
			qform: null,
			rowCallback:null
		};
		
		//组装pagebar
		function _pagebar(page){
			var opts = $grid.opts;
			var $this = $('#' + opts.id);
			if(!opts.pagebar) return;
			
			var total = page.total;
			var size = page.size;
			var currpage = page.index;
			var begin = (currpage-1)*size+1;
			var end = currpage*size;
			begin = begin > total ? total : begin;
			end = end > total ? total : end;
			var totalpage = Math.ceil(total/size);
			totalpage = totalpage == 0 ? 1 : totalpage;
			
			//此处使用模板，来兼容国际化字符处理
			
			var htmlstr = '';
			htmlstr += '<div class="pagebar-pbtn-box">';
			htmlstr += '<span class="pgb-pbtn pbtn-first'+(currpage>1?'':'-disabled')+'"></span>';
			htmlstr += '<span class="pgb-pbtn pbtn-prev'+(currpage>1?'':'-disabled')+'"></span>';
			htmlstr += '<span class="pgb-text">';
			htmlstr += jcl.message.get('ui.common.pagebar.page', ['<input type="text" class="pgb-itext" size="4" value="'+currpage+'"/>', totalpage]);
			htmlstr += '</span>';
			htmlstr += '<span class="pgb-pbtn pbtn-next'+(currpage*size<total?'':'-disabled')+'"></span>';
			htmlstr += '<span class="pgb-pbtn pbtn-last'+(currpage*size<total?'':'-disabled')+'"></span>';
			htmlstr += '</div>';
			htmlstr += '<div class="pagebar-info-box">'+jcl.message.get('ui.common.pagebar.records', [begin, end, total])+'</div>';
			$this.find('.pagebar').empty().html(htmlstr);
		}
		
		function _rows(page){
			var opts = $grid.opts;
			var $this = $('#' + opts.id);
			var htmlstr = '';
			//循环输出数据行
			var rows = page.list;
			//TODO: 内容要去除特殊字符
			var opts = $grid.opts;
			var rowWidth = _width - _scrollerWidth - _cellBorderWidth;
			
			for(var i = 0; i < rows.length; i++){
				htmlstr += '<div class="row" style="width: '+rowWidth+'px;">';
				htmlstr += '<table width="100%" cellspacing="0" cellpadding="0" border="0">';
				htmlstr += '<tr>';
				if(opts.checkboxEnable){
					htmlstr += '<td><div style="width: '+(_checkboxColumnWidth+_cellBorderWidth)+'px;" class="row-cell"><input type="checkbox" value="'+
					i+'" class="row-cb"/></div></td>';
				}
				for(var j = 0; j < opts.columns.length; j++){
					var column = opts.columns[j];
					var celltext = rows[i][column["dataIndex"]];
					if(celltext == null){
						celltext = '';
					}else if(column['render']){
						celltext = jcl.convert(celltext, column['render']);
					}
					var titletext = (typeof(celltext) == 'string' ? celltext.replace(/<[^>]+>/g, '') : ''+celltext);
					htmlstr += '<td><div title="'+titletext+'" style="width: '+_colws[j]+'px;" class="row-cell">'+celltext+'</div></td>';
				}
				htmlstr += '</tr></table></div>';
			}
			$this.find('.grid-rows').empty().html(htmlstr);
			
		}
		
		//按照给定宽度调整到列
		function _adjustWidth(){
			var opts = $grid.opts;
			
			if(typeof(opts.width) == 'number'){
				_width = opts.width;
			}else{
				_width = $(window).width() - 20;
				_width = _width < opts.minWidth ? opts.minWidth : _width;
			}
			
			var totalWidth =  0;
			var width = _width - _outBorderWidth;
			//减去最后滚动条列宽度
			var columnsWidth = width - _scrollerWidth;
			if(opts.checkboxEnable){
				columnsWidth -= (_checkboxColumnWidth + _cellBorderWidth);
			}
			for(var i = 0; i < opts.columns.length; i++){
				//TODO： 假设每个列都设置了宽度
				
				if(opts.columns[i]["width"]){
					totalWidth += opts.columns[i]["width"];
				}
			}
			//TODO: 假设是缩放
			var actualWidth = 0;
			for(var i = 0; i < opts.columns.length; i++){
				_colws[i] =  Math.round(opts.columns[i]["width"]/totalWidth * columnsWidth);
				actualWidth += _colws[i];
			}
			if(actualWidth < columnsWidth){
				_colws[opts.columns.length - 1] += (columnsWidth - actualWidth);
			}else if(actualWidth > columnsWidth){
				_colws[opts.columns.length - 1] -= (actualWidth - columnsWidth) ;
			}
			
		}
		//判断工具按键区是否需要滚动  2012-05-25
		function _toolbarScroller(){
			var opts = $grid.opts;
			var $this = $('#' + opts.id);
			var $tbBox = $this.find('.box-toolbar-wrap');
			var $tbs = $tbBox.find('.box-toolbar-scroller');
			var $tb = $tbBox.find('.box-toolbar');

			var tbsWidth = $tbs.width();
			var tbBoxWidth = $tbBox.width();
			var tbWidth = $tb.width();
			
			var tbLeft = $tb.offset().left - $tbs.offset().left;
			if(tbWidth > tbBoxWidth){
				tbsWidth = tbBoxWidth - 42 - 4;
				var $sleft = $tbBox.find('.box-toolbar-scroller-left');
				var $sright = $tbBox.find('.box-toolbar-scroller-right');
				$sleft.show();
				$sright.show();
				
				//检查是否要启用左右滚动按键
				if(tbLeft == 0){
					$sleft.addClass('disable');
					$sright.removeClass('disable');
				}else if(tbLeft + tbWidth > tbsWidth){
					$sleft.removeClass('disable');
					$sright.removeClass('disable');
				}else{
					$sleft.removeClass('disable');
					$sright.addClass('disable');
					$tb.css({left: tbsWidth - tbWidth});
				}
				$tbs.width(tbsWidth);
			}else{
				$tbBox.find('.box-toolbar-scroller-left,.box-toolbar-scroller-right').hide();
				$tbs.width(tbBoxWidth - 4);
				$tb.css({left:'0px'});
			}
		}
		
		function _init(){
			var opts = $grid.opts;
			var id = opts.id;
			if(!id){
				id = 'grid_' + new Date().getTime();
				opts.id = id;
			}
			
			_adjustWidth();
			
			var $this = $('#' + opts.id);
			if($this.length == 0){
				$('body').prepend('<div id="'+id+'" class="box" style="width:'+_width+'px;"></div>');
				$this = $('#'+id);
			}else{
				$this.width(_width);
			}
			
	        //计算宽度
			var width = _width - _outBorderWidth; //减去最外侧边框
			//计算高度
			var height = opts.height;
	        
			
			var htmlstr = '';
			
			//标题栏
			htmlstr +='<div class="box-title-wrap-m" style="width: '+(_width)+'px;">';
			htmlstr +='<div class="box-title-wrap-l"><div class="box-title-wrap-r">';
			htmlstr +='<div class="box-title">'+opts.title+'</div>';
			htmlstr +='</div></div></div>';	
	
	
			//快速查询表单
			if(opts.qform){
				htmlstr +='<div class="box-qform-wrap-b" style="width: '+width+'px;'+(opts.qform.display ? '' : ' display:none;')+'">';
				htmlstr +='<div class="box-qform-wrap-t"><div class="box-qform"></div></div></div>';
			}
			
			//工具条
			if(opts.toolbar){
				htmlstr +='<div class="box-toolbar-wrap" style="width: '+width+'px;">';
				htmlstr +='<div class="box-toolbar-scroller-left"></div>';
				htmlstr +='<div class="box-toolbar-scroller">';
				if(opts.toolbar.length > 0){
					htmlstr += '<ul class="box-toolbar">';
					for(var i = 0; i < opts.toolbar.length; i++){
						var item = opts.toolbar[i];
						var cls = 'box-toolbar-item';
						cls += item['disabled']==true ? ' box-toolbar-item-disabled':'';
						cls += (item['toggleQform'] && opts.qform.display) ? ' box-toolbar-item-toggled' : ''; 
						htmlstr += '<li class="'+cls+'" id="'+item['id']+'">';
						htmlstr += (opts.toolbar[i].icon) ? '<span class="box-toolbar-item-icon icon '+opts.toolbar[i].icon+'"></span>' : '';
						htmlstr += '<span class="box-toolbar-item-text">'+opts.toolbar[i].text+'</span></li>';
					}
					htmlstr += '</ul>';
				}
				htmlstr +='</div>';
				htmlstr +='<div class="box-toolbar-scroller-right"></div>';
				htmlstr +='</div>';
			}
			
			
	        //组装表格
			htmlstr +='<div class="box-grid'+((opts.pagebar) ? '' :' box-b-border')+'">';
			
			htmlstr += '<div class="grid" style="width: '+width+'px; height:'+height+'px;">'+
				'<div class="grid-column">'+
				'<table width=100% cellspacing="0" cellpadding="0" border="0">'+
                '   <tr>';
			
			if(opts.checkboxEnable){//选择框列
				htmlstr += '<td><div style="width: '+_checkboxColumnWidth+'px;" class="column-cell"><input type="checkbox" value="0" class="row-cb"/></div></td>';
			}
			for(var i = 0; i < opts.columns.length; i++){
				htmlstr += '<td><div style="width: '+(_colws[i]-_cellBorderWidth)+'px;" class="column-cell">'+opts.columns[i]["name"]+'</div></td>';
			}
			//滚动条列
			htmlstr += '<td><div style="width: '+(_scrollerWidth-_scrollerBorderWidth)+'px;" class="column-cell column-scroller"></div></td>';
			htmlstr += '</tr>';
            htmlstr += '</table></div>';
			
			//TODO: 怎么计算高度？
			
			//组装数据行
            htmlstr += '<div class="grid-rows" style="overflow:auto; height:'+(height-26)+'px;"></div>';
			
			htmlstr += '</div></div>';//end grid
			
			if(opts.pagebar){
				htmlstr += '<div class="box-pagebar"><div class="pagebar" style="width:'+width+'px;"></div></div>';
			}
			
			$this.html(htmlstr);
			
			//绑定部分事件
			//--------------------------------------------------------
			
			//移动快速查询表单
			if(opts.qform){
				$('#'+opts.qform.id).appendTo($this.find('.box-qform'));
			}
			
			//给工具栏绑定事件
			if(opts.toolbar){
				$this.find('.box-toolbar-item').mouseover(function(){
					if($(this).hasClass("box-toolbar-item-disabled") ||
						$(this).hasClass("")) return;
					$(this).addClass('box-toolbar-item-hover');
				}).mouseout(function(){
					$(this).removeClass('box-toolbar-item-hover');
				});
				for(var i = 0; i < opts.toolbar.length; i++){
					var item = opts.toolbar[i];
					if(item.toggleQform){
						$('#'+ item.id).click(function(){
							if($(this).hasClass('box-toolbar-item-toggled')){
								$(this).removeClass('box-toolbar-item-toggled').addClass('box-toolbar-item-hover');
								$this.find('.box-qform-wrap-b').slideUp('fast');
							}else{
								$(this).removeClass('box-toolbar-item-hover').addClass('box-toolbar-item-toggled');
								$this.find('.box-qform-wrap-b').slideDown('fast');
							}
							
						});
					}
				}
				//计算工具栏实际宽度
				var $tbBox = $this.find('.box-toolbar-wrap');
				var $tb = $tbBox.find('.box-toolbar');
				var $tbs = $tbBox.find('.box-toolbar-scroller');
				
				var tbWidth = 0;
				$tb.find('.box-toolbar-item').each(function(){
					tbWidth += $(this).outerWidth();
				});
				$tb.width(tbWidth);
				
				//绑定工具栏的滚动事件
				$tbBox.find('.box-toolbar-scroller-right').mousedown(function(){
					var tbsWidth = $tbs.width();
					var tbWidth = $tb.width();
					var tbLeft = $tb.offset().left - $tbs.offset().left;
					
					if(tbWidth + tbLeft > tbsWidth){
						$tb.clearQueue('fx').animate({
							left: tbsWidth - tbWidth
						}, (tbLeft - tbsWidth + tbWidth) * 300 / 100, $.proxy(function(){
							$(this).addClass('disable').css('background-color', '');
						}, this));
						$tbBox.find('.box-toolbar-scroller-left').removeClass('disable');
					}
				}).mouseup(function(){
					$tb.stop('fx');
				}).mouseover(function(){
					if($(this).hasClass('disable')){
						return;
					}
					$(this).css('background-color', '#FFF');
				}).mouseout(function(){
					$(this).css('background-color', '');
				});
				
				$tbBox.find('.box-toolbar-scroller-left').mousedown(function(){
					var tbLeft = $tb.offset().left - $tbs.offset().left;
					if(tbLeft < 0){
						$tb.clearQueue('fx').animate({
							left:0
						}, (0 - tbLeft) * 300 / 100, $.proxy(function(){
							$(this).addClass('disable').css('background-color', '');
						}, this));
						$tbBox.find('.box-toolbar-scroller-right').removeClass('disable');
					}
				}).mouseup(function(){
					$tb.stop('fx');
				}).mouseover(function(){
					if($(this).hasClass('disable')){
						return;
					}
					$(this).css('background-color', '#FFF');
				}).mouseout(function(){
					$(this).css('background-color', '');
				});
				
			}
			
			//绑定列的选择框点击事件
			$this.find('.grid-column .row-cb').click(function(){
				var cbChecked = $(this).attr('checked');
				if(cbChecked){
					$this.find(".row").addClass('row-bg-selected').find('.row-cb').attr('checked', true);
				}else{
					$this.find(".row").removeClass('row-bg-selected').find('.row-cb').attr('checked', false);
				}
			});
			
			
			if(opts.width == 'auto'){
				//绑定resize事件，调整宽度
				$(window).resize(function(){
					_adjustWidth();
					var width = _width - _outBorderWidth;
					$this.width(_width);
					var rowWidth = width - _scrollerWidth;
					
					$this.find(".box-title-wrap-m").width(_width);
					$this.find(".box-qform-wrap-b").width(width);
					$this.find(".box-toolbar-wrap").width(width);
					$this.find(".grid").width(width);
					$this.find(".column-cell").each(function(index){
						if(opts.checkboxEnable){
							if(index > 0 && index < (_colws.length+1)){
								$(this).width(_colws[index - 1] - _cellBorderWidth);
							}
						}else{
							$(this).width(_colws[index] - _cellBorderWidth);
						}
					});
					$this.find(".row").each(function(){
						$(this).width(rowWidth);
						$(this).find(".row-cell").each(function(index){
							if(opts.checkboxEnable){
								if(index > 0 && index < (_colws.length+1)){
									$(this).width(_colws[index - 1]);
								}
							}else{
								$(this).width(_colws[index]);
							}
						
						});
					});
					$this.find(".pagebar").width(width);
					_toolbarScroller();
				});
			}
			
			_toolbarScroller();
		}
		
		function _bind_page_event(page){
			var opts = $grid.opts;
			var $this = $('#' + opts.id);
			//上色
			$this.find(".row").each(function(index){
				var $row = $(this);
				$row.toggleClass("row-bg-gray", index % 2 == 1);
				$row.mouseover(function(){
					if(!$row.hasClass('row-bg-selected')){
						$row.addClass('row-bg-hover');
					}
				}).mouseout(function(){
					$row.removeClass('row-bg-hover');
				}).click(function(){
					if($row.hasClass('row-bg-selected')){
						$row.removeClass('row-bg-selected').addClass('row-bg-hover');
						if(opts.checkboxEnable)
							$row.find('.row-cb').attr('checked', false);
					}else{
						$row.removeClass('row-bg-hover').addClass('row-bg-selected');
						if(opts.checkboxEnable)
							$row.find('.row-cb').attr('checked', true);
					}
				});
			});
			
			
			
			//绑定翻页事件
			if(opts.pagebar){
				var $pagebar = $this.find('.pagebar');
				$pagebar.find('.pbtn-next').click(function(){
					$grid.goPage(page.index + 1);
				});
				$pagebar.find('.pbtn-prev').click(function(){
					$grid.goPage(page.index - 1);
				});
				$pagebar.find('.pbtn-first').click(function(){
					$grid.goPage(1);
				});
				$pagebar.find('.pbtn-last').click(function(){
					var totalpage = Math.ceil(page.total/page.size);
					totalpage = totalpage == 0 ? 1 : totalpage;
					$grid.goPage(totalpage);
				});
				$pagebar.find('.pgb-itext').keydown(function(e){
					if(e.keyCode == '13'){
						var index = $(this).val();
						if(!/^\d+$/.test(index)){
							index = 1;
						}
						index = index < 1 ? 1 : index;
						index = (index - 1)* page.size + 1 > page.total ? Math.ceil(page.total/page.size) : index;
						if(index == page.index){
							$(this).val(index);
							return;
						}
						$grid.goPage(index);
					}
				});
			}
		
		}
			
		function _rowCallback(){
			var opts = $grid.opts;
			if(opts.rowCallback){
				$('#'+$grid.opts.id).find('.row').each(function(i, row){
					opts.rowCallback(i, row, $grid.page.list[i]);
				});
			}
		}
		
		this.opts = $.extend(_defaults, options);
		
		this.page = {
			total: 0,
			index: 1,
			size: /\d+/.test(jcl.env.profile.pagesize) ?  jcl.env.profile.pagesize : 25,
			list: []
		};
		
		
		
		//设置数据源参数
		this.setDsParams = function(params){
			this.opts.ds.params = params;
		};
		
		//刷新grid
		this.goPage = function(index){
			var opts = this.opts;
			var params = opts.ds.params;
			if(!params){
				params = '';
			}else if('string' != typeof(params)){
				params = $.param(params);
			}
			
			var url = opts.ds.url;
			var page = this.page;
			if(opts.pagebar){
				if(!index)
					index = 1;
				params = ((params && params.length>0) ? params+'&':'') +'pageindex='+index+'&pagesize='+page.size;	
			}
			jcl.postJSON(opts.ds.url, params, function(data){
				if(data.page){
					if(opts.ds.callback){
						opts.ds.callback(data.page.list);
					}
					$grid.page=data.page;
					_rows(data.page);
					_pagebar(data.page);
					_bind_page_event(data.page);
					
					_rowCallback();
				}
			});
		};
		
		//设置page数据
		this.renderPage = function(page){
			$grid.page=page;
			_rows(page);
			_pagebar(page);
			_bind_page_event(page);
			
			_rowCallback();
		};
		
		//得到选中的行
		this.selectedRows = function(){
			//循环行，查看cb是否被选中
			var srows = [];
			$('#'+$grid.opts.id).find('.row').each(function(i, row){
				if($(row).hasClass('row-bg-selected')){
					srows.push($grid.page.list[i]);
				}
			});
			return srows;
		};
		
		_init();
		//$(window).resize();
	};

	//将jcl.ui.Grid包装到jQuery插件，方便调用
	//注意返回不是jQuery对象
	$.fn.grid = function(opts){
		if(opts){
			var id = this.attr('id');
			if(id == '')
				id = 'grid_' + new Date().getTime();
			opts.id = id;
			this.attr('id', id);
			var grid = new jcl.ui.Grid(opts);
			//保存数据
			this.data('grid', grid); 
			return grid;
		}else{
			return this.data('grid');
		}
	};
	
	
	//========= grid end;
	
	
	jcl.ui.Datepicker=function(options){
		
		this.opts = $.extend({
			id: null
		}, options);

		var $dp = this;
		
		this.date = new Date();

		function _goDate(ymd){
			$dp.date = ymd;
			var $this = $('#' + $dp.opts.id);
			var list = [];
			var y = ymd.getFullYear();
			var m = ymd.getMonth();
			var fd = new Date(y, m, 1).getDay();
			if(fd > 0){
				//补前面
				var prevMonth = new Date(y, m, 0);
				var day = prevMonth.getDate();
				var y0 = prevMonth.getFullYear();
				var m0 = prevMonth.getMonth();
				var i = 0;
				for(var i = fd; i >= 0; i--){
					list[i] = _ymdformat(y0, m0+1, day-(fd-i));
				}
			}
			var maxday = _getMaxDay(y, m);
			for(var i = 0; i < maxday; i++){
				list[fd+i] = _ymdformat(y, m+1, i+1);
			}
			var nextMonth = new Date(y, m+1, 1);
			var y1 = nextMonth.getFullYear();
			var m1 = nextMonth.getMonth();
			for(var i = fd + maxday; i < 42; i++){
				list[i] = _ymdformat(y1, m1+1, i-fd-maxday+1);
			}
			$this.find('.calendar-ym').text(y+'-'+(m+1));

			$this.find('.calendar-day')
				.removeClass('calendar-othermon')
				.removeClass('calendar-day-picked')
				.each(function(i, cell){
					if(i < fd){
						$(cell).addClass('calendar-othermon');
					}else if(i >= fd + maxday){
						$(cell).addClass('calendar-othermon');
					}

					if(list[i] == $dp.objDateStr){
						$(cell).addClass('calendar-day-picked');
					}
					$(cell).html(parseInt(list[i].split('-')[2], 10)).attr('t', list[i]);
			});

		}

		function _ymdformat(y, m, d){
			return [y, _doublefill(m), _doublefill(d)].join('-');
		}

		function _ymd(d){
			return _ymdformat(d.getFullYear(), d.getMonth()+1, d.getDate());
		}

		function _doublefill(i){
			var str = i+'';
			return  (str.length < 2) ? '0' + str : str;
		}

		function _getMaxDay(year, month){
			return new Date(year, month+1, 0).getDate();
		}

		function _init(){
			
			var weektitles = jcl.message.get("ui.common.datepicker.weektitles", "Sun,Mon,Tue,Wed,Thu,Fri,Sat").split(",");
			var btn_clear = jcl.message.get("ui.common.datepicker.btn.clear", "Clear");
			var btn_today = jcl.message.get("ui.common.datepicker.btn.today", "Today");
			var btn_sure = jcl.message.get("ui.common.datepicker.btn.sure", "OK");

			var now = new Date();
			var htmlstr = '';
			var id = 'datepicker_'+now.getTime();
			$dp.opts.id = id;

			htmlstr += '<div id="'+id+'" class="calendar">';
			htmlstr += '<div class="calendar-ym-box">';
			htmlstr += '<table cellspacing="0" cellpadding="0">';
			htmlstr += '<tr>';
			htmlstr += '<td><a class="calendar-y-prev" href="#">&lt;&lt;</a></td>';
			htmlstr += '<td><a class="calendar-m-prev" href="#">&lt;</a></td>';
			htmlstr += '<td class="calendar-ym"></td>';
			htmlstr += '<td><a class="calendar-m-next" href="#">&gt;</a></td>';
			htmlstr += '<td><a class="calendar-y-next" href="#">&gt;&gt;</a></td>';
			htmlstr += '</tr></table></div>';
			htmlstr += '<div class="calendar-week-box">';
			htmlstr += '<table class="calendar-week-table" cellspacing="0" cellpadding="0">';
			htmlstr += '<tr class="calendar-week-title">';
			for(var i = 0; i < 7; i++){
				htmlstr += '<td><div class="calendar-week">'+weektitles[i]+'</div></td>';
			}
			htmlstr += '</tr>';
			for(var i = 0; i < 42; i++){
				if(i%7 == 0){
					htmlstr += '<tr>';
				}
				htmlstr += '<td><div class="calendar-day"></div></td>';
				if(i%7 == 6){
					htmlstr += '</tr>';
				}
			}
			htmlstr += '</table></div>';
			htmlstr += '<div class="calendar-btn-box">';
			htmlstr += '<input type="button" class="calendar-btn clear" value="'+btn_clear+'"> ';
			htmlstr += '<input type="button" class="calendar-btn today" value="'+btn_today+'"> ';
			htmlstr += '<input type="button" class="calendar-btn sure" value="'+btn_sure+'">';
			htmlstr += '</div></div>';

			$('body').prepend(htmlstr);
			$('#' + $dp.opts.id).bgiframe();
		}

		function _bind_evnet(){
			var opts = $dp.opts;
			var $this = $('#' + opts.id);

			//翻页 年 月
			$this.find('.calendar-y-prev').click(function(){
				var d = $dp.date;
				_goDate(new Date(d.getFullYear() -1, d.getMonth()));
				return false;
			});
			$this.find('.calendar-y-next').click(function(){
				var d = $dp.date;
				_goDate(new Date(d.getFullYear() +1, d.getMonth()));
				return false;
			
			});
			$this.find('.calendar-m-prev').click(function(){
				var d = $dp.date;
				_goDate(new Date(d.getFullYear(), d.getMonth()-1));
				return false;
			});
			$this.find('.calendar-m-next').click(function(){
				var d = $dp.date;
				_goDate(new Date(d.getFullYear(), d.getMonth()+1));
				return false;
			});

			//移动光标选择 //选中
			$this.find('.calendar-day').mouseover(function(){
				$(this).addClass('calendar-day-hover');
			}).mouseout(function(){
				$(this).removeClass('calendar-day-hover');
			}).click(function(){
				_setInputDate($(this).attr('t'));
				$this.hide();
			});
			
			//按键
			$this.find('.calendar-btn').click(function(){
				var $btn = $(this);
				if($btn.hasClass('clear')){
					_setInputDate('');
				}else if($btn.hasClass('today')){
					_setInputDate(_ymd(new Date()));
				}
				$this.hide();
			});


			//在其他区域点击取消
			$(document).bind('click.datepicker', function(event){
				if($this.css('display') == 'none')return true;
				if($dp.obj == event.target) return true;
				var $target = $(event.target);
				if($target.hasClass('calendar') 
					|| $target.parents('.calendar').length > 0 ){
					return true;
				}
				$this.hide();
			});

		}
		function _setInputDate(ymd){
			$($dp.obj).val(ymd);
			$dp.objDateStr = ymd;
		}
		function _getInputDate(){
			var v = $($dp.obj).val();
			if(v && /\d{4}-\d{1,2}-\d{1,2}/.test(v)){
				var temp = v.split('-');
				var d = new Date(parseInt(temp[0], 10), parseInt(temp[1], 10)-1, parseInt(temp[2], 10));
				$dp.objDateStr = _ymd(d);
				return d;
			}
			$dp.objDateStr = '';
			return new Date();
		}
		function _bindInput(id){
			//绑定输入框
			if(typeof(id) == 'string'){
				$dp.obj = $('#'+id).get(0);
			}else{
				$dp.obj = id;
			}
		}

		function _hideSome(){
			var ele=document.getElementsByTagName("select");
			if(ele!=null){
				for(var i=0;i<ele.length;i++){
					if(ele[i].style.display!="none" 
						&& ele[i].style.visibility!='hidden' 
							&& ele[i].getAttribute("calendar")!="0"){
						ele[i].style.visibility='hidden';
					}
				}
			}	
		}
		function _showSome(){
			var ele=document.getElementsByTagName("select");
			for(var i=0;i<ele.length;i++){
					ele[i].style.visibility='visible';
			};
		}

		this.obj = null;//dom node
		this.objDateStr = null;
		this.picker=function(id){
			_bindInput(id);
			var $obj = $($dp.obj);
			var $this = $('#' + $dp.opts.id);
			var offset = $obj.offset();
			var left = offset.left;
			var top = offset.top + $obj.outerHeight();
			$this.css({left: left+'px', top: top+'px' });
			//取当前的年月日
			var ymd = _getInputDate();
			_goDate(ymd);
			$this.show();
		};

		_init();
		_bind_evnet();
	};

	jcl.datepicker = function(id){
		if(!jcl.datepicker.prototype.dp){
			jcl.datepicker.prototype.dp = new jcl.ui.Datepicker();
		}
		jcl.datepicker.prototype.dp.picker(id);
	};
	
	
	jcl.cookie = {
		set: function(name, value, expires, path, domain, secure) {
		    var expireDate = new Date();
		    var EXPIR_MONTH = 30*24*3600*1000;
		    var _domain = document.domain;
		    if(_domain.indexOf('.')!=-1){
		    	var temp = _domain.split(".");
		        if(temp.length >1){
		            _domain = temp[temp.length-2]+"."+temp[temp.length-1];
		        }
		    }
		    if(expires) expireDate.setTime(expireDate.getTime() + expires * 1000);
		    document.cookie= name + "=" + 
		    (value != undefined && value !=null ? escape(value):"") +
		    (expires ? "; expires=" + expireDate.toGMTString():"") +
		    (path? "; path=" + path : "; path=/") + 
		    (domain ? "; domain=" + domain : "") +
		    (secure ? "; secure" : "");
		},
		get: function(name) {
		  var dc = "; "+document.cookie;
		  var prefix = "; "+name+"=";
		  var pos = dc.indexOf(prefix);
		  if(pos != -1){
			  var end = dc.indexOf(';', pos+1);
			  var value = dc.substring(pos+prefix.length, end>0?end:dc.length);
			  return unescape(value);
		  }
		  return null;
		},
		del: function(name, path, domain) {
			this.set(name, null, -1000, path, domain);
		}
	};
	
	jcl.form={
		set:function(form, values, options){//options{key: {name, render}}
			var fobj = (typeof(form) == 'string' ? $('#'+form) : $(form));
			var opts = options || {};
			for(var i in values){
				var name = i;
				var value = values[i];

				if(opts[i]){
					if(opts[i]['name']){
						name = opts[i]['name'];
					}
					if(opts[i]['render']){
						value = jcl.convert(value, opts[i]['render']);
					}
				}
				fobj.find('[name='+name+']').each(function(){
					if(/select|input|textarea/i.test(this.nodeName)){
						if(/radio|checkbox/i.test(this.type)){
							this.checked = (this.value == value);
						}else{
							$(this).val(value);
						}
					}else if(/td|div|span|li|p/i.test(this.nodeName)){
						$(this).text(value);
					}
				});
			}
		},
		clear:function(form, names){
			var fobj = (typeof(form) == 'string' ? $('#'+form) : $(form));
			var elements;

			if(names){
			
				elements = fobj.find('[name]').filter(function(){
					if($.inArray(this.name, names) < 0)
						return false;
					else{
						if(/input|select|textarea/i.test(this.nodeName)){
							return true;
						}
						if(/td|div|span|li|p/i.test(this.nodeName)){
							$(this).text('');
						}
						return false;
					}
				});

			}else{
				elements = fobj.find('input, select, textarea');
			}
			elements.each(function(){
				if(/select/i.test(this.nodeName)){
					if(this.options.length > 0){
						this.selectedIndex = 0;
					}
				}else if(/radio|checkbox/i.test(this.type)){
					if(this.name){
						if(0 == fobj.find('[name='+this.name+']').index(this)){
							this.checked = true;
						}else{
							this.checked = false;
						}
					}
				}else if(/text|password|file|hidden/i.test(this.type)){
					$(this).val('');
				}
			});
		}
	};
	
	
})(jQuery);