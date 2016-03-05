expect = (require 'chai').expect

es_client = (require '../../../../../web/es/es_client').es_client
Update = require '../../../../es/update/versions/Update'

test_template_admins =
  template: 'test_admins*' 
  mappings:
    users:
      properties:
        name:
          type: 'string'
          index: 'not_analyzed'
        phone:
          type: 'string'
          index: 'not_analyzed'
        email:
          type: 'string'
          index: 'not_analyzed'

describe.only 'Class Template', ->
  UpdateSingleton = Update.getSingleton() 
  describe '@getSingleton', ->
    it 'only instantiate once', ->
      expect(UpdateSingleton.instanceCount).to.equal(1)
      UpdateSecondInstance = Update.getSingleton() 
      expect(UpdateSecondInstance.instanceCount).to.equal(1)

  describe '@putNewTemplate', ->
    putNewTemplate = UpdateSingleton.putNewTemplate
    it 'put new template successfully', ->
      putNewTemplate('test_template_admins', test_template_admins)
      .then () ->
        es_client.indices.getTemplate
          name: "test_template_admins"
      .then (temp) ->
        expect(temp.test_template_admins.mappings).to.deep.equal(test_template_admins.mappings) 

  describe '@putMapping', ->
    putMapping = UpdateSingleton.putMapping
    it 'defined', ->
      expect(putMapping).to.not.be.undefined

  describe '@execCommand', ->
    execCommand = UpdateSingleton.execCommand
    it 'exec "ls"', ->
      execCommand('ls')
      .then (result) ->
        expect(result).to.be.true
