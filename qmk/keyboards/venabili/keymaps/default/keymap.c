// $ qmk compile -kb venabili -km default
// $ sleep 3 && doas dfu-util -a 2 -d 1EAF:0003 -D ./venabili_default.bin

#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /*
     * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
     * │ A │ B │ C │ D │ E │ F │ G │ H │ I │ J │ K │ L │
     * ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
     * │ A │ B │ C │ D │ E │ F │ G │ H │ I │ J │ K │ L │
     * ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
     * │ A │ B │ C │ D │ E │ F │ G │ H │ I │ J │ K │ L │
     * ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
     * │ A │ B │ C │ D │ E │ F │ G │ H │ I │ J │ K │ L │
     * └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
     */
    [0] = LAYOUT_ortho_4x12(
        KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_MINUS,
        MT(MOD_RCTL, KC_ESCAPE),    KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SEMICOLON,    MT(MOD_RCTL, KC_ENTER),
        KC_LSFT,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMMA,    KC_DOT,    KC_SLASH,    KC_RSFT,
        KC_LWIN,    KC_LALT,    KC_RALT,    MO(4),    MO(3),    LT(2, KC_SPACE),    KC_SPACE,    MO(3),    KC_NO,    KC_RALT,    KC_LALT,    KC_RWIN
    ),

    // Gaming layer
    [1] = LAYOUT_ortho_4x12(
        KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_MINUS,
        KC_LCTL,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SEMICOLON,    KC_ENTER,
        KC_LSFT,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMMA,    KC_DOT,    KC_SLASH,    KC_RSFT,
        KC_LWIN,    KC_LALT,    MO(4),    MO(3),    MO(2),    KC_SPACE,    KC_SPACE,    MO(2),    KC_NO,    KC_ESCAPE,    KC_LALT,    KC_RWIN
    ),


    [2] = LAYOUT_ortho_4x12(
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    LSFT(KC_6),    LSFT(KC_7),    LSFT(KC_8),    LSFT(KC_9),    LSFT(KC_0),    KC_EQUAL,
        KC_LCTL,    KC_NO,    KC_NO,    KC_NO,    KC_LSFT,    KC_LSFT,    KC_LEFT,    KC_DOWN,    KC_UP,    KC_RIGHT,    KC_QUOTE,    KC_BACKSLASH,
        KC_LSFT,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_BACKSPACE,    KC_DELETE,    KC_LEFT_BRACKET,    KC_RIGHT_BRACKET,    LSFT(KC_QUOTE),    LSFT(KC_BACKSLASH),
        KC_LWIN,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_SPACE,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO
    ),

    [3] = LAYOUT_ortho_4x12(
        LSFT(KC_GRAVE),    LSFT(KC_1),    LSFT(KC_2),    LSFT(KC_3),    LSFT(KC_4),   LSFT(KC_5),    KC_DOT,    KC_7,    KC_8,    KC_9,    KC_NO,    KC_EQUAL,
        KC_GRAVE,    KC_GRAVE,    KC_QUOTE,    KC_QUOTE,    LSFT(KC_QUOTE),    LSFT(KC_QUOTE),    KC_0,    KC_4,    KC_5,    KC_6,    LSFT(KC_8),    LSFT(KC_9),
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_BACKSPACE,   KC_1,    KC_2,    KC_3,    KC_SLASH,  LSFT(KC_0),
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_SPACE,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO
    ),

    [4] = LAYOUT_ortho_4x12(
        QK_BOOT,    KC_NO,    KC_NO,    KC_NO,    DF(0),    DF(1),    KC_NO,    KC_F7,    KC_F8,    KC_F9,    KC_F10,    KC_HOME,
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_F4,    KC_F5,    KC_F6,    KC_F11,    KC_END,
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_F1,    KC_F2,    KC_F3,    KC_F12,    KC_NO,
        KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO,    KC_NO
    ),
};
