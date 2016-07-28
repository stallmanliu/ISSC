# Controller class handling all os_tpl-related requests.
# Implements listing and triggering actions on mixin-tagged instances.
class OsTplController < ApplicationController
  # GET /mixin/os_tpl/:term*/
  def index
    # TODO: work with :term*
    mixins = Occi::Core::Mixins.new << Occi::Infrastructure::OsTpl.mixin

    if INDEX_LINK_FORMATS.include?(request.format)
      @computes = backend_instance.compute_list_ids(mixins)
      @computes.map! { |c| "#{server_url}/compute/#{c}" }
      options = { flag: :links_only }
    else
      @computes = Occi::Collection.new
      @computes.resources = backend_instance.compute_list(mixins)
      update_mixins_in_coll(@computes)
      options = {}
    end

    respond_with(@computes, options)
  end

  # POST /mixin/os_tpl/:term*/?action=:action
  def trigger
    # TODO: impl

   
    #puts "daniel-log"
    t = Time.now
    File.open("/opt/rOCCI-server/daniel.log", "a+") { |f| f.puts t.strftime("%H:%M:%S:%L") + " [daniel] OsTplController.trigger(): enter, params:" + params.inspect }
 
    puts "daniel: enter trigger, going to request_occi_collection()"
    ai = request_occi_collection(Occi::Core::ActionInstance).action

    #t = Time.now
    #File.open("/opt/rOCCI-server/daniel.log", "a+") { |f| f.puts t.strftime("%H:%M:%S:%L") + " [daniel] OsTplController.trigger(): enter, params:" + params.inspect + ", ai:" + ai.inspect }
    #puts "daniel: go to check_ai!(), ai:" + ai.inspect
 
    check_ai!(ai, request.query_string)

    if params[:id]
      File.open("/opt/rOCCI-server/daniel.log", "a+") { |f| f.puts t.strftime("%H:%M:%S:%L") + "[daniel]: go to exe backend_instance.os_tpl_trigger_action, params:" + params.inspect + ", ai:" + ai.inspect }
      result = backend_instance.os_tpl_trigger_action(params[:id], ai)
    else
      File.open("/opt/rOCCI-server/daniel.log", "a+") { |f| f.puts t.strftime("%H:%M:%S:%L") + "[daniel]: go to exe backend_instance.os_tpl_trigger_action, ai:" + ai.inspect }
      result = backend_instance.os_tpl_trigger_action_on_all(ai)
    end

    File.open("/opt/rOCCI-server/daniel.log", "a+") { |f| f.puts t.strftime("%H:%M:%S:%L") + "[daniel]: after exed backend_instance.os_tpl_trigger_action, result:" + result.inspect }
    if result
      respond_with(Occi::Collection.new)
    else
      respond_with(Occi::Collection.new, status: 304)
    end
    
    #collection = Occi::Collection.new
    #respond_with(collection, status: 501)
  end
end
