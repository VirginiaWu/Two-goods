module.exports =
  getCommonQuestion: (req, res) ->
    res.view 'question/common-question'


  getForgetPassword: (req, res) ->
    res.view 'question/forget-password'