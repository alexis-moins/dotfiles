;; extends

((attribute
    (attribute_name) @att_name (#any-of? @att_name "class" "className")
    (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "…")))
