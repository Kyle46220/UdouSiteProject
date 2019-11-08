module CabConfigsHelper
 def price_calc(project_hash)
  # project_hash = {
  #   height: new_height_select.to_i,
  #   width: cab_width.to_i,
  #   depth: cab_depth.to_i,
  #   shelves: shelves.to_i,
  #   cupboards: [],
  #   drawers: [],
  #   colour: colour,
    material_thickness = 18

    size_1 = 180
    size_2 = 280
    size_3 = 380
  
  # }

  # project_hash = project_hash.map { |k, v| [k.to_sym, v] }

  materials_list = {
    plywood: {
      name: 'plywood',
      price: 100,
      type: 'panel'
    },
    shelf_support: {
      name: 'shelf_support',
      price: 1,
      type: 'fixing'
  
    },
    connector: {
      name: 'connector',
      price: 4,
      type: 'fixing'
    }
  }
  
  total_price = []
  
  def cabinet_carcasse_parts_generator(cabinet_height, cabinet_width, cabinet_depth, material_thickness)
    carcasse_array = []

    cabinet_height = cabinet_height.to_i
    cabinet_width = cabinet_width.to_i
    cabinet_depth = cabinet_depth.to_i
    two_times_thk = material_thickness * 2
  
    side_length = cabinet_height - two_times_thk
  
    top = {
      part_length: cabinet_width,
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    bottom = {
      part_length: cabinet_width,
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    side_L = {
      part_length: side_length,
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    side_R = {
      part_length: side_length,
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    carcasse_array << top
    carcasse_array << bottom
    carcasse_array << side_L
    carcasse_array << side_R
    carcasse_array
  end
  
  def divider_parts_generator(cabinet_height, _cabinet_width, cabinet_depth, material_thickness)

    cabinet_height = cabinet_height.to_i
    cabinet_width = cabinet_width.to_i
    cabinet_depth = cabinet_depth.to_i

    div_array = []
  
    div = {
      part_length: cabinet_height - (2 * material_thickness),
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    div_array << div
  
    div_array
  end
  
  def divider_quantity_calculator(cabinet_width)
    cabinet_width = cabinet_width.to_i
    
    if cabinet_width < 700
      0
    elsif cabinet_width >= 700 && cabinet_width < 1200
      1
    elsif cabinet_width >= 1200 && cabinet_width < 1700
      2
    elsif cabinet_width >= 1700 && cabinet_width < 2200
      3
  
    elsif cabinet_width >= 2200 && cabinet_width <= 2400
      4
  
    end
  end
  
  def part_assigner(part_qty, method)
    
    result = []
    part_qty = part_qty.to_i
    part_qty.times do
      result << method
    end
    result
  end
  
  def shelf_parts_generator(cabinet_height, cabinet_width, cabinet_depth, material_thickness)

    cabinet_height = cabinet_height.to_i
    cabinet_width = cabinet_width.to_i
    cabinet_depth = cabinet_depth.to_i

    shelf_array = []
  
    shelf = {
      part_length: cabinet_width - (2 * material_thickness),
      part_width: cabinet_depth,
      part_thickness: material_thickness
    }
  
    shelf_array << shelf
  
    shelf_array
  end
  
  def array_joiner(*arr)
    # p arr
    array = []
    array << arr
    array.flatten.flatten
  end
  
  def row_builder(arr)
    result = []
    row1 = []
    row2 = []
    row3 = []
    row4 = []
    row5 = []
    row6 = []
    row7 = []
    row8 = []
    row9 = []
    row10 = []
    row11 = []
    row12 = []
    row13 = []
    row14 = []
    row15 = []
    row16 = []
    row17 = []
    row18 = []
    row19 = []
    row20 = []
    row21 = []
    row22 = []
    row23 = []
    row24 = []
  
    arr.each do |item|
      if row1.sum + item < 2400
        row1 <<  item if item == arr[0]
  
      elsif row2.sum + item < 2400
        row2 <<  item if item == arr[0]
  
      elsif row3.sum + item < 2400
        row3 <<  item if item == arr[0]
  
      elsif row4.sum + item < 2400
        row4 <<  item if item == arr[0]
  
      elsif row5.sum + item < 2400
        row5 <<  item if item == arr[0]
  
      elsif row6.sum + item < 2400
        row6 <<  item if item == arr[0]
  
      elsif row7.sum + item < 2400
        row7 <<  item if item == arr[0]
      elsif row8.sum + item < 2400
        row8 <<  item if item == arr[0]
      elsif row9.sum + item < 2400
        row9 <<  item if item == arr[0]
      elsif row10.sum + item < 2400
        row10 <<  item if item == arr[0]
      elsif row11.sum + item < 2400
        row11 <<  item if item == arr[0]
      elsif row12.sum + item < 2400
        row12 <<  item if item == arr[0]
      elsif row13.sum + item < 2400
        row13 <<  item if item == arr[0]
      elsif row14.sum + item < 2400
        row14 <<  item if item == arr[0]
      elsif row15.sum + item < 2400
        row15 <<  item if item == arr[0]
      elsif row16.sum + item < 2400
        row16 <<  item if item == arr[0]
      elsif row17.sum + item < 2400
        row17 <<  item if item == arr[0]
      elsif row18.sum + item < 2400
        row18 <<  item if item == arr[0]
      elsif row19.sum + item < 2400
        row19 <<  item if item == arr[0]
      elsif row20.sum + item < 2400
        row20 <<  item if item == arr[0]
      elsif row21.sum + item < 2400
        row21 << item if item == arr[0]
      elsif row22.sum + item < 2400
        row22 <<  item if item == arr[0]
      elsif row23.sum + item < 2400
        row23 <<  item if item == arr[0]
      elsif row24.sum + item < 2400
        row24 <<  item if item == arr[0]
  
      end
  
      arr = arr.drop(1)
    end
  
    result << row1
    result << row2
    result << row3
    result << row4
    result << row5
    result << row6
    result << row7
    result << row8
    result << row9
    result << row10
    result << row11
    result << row12
    result << row13
    result << row14
    result << row15
    result << row16
    result << row17
    result << row18
    result << row19
    result << row20
    result << row21
    result << row22
    result << row23
    result << row24
  
    remove_empty_rows = result.reject(&:empty?)
  
    remove_empty_rows
  end
  
  def sheet_counter(arr, depth)
    depth = depth.to_i
    sheet_qty = if depth < 296
                  arr.length / 4.0
  
                elsif depth >= 296 && depth < 396
  
                  arr.length / 3.0
  
                elsif depth >= 396 && depth < 596
  
                  arr.length / 2.0
  
                else arr.length
  
                end
  
    sheet_qty.ceil
  end
  
  def value_extractor(arr, _key)
    result = arr.map do |item|
      item.values[0]
    end
  
    result.compact.sort.reverse
  end
  
  carcasse_parts = cabinet_carcasse_parts_generator(project_hash[:height], project_hash[:width], project_hash[:depth], material_thickness)
  
  div_part_size = divider_parts_generator(project_hash[:height], project_hash[:width], project_hash[:depth], material_thickness)
  
  assigned_dividers = part_assigner(divider_quantity_calculator(project_hash[:width]), divider_parts_generator(project_hash[:height], project_hash[:width], project_hash[:depth], material_thickness))
  
  shelf_parts_size = shelf_parts_generator(project_hash[:height], project_hash[:width], project_hash[:depth], material_thickness)
  
  # shelf_quantity_constraint = shelf_qty_constraint(project_hash[:height], size_1, size_3)
  
  assigned_shelf_parts = part_assigner(project_hash[:shelf_qty], shelf_parts_generator(project_hash[:height], project_hash[:width], project_hash[:depth], material_thickness))
  
  complete_parts_array = array_joiner(carcasse_parts, assigned_dividers, assigned_shelf_parts)
  
  divider_quantity = divider_quantity_calculator(project_hash[:width])
  
  part_length_array = value_extractor(complete_parts_array, project_hash[:length])
  
  row_array = row_builder(part_length_array)
  
  plywood_total = sheet_counter(row_array, project_hash[:depth])
  
  def machining_length_estimate(arr)
    # p arr
    result = arr.map do |item|
      item.values[0..3]
    end
  
    result.flatten.sum
  end
  
  def machining_handling_qty(_arr)
    array.length
  end
  
  def fixing_qty(qty_per_join, *arr)
    array = []
    array << arr
  
    array.flatten.flatten
    # if array.length > 1
    #     array.flatten
    # end
    array.length * qty_per_join
  end
  
  def price_calculator(qty, price)
    qty * price
  end
  
  machining_fee_per_mm = 0.008
  
  handling_fee_per_piece = 2
  
  panel_cost = price_calculator(plywood_total, materials_list[:plywood][:price])
  
  connectors_per_panel = 4
  
  supports_per_shelf = 8
  
  carcasse_sides = carcasse_parts.drop(2)
  
  connector_qty = fixing_qty(connectors_per_panel, assigned_dividers, carcasse_sides)
  
  shelf_support_qty = fixing_qty(supports_per_shelf, assigned_shelf_parts)
  
  connector_cost = price_calculator(connector_qty, materials_list[:connector][:price])
  
  shelf_support_cost = price_calculator(shelf_support_qty, materials_list[:shelf_support][:price])
  
  total_machining_length = machining_length_estimate(complete_parts_array)
  
  total_pieces = complete_parts_array.length
  
  machining_cost = price_calculator(total_machining_length, machining_fee_per_mm) + price_calculator(total_pieces, handling_fee_per_piece)
  
  # p machining_cost
  
  def mark_up(mark_up, *item)
    item.sum * mark_up
  end
  
  final_price = mark_up(3, panel_cost, connector_cost, shelf_support_cost) + mark_up(1.3, machining_cost)
  
  
end
end
