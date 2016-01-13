es_client = (require '../../es_client').es_client


putNewTemplate = (tempName, tempContent) ->
  es_client.indices.deleteTemplate
    name: tempName
  .finally ->
    es_client.indices.putTemplate
      name: tempName
      body: tempContent

module.exports =
  putNewTemplate: putNewTemplate
