cdef extern from "hb-ft.h":
    hb_face_t *hb_ft_face_create (FT_Face ft_face,hb_destroy_func_t destroy)
    hb_font_t *hb_ft_font_create (FT_Face ft_face,hb_destroy_func_t destroy)
  
cdef extern from "hb.h":
    ctypedef struct hb_glyph_info_t:
        hb_codepoint_t codepoint
        hb_mask_t      mask
        uint32_t       cluster
        hb_var_int_t   var1
        hb_var_int_t   var2
  
    ctypedef struct hb_glyph_position_t:
        hb_position_t  x_advance
        hb_position_t  y_advance
        hb_position_t  x_offset
        hb_position_t  y_offset
        hb_var_int_t   var
    
    hb_buffer_t *hb_buffer_create (void)
    hb_buffer_t *hb_buffer_get_empty (void)
    hb_buffer_t *hb_buffer_reference (hb_buffer_t *buffer)
  
    void hb_buffer_destroy (hb_buffer_t *buffer)
    void hb_buffer_add (hb_buffer_t  *buffer,hb_codepoint_t  codepoint, unsigned int    cluster)
    void hb_buffer_add_utf8 (hb_buffer_t  *buffer,const char *text,int text_length, unsigned int  item_offset,int item_length)
    void hb_buffer_add_utf16 (hb_buffer_t  *buffer,const uint16_t *text,int text_length,unsigned int item_offset,int item_length)
    void hb_buffer_add_utf32 (hb_buffer_t  *buffer,const uint32_t *text,int text_length,unsigned int item_offset,int item_length)
    void hb_buffer_add_latin1 (hb_buffer_t   *buffer,const uint8_t *text,int text_length,unsigned int item_offset,int item_length)
    void hb_buffer_add_codepoints (hb_buffer_t *buffer, const hb_codepoint_t *text,int text_length,unsigned int item_offset,int item_length)

    hb_bool_t hb_buffer_set_length (hb_buffer_t  *buffer, unsigned int  length)
    unsigned int hb_buffer_get_length (hb_buffer_t *buffer) 
    hb_glyph_info_t *hb_buffer_get_glyph_infos (hb_buffer_t  *buffer,unsigned int *length)
    hb_glyph_position_t *hb_buffer_get_glyph_positions (hb_buffer_t  *buffer,unsigned int *length)
  
    void hb_shape (hb_font_t *font,hb_buffer_t *buffer,const hb_feature_t  *features, unsigned int num_features)
    void hb_font_destroy (hb_font_t *font)