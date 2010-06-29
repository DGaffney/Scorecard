jQuery(function(){

        // Accordion
        jQuery("#accordion").accordion({ header: "h3", collapsible: true, autoHeight: false });
				
        // Tabs
        jQuery('#tabs').tabs();


        // Dialog
        jQuery('#dialog').dialog({
                autoOpen: false,
                width: 600,
                buttons: {
                        "Ok": function() {
                                jQuery(this).dialog("close");
                        },
                        "Cancel": function() {
                                jQuery(this).dialog("close");
                        }
                }
        });

        // Dialog Link
        jQuery('#dialog_link').click(function(){
                jQuery('#dialog').dialog('open');
                return false;
        });

        // Datepicker
        jQuery('#datepicker').datepicker({
                inline: true
        });

        // Slider
        jQuery('#slider').slider({
                range: true,
                values: [17, 67]
        });

        // Progressbar
        jQuery("#progressbar").progressbar({
                value: 20
        });

        //hover states on the static widgets
        jQuery('#dialog_link, ul#icons li').hover(
                function() { jQuery(this).addClass('ui-state-hover'); },
                function() { jQuery(this).removeClass('ui-state-hover'); }
        );

});