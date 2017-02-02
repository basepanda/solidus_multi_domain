Spree::TaxonsController.class_eval do
  def show
    @taxon = Spree::Taxon.find_by_store_id_and_permalink!(current_store.id, params[:id])
    return unless @taxon

    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end if SpreeMultiDomain::Engine.frontend_available?
