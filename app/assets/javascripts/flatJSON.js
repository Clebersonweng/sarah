 /**
 * flatJSON.js
 * @version: v1.1.0
 * @author: Dennis Hernández
 * @webSite: http://djhvscf.github.io/Blog
 *
 * Created by Dennis Hernández on 03/Oct/2014.
 *
 * Copyright (c) 2014 Dennis Hernández http://djhvscf.github.io/Blog
 *
 * The MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
 

;(function ($) {
    'use strict'
    $.flatJSON = function (options) {
		
		var defaults = {
			url: '',
			data: {},
			flat: false,
			unFlat: false, 
			success: function(obj) { console.log(obj.data); console.log(sd.flatHelper(obj.data)) },
			method: 'GET',
			dataType: 'JSONP',
			crossDomain: true
		}, options = $.extend(defaults, options);
		
		var sd = {
			flat: function(data) {
				var result = {};
				function recurse (cur, prop) {
					if (Object(cur) !== cur) {
						result[prop] = cur;
					} else if (Array.isArray(cur)) {
						for(var i = 0, l = cur.length; i < l; i++) {
							recurse(cur[i], prop ? prop+"."+i : ""+i);
							if (l == 0) {
								result[prop] = [];
							}
						}
					} else {
						var isEmpty = true;
						for (var p in cur) {
							isEmpty = false;
							recurse(cur[p], prop ? prop+"."+p : p);
						}
						if (isEmpty) {
							result[prop] = {};
						}
					}
				}
				recurse(data, "");
				return result;
			},

			unflat: function(data) {
				"use strict";
				if (Object(data) !== data || Array.isArray(data)) {
					return data;
				}
				var result = {}, cur, prop, idx, last, temp;
				for(var p in data) {
					cur = result, prop = "", last = 0;
					do {
						idx = p.indexOf(".", last);
						temp = p.substring(last, idx !== -1 ? idx : undefined);
						cur = cur[prop] || (cur[prop] = (!isNaN(parseInt(temp)) ? [] : {}));
						prop = temp;
						last = idx + 1;
					} while(idx >= 0);
					cur[prop] = data[p];
				}
				return result[""];
			},
			
			flatHelper: function (data) {
				var flatArray = [];
				$.each(data, function(i, element) {
					flatArray.push(sd.flat(element));
				});
				return flatArray;
			}
		};
		
		var init = function () {
			var array = [];
			if(options.url !== '') {
				$.ajax({
					url: options.url,
					crossDomain: options.crossDomain,
					dataType: options.dataType,
					type: options.method,
					success: options.success,
				});
				
			} else if (options.data !== {}) {
				if(options.flat) {
					array = sd.flatHelper(options.data);
				} else if(options.unFlat) {
					//return sd.unflat(options.data);
				}
			}
			
			return array;
		};
		
		return init();
    };
})(jQuery);