<head>
<meta name='layout' content='main' />
<title>Login</title>
<style type='text/css' media='screen'>
#login {
  margin: 15px 0px;
  padding: 0px;
  text-align: center;
}

#login .inner {
  width: 500px;
  margin: 0px auto;
  text-align: left;
  padding: 10px;
  border-top: 1px dashed #499ede;
  border-bottom: 1px dashed #499ede;
  background-color: #EEF;
}

#login .inner .fheader {
  padding: 4px;
  margin: 3px 0px 3px 0;
  color: #2e3741;
  font-size: 14px;
  font-weight: bold;
}

#login .inner .cssform p {
  clear: left;
  margin: 0;
  padding: 5px 0 8px 0;
  padding-left: 105px;
  border-top: 1px dashed gray;
  margin-bottom: 10px;
  height: 1%;
}

</style>
</head>

<body>
  <div id='login'>
    <div class="inner">
      <g:if test='${flash.message}'>
        <div class='alert alert-error'>${flash.message}</div>
      </g:if>
      <div class='fheader'>
        ${message(code: 'login-form.input.mesage')}
      </div>
      <form action='${postUrl}' method='POST' id='loginForm' class="form-horizontal" autocomplete='off'>
        <div class="control-group">
          <label class="control-label" for='username'>
            ${message(code: 'login-form.login.label')}
          </label>
          <div class="controls">
            <input type='text' name='j_username' id='username' />
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for='password'>${message(code: 'login-form.password.label')}</label>
          <div class="controls">
            <input type='password' name='j_password' id='password'/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for='remember_me'>${message(code: 'login-form.remember-me.label')}</label>
          <div class="controls">
            <input type='checkbox'
              name='${rememberMeParameter}' id='remember_me'
              <g:if test='${hasCookie}'>checked='checked'</g:if>
            />
          </div>
        </div>
        <div class="control-group">
          <div class="controls">
            <input class="btn btn-primary" type="submit" value="${message(code: 'login-form.enter.label')}" />
          </div>
        </div>
      </form>
    </div>
  </div>
  <script type='text/javascript'>
    <!--
      (function() {
        document.forms['loginForm'].elements['j_username'].focus();
      })();
    // -->
    </script>
</body>
