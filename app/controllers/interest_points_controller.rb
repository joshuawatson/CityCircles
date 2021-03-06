class InterestPointsController < ApplicationController
  
  uses_tiny_mce
  
  def index
    @pois = InterestPoint.find( :all, :conditions => [ "map_id = ?", params[ :map_id ] ], :include => :map_layer )
    
    respond_to do | format |
      format.json { render :json => @pois.to_json( :include => :map_layer ) }
    end
    
  end
  
  def show
    @poi = InterestPoint.find( params[ :id ] )
    @default_map = @poi.map
    
    @news = Post.find( :all, :conditions => [ 'post_type_id = ? and interest_point_id = ? and ( posts.created_at >= ? and posts.created_at <= ? ) and is_draft = ?', 1, @poi.id, 14.days.ago, 14.days.from_now, false ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => "posts.sticky desc, posts.created_at desc", :limit => 8 )
    @events = Post.find( :all, :conditions => [ 'post_type_id = ? and interest_point_id = ? and ( posts.created_at >= ? and posts.created_at <= ? ) and is_draft = ?', 2, @poi.id, 14.days.ago, 14.days.from_now, false ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => "posts.sticky desc, posts.created_at desc", :limit => 8 )
    @networks = Post.find( :all, :conditions => [ 'post_type_id = ? and interest_point_id = ? and ( posts.created_at >= ? and posts.created_at <= ? ) and is_draft = ?', 3, @poi.id, 14.days.ago, 14.days.from_now, false ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => "posts.sticky desc, posts.created_at desc", :limit => 8 )
    @stuffs = Post.find( :all, :conditions => [ 'post_type_id = ? and interest_point_id = ? and ( posts.created_at >= ? and posts.created_at <= ? ) and is_draft = ?', 5, @poi.id, 14.days.ago, 14.days.from_now, false ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => "posts.sticky desc, posts.created_at desc", :limit => 8 )
    @fix_its = Post.find( :all, :conditions => [ 'post_type_id = ? and interest_point_id = ? and ( posts.created_at >= ? and posts.created_at <= ? ) and is_draft = ?', 6, @poi.id, 14.days.ago, 14.days.from_now, false ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => "posts.sticky desc, posts.created_at desc", :limit => 8 )
    
  end
    
end
