// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var Body = document.getElementById('body');
if(Body){
	Body.style.maxWidth = window.screen.width + "px";


	// Show aside text
	function asideShow(){
		var Span = document.getElementsByClassName('aside-span');
		var Nav = document.getElementsByClassName('aside-item');
		var Aside = document.getElementById('aside-nav');
		var NavBar = document.getElementsByClassName('wrapper');
		var Content = document.getElementsByClassName('container');
		for (let i = 0; i < Nav.length; i++){
			Span[i].style.display = "unset";
			Nav[i].style.width = "150px";
			Aside.style.width = "160px";
		}
		var wid = window.innerWidth;
		switch(true){
			case (wid >= 1200):
				NavBar[0].style.paddingLeft = "160px";
				Content[0].style.paddingLeft = "160px";
				break;
			case (wid >= 768):
				NavBar[0].style.paddingLeft = "160px";
				Content[0].style.paddingLeft = "160px";
				break;
			default:
				NavBar[0].style.paddingLeft = "60px";
				Content[0].style.paddingLeft = "60px";
				break;
		}

	}
	//Hidde aside text
	function asideHide(){
		var Span = document.getElementsByClassName('aside-span');
		var Nav = document.getElementsByClassName('aside-item');
		var Aside = document.getElementById('aside-nav');
		var NavBar = document.getElementsByClassName('wrapper');
		var Content = document.getElementsByClassName('container');
		for (let i = 0; i < Nav.length; i++){
			Span[i].style.display = "none";
			Nav[i].style.width = "47.5px";
			Aside.style.width = "60px";
		}
		var wid = window.innerWidth;
		switch(true){
			case (wid >= 1200):
				NavBar[0].style.paddingLeft = "60px";
				Content[0].style.paddingLeft = "60px";
				break;
			case (wid >= 768):
				NavBar[0].style.paddingLeft = "60px";
				Content[0].style.paddingLeft = "60px";
				break;
			default:
				NavBar[0].style.paddingLeft = "60px";
				Content[0].style.paddingLeft = "60px";
				break;
		}
	}

	document.getElementById("aside-nav").addEventListener("mouseover", function(){asideShow()});
	document.getElementById("aside-nav").addEventListener("mouseout", function(){asideHide()});

	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};

	(function(global) {
		var Months = [
			'January',
			'February',
			'March',
			'April',
			'May',
			'June',
			'July',
			'August',
			'September',
			'October',
			'November',
			'December'
		];

		var COLORS = [
			'#4dc9f6',
			'#f67019',
			'#f53794',
			'#537bc4',
			'#acc236',
			'#166a8f',
			'#00a950',
			'#58595b',
			'#8549ba'
		];

		var Samples = global.Samples || (global.Samples = {});
		var Color = global.Color;

		Samples.utils = {
			// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/
			srand: function(seed) {
				this._seed = seed;
			},

			rand: function(min, max) {
				var seed = this._seed;
				min = min === undefined ? 0 : min;
				max = max === undefined ? 1 : max;
				this._seed = (seed * 9301 + 49297) % 233280;
				return min + (this._seed / 233280) * (max - min);
			},

			numbers: function(config) {
				var cfg = config || {};
				var min = cfg.min || 0;
				var max = cfg.max || 1;
				var from = cfg.from || [];
				var count = cfg.count || 8;
				var decimals = cfg.decimals || 8;
				var continuity = cfg.continuity || 1;
				var dfactor = Math.pow(10, decimals) || 0;
				var data = [];
				var i, value;

				for (i = 0; i < count; ++i) {
					value = (from[i] || 0) + this.rand(min, max);
					if (this.rand() <= continuity) {
						data.push(Math.round(dfactor * value) / dfactor);
					} else {
						data.push(null);
					}
				}

				return data;
			},

			labels: function(config) {
				var cfg = config || {};
				var min = cfg.min || 0;
				var max = cfg.max || 100;
				var count = cfg.count || 8;
				var step = (max - min) / count;
				var decimals = cfg.decimals || 8;
				var dfactor = Math.pow(10, decimals) || 0;
				var prefix = cfg.prefix || '';
				var values = [];
				var i;

				for (i = min; i < max; i += step) {
					values.push(prefix + Math.round(dfactor * i) / dfactor);
				}

				return values;
			},

			months: function(config) {
				var cfg = config || {};
				var count = cfg.count || 12;
				var section = cfg.section;
				var values = [];
				var i, value;

				for (i = 0; i < count; ++i) {
					value = Months[Math.ceil(i) % 12];
					values.push(value.substring(0, section));
				}

				return values;
			},

			color: function(index) {
				return COLORS[index % COLORS.length];
			},

			transparentize: function(color, opacity) {
				var alpha = opacity === undefined ? 0.5 : 1 - opacity;
				return Color(color).alpha(alpha).rgbString();
			}
		};

		// DEPRECATED
		window.randomScalingFactor = function() {
			return Math.round(Samples.utils.rand(-100, 100));
		};

		// INITIALIZATION

		Samples.utils.srand(Date.now());

		// Google Analytics
		/* eslint-disable */
		if (document.location.hostname.match(/^(www\.)?chartjs\.org$/)) {
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			ga('create', 'UA-28909194-3', 'auto');
			ga('send', 'pageview');
		}
		/* eslint-enable */

	}(this));

	var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	var YEARS = ['2012', '2013', '2014', '2015','2016', '2017', '2018', '2019']

	function mainChart() {
		var configMain = {
			type: 'line',
			data: {
				labels: ['2016', '2017', '2018', '2019'],
				datasets: [{
					label: '1º Periodo',
					fill: false,
					backgroundColor: 'rgba(54, 162, 235, 1)',
					borderColor:  'rgba(54, 162, 235, 1)',
					data: [
						87,
						64,
						73,
						12
					],
				}, {
					label: '2º Periodo',
					fill: false,
					backgroundColor: 'rgba(255, 99, 132, 1)',
					borderColor: 'rgba(255, 99, 132, 1)',
					data: [
						78,
						28,
						54,
						0
					],
				}, {
					label: '3º Periodo',
					fill: false,
					backgroundColor: '#00d377',
					borderColor: '#00d377',
					data: [
						0,
						94,
						21,
						98
					],
				}]
			},
			options: {
				legend: {
					display: false,
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: false,
							labelString: 'Year'
						}
					}],
					yAxes: [{
						display: false,
						scaleLabel: {
							display: false,
							labelString: 'Average'
						}
					}]
				},
				responsive: true
			}
		};
		
		//Creating MainChart
		var chart = document.getElementById('mainChart').getContext('2d');
		window.myLine = new Chart(chart, configMain);
	}

	function studentChart(){
		var configStudent = {
			type: 'radar',
			data: {
				labels: ['APS', 'POO', 'ISD', 'CAL', 'BDI', 'EDI'],
				datasets: [{
					label: 'Luciano Lima',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					borderWidth: 2,
					pointBackgroundColor: window.chartColors.blue,
					pointBorderColor: window.chartColors.blue,
					pointRadius: 2,
					pointHoverRadius: 4,
					data: [
						89,
						28,
						54,
						32,
						85,
						45
					],
				}]
			},
			options: {
				legend: {
					display: false,
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				responsive: true
			}
		};
			
		//Creating StudentChart
		var chart = document.getElementById('studentChart').getContext('2d');
		window.myLine = new Chart(chart, configStudent);
	}

	/*
	function teacherChart(){
		var configTeacher = {
			type: 'line',
			data: {
				labels: ['2016', '2017', '2018', '2019'],
				datasets: [{
					label: 'Fabianna',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						87,
						64,
						73,
						12,
						23,
						99,
						45
					],
					fill: false,
				}, {
					label: 'Rovilson',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						103,
						28,
						54,
						32,
						35,
						45,
						29
					],
				}]
			},
			options: {
				responsive: true,
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				gridLines: {
					display: false
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: false,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{
						display: false,
						scaleLabel: {
							display: true,
							labelString: 'Average'
						}
					}]
				}
			}
		};
		
		//Creating teacherChart
		var chart = document.getElementById('teacherChart').getContext('2d');
		window.myLine = new Chart(chart, configTeacher);
	}
	function subjectChart(){
		var configSubject = {
			type: 'line',
			data: {
				labels: ['2016', '2017', '2018', '2019'],
				datasets: [{
					label: '1º Periodo',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						87,
						64,
						73,
						12,
						23,
						99,
						45
					],
					fill: false,
				}, {
					label: '3º Periodo',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						103,
						28,
						54,
						32,
						35,
						45,
						29
					],
				}]
			},
			options: {
				responsive: true,
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				gridLines: {
					display: false
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: false,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{
						display: false,
						scaleLabel: {
							display: true,
							labelString: 'Average'
						}
					}]
				}
			}
		};
		
		//Creating SubjectChart
		var chart = document.getElementById('subejctChart').getContext('2d');
		window.myLine = new Chart(chart, configSubject);
	}
	subjectChart();
	*/

	/*document.getElementById('randomizeData').addEventListener('click', function() {
		config.data.datasets.forEach(function(dataset) {
			dataset.data = dataset.data.map(function() {
				return randomScalingFactor();
			});

		});

		window.myLine.update();
	});

	var colorNames = Object.keys(window.chartColors);
	document.getElementById('addDataset').addEventListener('click', function() {
		var colorName = colorNames[config.data.datasets.length % colorNames.length];
		var newColor = window.chartColors[colorName];
		var newDataset = {
			label: 'Dataset ' + config.data.datasets.length,
			backgroundColor: newColor,
			borderColor: newColor,
			data: [],
			fill: false
		};

		for (var index = 0; index < config.data.labels.length; ++index) {
			newDataset.data.push(randomScalingFactor());
		}

		config.data.datasets.push(newDataset);
		window.myLine.update();
	});

	document.getElementById('addData').addEventListener('click', function() {
		if (config.data.datasets.length > 0) {
			var month = MONTHS[config.data.labels.length % MONTHS.length];
			config.data.labels.push(month);

			config.data.datasets.forEach(function(dataset) {
				dataset.data.push(randomScalingFactor());
			});

			window.myLine.update();
		}
	});

	document.getElementById('removeDataset').addEventListener('click', function() {
		config.data.datasets.splice(0, 1);
		window.myLine.update();
	});

	document.getElementById('removeData').addEventListener('click', function() {
		config.data.labels.splice(-1, 1); // remove the label first

		config.data.datasets.forEach(function(dataset) {
			dataset.data.pop();
		});

		window.myLine.update();
	});*/

	var alt = document.getElementsByClassName("alternative")
	var altRadio

	alt.forEach(function(a){
		a.children.forEach(function(c){
			if(c.tagName == "input"){
				altRadio = c;
			}
		});
		a.addEventListener("click", function(){
			altRadio.checked = true
		});
	});
	for(a in alt){
		for(c in a.children){
			if(c.tagName == "input"){
				altRadio = c;
			}
		}
		
	}

}
