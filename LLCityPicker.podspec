Pod::Spec.new do |spec|
	spec.name		= 'LLCityPicker'
	spec.version		= '0.0.1'
	spec.license		= 'MIT'p
	spec.homepage		= 'https://github.com/Kito0615/LLCityPicker/'
	spec.authors		= {'Anar.L' => 'anar0615@sina.com'}
	spec.summary 		= 'Easy way to create city picker or district selector.'
	spec.source 		= { :git => 'https://github.com/Kito0615/LLCityPicker.git', :tag => 'v 0.0.1' }
	spec.source_files 	= 'CityPicker/CityPicker/*.{h,m}'
	spec.resources 		= 'CityPicker/CityPicker/*.png'
	spec.framework		= 'UIKit'
	spec.platform 		= 'ios'

	spec.requires_arc 	= true
end
