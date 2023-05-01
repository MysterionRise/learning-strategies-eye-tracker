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
  wavefile{ filename = "sound\\notify.wav"; } wfile1;
  wavefile{ filename = "sound\\notify.wav"; } wfile2;
  wavefile{ filename = "sound\\notify.wav"; } wfile3;
  wavefile{ filename = "sound\\bech.wav"; } wfile_new;

  picture {
    text { caption = " "; } txt;
    x = 0; y = 0;
  } pic;

  # sound
  trial {
    nothing {};
    time = 0;

    stimulus_event {
      sound { wavefile wfile1; } sound_sound1;
      parallel = true;
      # параметры старта после креста
      time = 800;
    } sound_event1;

    stimulus_event {
      sound { wavefile wfile2; } sound_sound2;
      parallel = true;
      # параметры старта звука
      time = 2500;
    } sound_event2;

    stimulus_event {
      sound { wavefile wfile3; } sound_sound3;
      parallel = true;
      # параметры старта звука
      time = 3500;
    } sound_event3;

    stimulus_event {
      picture {
        text { caption = "Test1"; } text1;
        x = 0; y = -300;
      } pic1;
      time = 800;
    } pict1;
  } sound_trial;

  trial {
    trial_duration = 100; # duration 0.1

    stimulus_event {
      picture pic;
    } port_code_event_2;
  } port_code_trial;

  # picture
  trial {
    trial_duration = 3000; # duration 3 sec
    picture {
      bitmap { filename = ""; preload = false; } bitmap_file;
      x = -200; y = 0;
      bitmap { filename = ""; preload = false; } bitmap_file2;
      x = 200; y = 0;
      text { caption = "Test1"; } text2;
      x = 0; y = -300;
    } picture_pic;
  } picture_trial;

  # cross
  trial {
    trial_duration = 1000; # time to present the instruction
    stimulus_event {
      picture {
        text { caption = "+"; } instruction;
        x = 0; y = 0;
      };
    };
  } cross_trial;

  # question
  trial {
    trial_duration = 30000; # time to present the sentence - 5sec
    trial_type = first_response;

    stimulus_event {
      picture {
        bitmap { filename = "pics\\kb.jpg"; preload = true; } ;
        x = 0; y = 0;
      } question_pic;
      response_active = true;
      duration = 30000;
    };
  } question_trial;

  # end of word trial
  # instruction trial
  trial {
    trial_duration = 30000; # time to present the instruction
    trial_type = first_response;

    stimulus_event {
      picture {
        text { caption = "Press the button"; } instruction1;
         x = 0; y = 0;
       
      };
      response_active = true;
      duration = 30000;

   };
} instruction_trial;
#end instruction trial
