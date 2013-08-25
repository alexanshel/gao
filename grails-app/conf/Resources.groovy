modules = {
  'gao' {
      resource(
        id:          'gao',
        url:         [dir: 'js', file: 'main.js'],
        attrs:       [media:'screen, projection'],
        disposition: 'head'
      )
   }
}