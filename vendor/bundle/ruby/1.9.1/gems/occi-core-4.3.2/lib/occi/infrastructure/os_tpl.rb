module Occi
  module Infrastructure   
    class OsTpl < Occi::Core::Mixin
      
      #mattr_accessor :attributes, :mixin
      
      clone = Occi::Core::Action.new scheme='http://schemas.ogf.org/occi/infrastructure/os_tpl/action#',
                                     term='clone',
                                     title='clone os_tpl'
                                  
      self.actions = Occi::Core::Actions.new << clone
      
      self.attributes = Occi::Core::Attributes.new(Occi::Core::Mixin.attributes)
      
      self.mixin = Occi::Core::Mixin.new scheme='http://schemas.ogf.org/occi/infrastructure#',
                                         term='os_tpl',
                                         title='operating system template',
                                         attributes=Occi::Core::Attributes.new(self.attributes),
                                         dependencies=Occi::Core::Dependencies.new,
                                         actions=Occi::Core::Actions.new,
                                         location='/mixin/os_tpl/',
                                         applies=Occi::Core::Kinds.new << Occi::Infrastructure::Compute.kind
                                         
      self.kind = Occi::Core::Kind.new scheme='http://schemas.ogf.org/occi/infrastructure#',
                                         term='os_tpl',
                                         title = 'operating system template',
                                         attributes = Occi::Core::Attributes.new(self.attributes),
                                         parent=Occi::Core::Mixin.kind,
                                         actions = Occi::Core::Actions.new(self.actions),
                                         location = '/mixin/os_tpl/'
                                       
    end
  end
end
