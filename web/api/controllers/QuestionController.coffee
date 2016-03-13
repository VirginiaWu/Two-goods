module.exports =
  getCommonQuestion: (req, res) ->
    res.view 'questions/common-question'


  getForgetPassword: (req, res) ->
    res.view 'questions/forget-password'