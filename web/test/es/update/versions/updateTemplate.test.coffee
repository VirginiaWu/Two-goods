expect = (require 'chai').expect

es_client = (require '../../../../../web/es/es_client').es_client
updateTemplate = require '../../../../es/update/versions/updateTemplate'

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

describe 'putNewTemplate', ->
  putNewTemplate = updateTemplate.putNewTemplate
  it 'put new template successfully', ->
    putNewTemplate('test_template_admins', test_template_admins)
    .then () ->
      es_client.indices.getTemplate
        name: "test_template_admins"
    .then (temp) ->
      expect(temp.test_template_admins.mappings).to.deep.equal(test_template_admins.mappings) 
