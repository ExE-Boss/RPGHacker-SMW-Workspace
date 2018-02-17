@asar 1.50
@includefrom "../shared.asm"

; This file is included by shared.asm and should not be included directly

!shared_asm_included ?= 1

if !shared_asm_included == 0

	error "Trying to include 'smw_structs.asm' directly, which is meant to be included from 'shared.asm' only."
	
else

	!smw_structs_asm_included ?= 0

	if !smw_structs_asm_included == 0
		!smw_structs_asm_included = 1

		pushpc : org remap_rom($008000) ; Needed because otherwise the structs don’t properly process the RAM remapping
		struct sprite remap_ram($9E)
			.number:	skip (remap_ram($AA)-remap_ram($9E))
			.yspeed:	skip (remap_ram($B6)-remap_ram($AA))
			.xspeed:	skip (remap_ram($C2)-remap_ram($B6))
			.state:	skip (remap_ram($D8)-remap_ram($C2))
			.y_pos_low:	skip (remap_ram($E4)-remap_ram($D8))
			.x_pos_low:	skip (remap_ram($14C8)-remap_ram($E4))
			.status:	skip (remap_ram($14D4)-remap_ram($14C8))
			.y_pos_high:	skip (remap_ram($14E0)-remap_ram($14D4))
			.x_pos_high:	skip (remap_ram($14EC)-remap_ram($14E0))
			.y_speed_frac:	skip (remap_ram($14F8)-remap_ram($14EC))
			.x_speed_frac:	skip (remap_ram($1504)-remap_ram($14F8))
			.misc_1:	skip (remap_ram($1510)-remap_ram($1504))
			.misc_2:	skip (remap_ram($151C)-remap_ram($1510))
			.misc_3:	skip (remap_ram($1528)-remap_ram($151C))
			.misc_4:	skip (remap_ram($1534)-remap_ram($1528))
			.misc_5:	skip (remap_ram($1540)-remap_ram($1534))
			.misc_6:	skip (remap_ram($154C)-remap_ram($1540))
			.misc_7:	skip (remap_ram($1558)-remap_ram($154C))
			.misc_8:	skip (remap_ram($1564)-remap_ram($1558))
			.misc_9:	skip (remap_ram($1570)-remap_ram($1564))
			.misc_10:	skip (remap_ram($157C)-remap_ram($1570))
			.misc_11:	skip (remap_ram($1588)-remap_ram($157C))
			.blocked:	skip (remap_ram($1594)-remap_ram($1588))
			.misc_12:	skip (remap_ram($15A0)-remap_ram($1594))
			.offscreen_h:	skip (remap_ram($15AC)-remap_ram($15A0))
			.misc_13:	skip (remap_ram($15B8)-remap_ram($15AC))
			.slope:	skip (remap_ram($15C4)-remap_ram($15B8))
			.offscreen_4:	skip (remap_ram($15D0)-remap_ram($15C4))
			.yoshi_tounge:	skip (remap_ram($15DC)-remap_ram($15D0))
			.disable_interaction:	skip (remap_ram($15EA)-remap_ram($15DC))
			.oam_index:	skip (remap_ram($15F6)-remap_ram($15EA))
			.xyppccct:	skip (remap_ram($1602)-remap_ram($15F6))
			.misc_14:	skip (remap_ram($160E)-remap_ram($1602))
			.misc_15:	skip (remap_ram($161A)-remap_ram($160E))
			.load_status:	skip (remap_ram($1626)-remap_ram($161A))
			.misc_16:	skip (remap_ram($1632)-remap_ram($1626))
			.behind_scenery:	skip (remap_ram($163E)-remap_ram($1632))
			.misc_17:	skip (remap_ram($164A)-remap_ram($163E))
			.in_liquid:	skip (remap_ram($1656)-remap_ram($164A))
			.properties_1:	skip (remap_ram($1662)-remap_ram($1656))
			.properties_2:	skip (remap_ram($166E)-remap_ram($1662))
			.properties_3:	skip (remap_ram($167A)-remap_ram($166E))
			.properties_4:	skip (remap_ram($1686)-remap_ram($167A))
			.properties_5:	skip (remap_ram($186C)-remap_ram($1686))
			.offscreen_v:	skip (remap_ram($187B)-remap_ram($186C))
			.misc_18:	skip (remap_ram($9E)-remap_ram($187B)+1)
		endstruct

		struct DMA $4300
			.control: skip 1
			.destination: skip 1
			.source:
				.source_word:
					.source_word_low: skip 1
					.source_word_high: skip 1
				.source_bank: skip 1
			.size:
				.size_low: skip 1
				.size_high: skip 1
		endstruct align $10

		struct HDMA $4300
			.control: skip 1
			.destination: skip 1
			.source:
				.source_word:
					.source_word_low: skip 1
					.source_word_high: skip 1
				.source_bank: skip 1
			.indirect:
				.indirect_word:
					.indirect_word_low: skip 1
					.indirect_word_high: skip 1
				.indirect_bank: skip 1
			.table:
				.table_low: skip 1
				.table_high: skip 1
			.line_counter: skip 1
		endstruct align $10
		pullpc

	endif
endif
