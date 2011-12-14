{StitchCompiler} = require '../src/compilers'


describe 'package initializing', ->
  it 'should create a valid stitch package', ->
    options =
      rootPath: 'test/fixtures/base'
      dependencies: [
        'console-helper.js',
        'jquery-1.7.js',
        'underscore-1.1.7.js',
        'backbone-0.5.3.js'
      ]

    compiler = new StitchCompiler options

    package = compiler.package()
    expect(package.paths).toEqual ['test/fixtures/base/app']
    expect(package.dependencies[0]).toEqual(
      'test/fixtures/base/vendor/scripts/console-helper.js'
    )