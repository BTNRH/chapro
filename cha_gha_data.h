// cha_data.h - data size = 6664 bytes
#ifndef CHA_DATA_H
#define CHA_DATA_H

static CHA_DATA cha_magic[4] = {0x55530,0x68131,21,6664};
static CHA_DATA p00[      64] = { // _size
               256,        64,       128,      2048,       160,       160,       160,      1888,
                32,        32,        32,        32,        32,        32,        32,       128,
                 8,       512,       400,       400,       128
};
static CHA_DATA p01[      16] = { // _ivar
                32,         8,         5,        59,       128,         0,         0,       100,
               100,       100
};
static double   p02[      16] = { // _dvar
            0.908230841,    0.998517215,          24000,            119,              0,
                    105,             10,            105,    0.980191946,    0.998517215,
                  0.001,          0.984,              0,   0.0884767669
};
static CHA_DATA p03[     512] = {         0};
static CHA_DATA p04[      40] = {
        0x3F800000,0x40800000,0x40C00000,0x40800000,0x3F800000,0x3F800000,0x00000000,0xC0000000,
        0xA6000000,0x3F800000,0x3F800000,0x00000000,0xC0000000,0xA6000000,0x3F800000,0x3F800000,
        0x00000000,0xC0000000,0xA6000000,0x3F800000,0x3F800000,0x00000000,0xC0000000,0xA6000000,
        0x3F800000,0x3F800000,0x00000000,0xC0000000,0xA6000000,0x3F800000,0x3F800000,0x00000000,
        0xC0000000,0xA6000000,0x3F800000,0x3F800000,0xC0800000,0x40C00000,0xC0800000,0x3F800000
};
static CHA_DATA p05[      40] = {
        0x3F800000,0xC0727F33,0x40AC72CE,0xC05A380A,0x3F4F490A,0x3F800000,0xC07AA159,0x40B8B9DE,
        0xC072F4A5,0x3F7090C7,0x3F800000,0xC07600D5,0x40B2FF21,0xC069B631,0x3F671295,0x3F800000,
        0xC06CE446,0x40A87740,0xC059F28B,0x3F58C157,0x3F800000,0xC05A5B66,0x4094F801,0xC03EE2F0,
        0x3F43E08B,0x3F800000,0xC0343075,0x4064EC82,0xC01115DC,0x3F26D0EE,0x3F800000,0xBFD056F9,
        0x4000A17F,0xBF928031,0x3F015F3D,0x3F800000,0xBF1DC13F,0x3F1B35F6,0xBE0DA672,0x3CCECD2A
};
static CHA_DATA p06[      40] = {         0};
static CHA_DATA p07[     472] = {         0};
static CHA_DATA p08[       8] = {
        0x3620D502,0x397C115E,0x3A6FDCAD,0x3B2134C6,0x3BAF7233,0x3C709D84,0x3D1A1DBB,0xBE18B5CF
};
static CHA_DATA p09[       8] = {
        0x41B80000,0x3F800000,0x41B00000,0x42100000,0x42300000,0x42480000,0x42540000,0x42680000
};
static CHA_DATA p10[       8] = {
        0x4200CCCD,0x41D40000,0x41D5999A,0x41D5999A,0x41EE6666,0x42066666,0x42093333,0x4202CCCD
};
static CHA_DATA p11[       8] = {
        0x3F333333,0x3F666666,0x3F800000,0x3F8CCCCD,0x3F99999A,0x3FB33333,0x3FCCCCCD,0x3FD9999A
};
static CHA_DATA p12[       8] = {
        0xC15981D8,0xC184BA2A,0xC0730F28,0x40D3C361,0x4134E148,0x41BDBF14,0x420F6F35,0x42158DD3
};
static CHA_DATA p13[       8] = {
        0x42825852,0x428F37DC,0x42ADCDED,0x42B9AAA6,0x42C46666,0x42CE999A,0x42CBCCCD,0x42C7999A
};
static CHA_DATA p14[       8] = {         0};
static CHA_DATA p15[      32] = {         0};
static CHA_DATA p16[       2] = {         0};
static CHA_DATA p17[     128] = {         0};
static CHA_DATA p18[     100] = {         0};
static CHA_DATA p19[     100] = {
        0x00000000,0xBAE0C9DA,0x39A06EA0,0x3C0205FF,0xBC6770BD,0x3A9E3433,0x3AC9FB61,0x3D25E13B,
        0x3D9F76A3,0x3D8E7E63,0xBC037B4A,0xBDD92D99,0xBE1AC216,0xBDFE7E20,0xBD64766C,0x3C5EEFE5,
        0x3D99EB64,0x3DA8E714,0x3D47CE96,0x3B919EF9,0xBD0AE536,0xBD08AEFB,0xBC5F0D41,0x3C3C5DEA,
        0x3D0304CD,0x3D26EA85,0x3D00B674,0x3C755DE6,0xBAC0CE92,0xBBCCFF22,0xBC0461FA,0xBB52E515,
        0xBA749492,0x3B00E8C9,0xB95A1A93,0xBB73BA77,0xBC16FEB5,0xBC49320E,0xBC669F06,0xBC5EB95E,
        0xBC5CF894,0xBC24F00F,0xBBF00EF1,0xBB9EDBF9,0xBB807BBB,0xBB464FDB,0xBB16DD27,0xBAEF1349,
        0xBAB04AB6,0xB96BEDFA,0x3ACE2D1F,0x3B5CEBFF,0x3B71C326,0x3B6831AD,0x3B3E1EB4,0x3B06BDF5,
        0x3AB43958,0x3A684274,0x39D0AAA8,0xB8BED741,0xBA180B24,0xBA8C1DB0,0xBACDA6E7,0xBB0D1959,
        0xBB335F3D,0xBB59A522,0xBB7FEB07,0xBB931876,0xBBA63B69,0xBB987831,0xBB8919F0,0xBB73775C,
        0xBB54BAD8,0xBB360F1B,0xBB175297,0xBB00C73B,0xBAE1B4BB,0xBAC1DB01,0xBAA20147,0xBA82278D,
        0xBA449BA6,0xBA56B229,0xBA7E047D,0xBA9289DB,0xBAA63305,0xBAB9DC2F,0xBACD63CC,0xBAE10CF6,
        0xBAF4B620,0xBB041EDE,0xBB0DF373,0xBB102DE0,0xBB102DE0,0xBB102DE0,0xBB102DE0,0xBB102DE0,
        0xBB102DE0,0xBB102DE0,0xBB102DE0,0xBB102DE0
};
static CHA_DATA p20[      32] = {         0};

static CHA_DATA *cha_data[NPTR+1] = {
    (CHA_DATA *)p00,(CHA_DATA *)p01,(CHA_DATA *)p02,
    p03, p04, p05, p06, p07, p08, p09, p10, p11, p12, p13, p14, p15, p16, p17, p18,
    p19, p20,
    cha_magic
};

#endif // CHA_DATA_H
