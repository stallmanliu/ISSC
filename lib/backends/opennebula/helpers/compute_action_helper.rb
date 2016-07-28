module Backends
  module Opennebula
    module Helpers
      module ComputeActionHelper
        def trigger_action_start(compute_id, attributes = ::Occi::Core::Attributes.new)
          backend_object = trigger_action_prolog(compute_id)
          trigger_action_state_check(backend_object, 'http://schemas.ogf.org/occi/infrastructure/compute/action#start')

          rc = backend_object.resume
          check_retval(rc, Backends::Errors::ResourceActionError)

          true
        end

        def trigger_action_restart(compute_id, attributes = ::Occi::Core::Attributes.new)
          backend_object = trigger_action_prolog(compute_id)
          trigger_action_state_check(backend_object, 'http://schemas.ogf.org/occi/infrastructure/compute/action#restart')

          case backend_object.state_str
          when 'ACTIVE'
            if backend_object.lcm_state_str == 'RUNNING'
              rc = backend_object.reboot(true)
            else
              fail ::Backends::Errors::ResourceActionError,
                 "Given action is not allowed in this state! [#{backend_object.lcm_state_str.inspect}]"
            end
          when 'FAILED'
            rc = backend_object.delete(true) # recreate = true
          else
            fail ::Backends::Errors::ResourceActionError,
                 "Given action is not allowed in this state! [#{backend_object.state_str.inspect}]"
          end
          check_retval(rc, Backends::Errors::ResourceActionError)

          true
        end

        def trigger_action_stop(compute_id, attributes = ::Occi::Core::Attributes.new)
          backend_object = trigger_action_prolog(compute_id)
          trigger_action_state_check(backend_object, 'http://schemas.ogf.org/occi/infrastructure/compute/action#stop')

          rc = backend_object.poweroff(true)
          check_retval(rc, Backends::Errors::ResourceActionError)

          true
        end

        def trigger_action_suspend(compute_id, attributes = ::Occi::Core::Attributes.new)
          backend_object = trigger_action_prolog(compute_id)
          trigger_action_state_check(backend_object, 'http://schemas.ogf.org/occi/infrastructure/compute/action#suspend')

          rc = backend_object.suspend
          check_retval(rc, Backends::Errors::ResourceActionError)

          true
        end

        def trigger_action_prolog(compute_id)
          virtual_machine = ::OpenNebula::VirtualMachine.new(::OpenNebula::VirtualMachine.build_xml(compute_id), @client)
          rc = virtual_machine.info
          check_retval(rc, Backends::Errors::ResourceRetrievalError)

          virtual_machine
        end

        def trigger_action_state_check(backend_object, action_type_identifier)
          result = parse_state(backend_object)

          unless result.actions.include? action_type_identifier
            fail ::Backends::Errors::ResourceStateError,
                 "Given action is not allowed in state #{result.state.inspect}!"
          end

          true
        end
      end
    end
  end
end
