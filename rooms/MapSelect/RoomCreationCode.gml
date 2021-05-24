if (audio_is_playing(snd_CharacterSelect))
	{
		
	}
else
{
	audio_stop_all();
	audio_play_sound(snd_CharacterSelect,1,true);
}