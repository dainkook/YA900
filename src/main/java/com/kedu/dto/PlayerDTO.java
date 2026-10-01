package com.kedu.dto;

public class PlayerDTO {

    private int player_id;
    private String player_name;
    private String player_team;
    private String player_image;
    private String player_position;

    public PlayerDTO() {}

    public PlayerDTO(int player_id, String player_name,
                     String player_team, String player_image,
                     String player_position) {

        this.player_id = player_id;
        this.player_name = player_name;
        this.player_team = player_team;
        this.player_image = player_image;
        this.player_position = player_position;
    }

    public int getPlayer_id() {
        return player_id;
    }

    public void setPlayer_id(int player_id) {
        this.player_id = player_id;
    }

    public String getPlayer_name() {
        return player_name;
    }

    public void setPlayer_name(String player_name) {
        this.player_name = player_name;
    }

    public String getPlayer_team() {
        return player_team;
    }

    public void setPlayer_team(String player_team) {
        this.player_team = player_team;
    }

    public String getPlayer_image() {
        return player_image;
    }

    public void setPlayer_image(String player_image) {
        this.player_image = player_image;
    }

    public String getPlayer_position() {
        return player_position;
    }

    public void setPlayer_position(String player_position) {
        this.player_position = player_position;
    }
}