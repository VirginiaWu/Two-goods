module.exports =
  getLogin: (req, res) ->
    res.view 'account/login'

  getRegister: (req, res) ->
    res.view 'account/register'



