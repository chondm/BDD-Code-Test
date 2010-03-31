Factory.define :feature do |f|
  f.title 'Some terse yet descriptive text of what is desired'
end

Factory.define :scenario do |f|
  f.title 'Another determinable business situation' 
  f.given_block 'Given another precondition'
  f.when_block 'When some action by the actor'
  f.then_block 'Then some testable outcome is achieved yet again'

end

