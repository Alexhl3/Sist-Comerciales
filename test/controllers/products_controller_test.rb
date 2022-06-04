require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get products_path
      assert_response :success
      assert_select '.product', 2
    end
    
    test "render a detaild product page" do
      get product_path(products(:'Maquina_14'))
      assert_response :success
      
      assert_select '.title', 'Maquina 14'
      assert_select '.description', 'Maquina en buen estado.'
      assert_select '.price', '200'
    end
    
    test "render new form" do
      get new_product_path
      assert_response :success

      assert_select 'form'
    end
    
    test "render edit form" do
      get edit_product_path(products(:Maquina_14))

      assert_response :success
      assert_select 'form'
    end

    test "create a new product" do
      post products_path, params: {
        product: {
          title: 'Maquina 18',
          description: 'le faltan cables',
          price: 200
        }
      }

      assert_redirected_to products_path
      assert_equal flash[:notice], 'Tu producto se ha creado con exito!!'
    end
    
    
    test "do not allow to create a product whit a empty field" do
      post products_path, params: {
        product: {
          title: '',
          description: 'le faltan cables',
          price: 200
        }
      }
      
      assert_response :unprocessable_entity
    end
    
    test "edit a product" do
      patch product_path(products(:Maquina_14)), params: {
        product: {
          price: 300
        }
      }
  
      assert_redirected_to products_path
      assert_equal flash[:notice], 'Tu producto se ha actualizado con exito!!'
    end
    
    test "do not allow to edit a product whit a empty field" do
      patch product_path(products(:Maquina_14)), params: {
        product: {
          price: nil
        }
      }
      
      assert_response :unprocessable_entity
    end
  end