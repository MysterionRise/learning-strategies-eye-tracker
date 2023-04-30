default_font_size = 24;
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
pcl_file = "training_3_stim_pic_question.pcl";
response_matching = simple_matching;
active_buttons = 3;
button_codes = 1, 2, 3;
write_codes = true;
response_port_output = false;
response_logging = log_active;

begin;
  wavefile{ filename = "sound\\notify.wav"; } wfile;
  wavefile{ filename = "sound\\notify.wav"; } wfile1;
  wavefile{ filename = "sound\\bech.wav"; } wfile_new;
  picture {
    text { caption = " "; } txt;
    x = 0; y = 0;
  } pic;

  #sound
  trial {
    nothing {};
    time = 0;

    stimulus_event {
      sound { wavefile wfile; } sound_sound;
      parallel = true;
      time = 0;
    } sound_event;

    stimulus_event {
      picture {
        text { caption = "Test1"; } text1;
        x = 0; y = -300;
      } pic1;
      time = 50;
    } pict1;
  } sound_trial;

  trial {
    trial_duration = 2000; #duration 3 sec

    stimulus_event {
      sound { wavefile wfile; } sound_sound1;
      parallel = true;
      #port_code = 3; #trigger
    } sound_event2;
  } sound_trial2;

  trial {
    trial_duration = 100; #duration 0.1

    stimulus_event {
      picture pic;
      #port_code = 21; #trigger_2
    } port_code_event_2;
  } port_code_trial;

  #picture
  trial {
    trial_duration = 3000; #duration 3 sec
    picture {
      bitmap { filename = ""; preload = false; } bitmap_file;
      x = -200; y = 0;
      bitmap { filename = ""; preload = false; } bitmap_file2;
      x = 200; y = 0;
    } picture_pic;
  } picture_trial;

  #cross
  trial {
    trial_duration = 1000; #time to present the instruction
    stimulus_event {
      picture {
        text { caption = "+"; } instruction;
        x = 0; y = 0;
      };
      #response_active = true;
    };
  } cross_trial;

  #text question
  #trial {
  #   trial_duration = 5000; #time to present the instruction
  #      picture {
  #         text { caption = "Test1"; } text1;
  #         x = 0; y = -300;
  #      } pic1;
  #      #response_active = true;
  #} text_question_trial;

  #question
  trial {
    trial_duration = 5000; #time to present the sentence - 5sec
    trial_type = first_response;

    stimulus_event {
      picture {
        bitmap { filename = "pics\\Jody_black.jpg"; preload = true; } ;
        x = 0; y = 0;
      } question_pic;
      response_active = true;
      duration = 5000;
    };
  } question_trial_1;

  #question_trial_2
  trial {
    trial_duration = 5000; #time to present the sentence - 5sec
    trial_type = first_response;

    stimulus_event {
      picture {
       
        bitmap { filename = "pics\\Jody.jpg"; preload = true; } ;
        x = 0; y = 0;
      } question_pic_tr_2;
      response_active = true;
      duration = 5000;
    };
  } question_trial_2;

  #trial to present question
  #end of word trial

  #instruction trial
  trial {
    trial_duration = 70000; #time to present the instruction
    trial_type = first_response;

    stimulus_event {
      picture {
        bitmap { filename = "pics\\Jody.jpg"; preload = true; } ;
        x = 0; y = 0;
      };
      response_active = true;
      duration = 70000;
    } pic_Joy;

    stimulus_event {
      sound { wavefile wfile_new; } sound_sound_instr;
    } sound_event_instr;
  } instruction_trial;
  #end instruction trial

  #end instruction trial

  #sound trial
  trial {
    trial_duration = 3000;
    start_delay = 500;
    stimulus_event {
      picture {
        #text { caption = "+--"; } icross;
        bitmap { filename = "pics\\recording_img.jpg"; preload = true; } ;
        x = 0; y = 0;
      } p1;
      time = 0;
      code = "target";
    };
    stimulus_event {
      sound_recording {
        duration = 3000;
        base_filename = "G:\\Sound\\temp\\test3.wav";
        #use_counter = false;
        #use_date_time = false;
      } srecording;
      #deltat = 0;
      code = "rec";
    };
  } recordingtrial;
  #end sound trial
