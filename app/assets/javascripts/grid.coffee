$(document).on 'turbolinks:load', () ->
  $ ->
    resizeGridItem = (item) ->
      GRID = document.querySelector '[data-grid="masonry"]'
      GRID.style.gridAutoRows = '1px';

      gridCS = window.getComputedStyle GRID
      rowHeight = parseInt gridCS.getPropertyValue('grid-auto-rows')
      rowGap = parseInt gridCS.getPropertyValue('grid-row-gap')
      rowSum = rowHeight + rowGap

      content = item.querySelector '[data-grid="content"]'
      contentHeight = content.getBoundingClientRect().height + rowGap
      rowSpan = Math.ceil(contentHeight / rowSum)
      item.style.gridRowEnd = "span #{rowSpan}"

    resizeAllGridItems = () ->
      allItems = document.querySelectorAll '[data-grid="item"]'
      for x in [0..(allItems.length - 1)]
        resizeGridItem(allItems[x])

    resizeInstance = (instance) ->
      item = instance.elements[0]
      resizeGridItem item

    window.onload = resizeAllGridItems()
    window.addEventListener 'resize', resizeAllGridItems