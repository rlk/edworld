//  Copyright (C) 2005 Robert Kooima
//
//  THUMB is free software; you can redistribute it and/or modify it under
//  the terms of  the GNU General Public License as  published by the Free
//  Software  Foundation;  either version 2  of the  License,  or (at your
//  option) any later version.
//
//  This program  is distributed in the  hope that it will  be useful, but
//  WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
//  MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
//  General Public License for more details.

#ifndef DEMO_HPP
#define DEMO_HPP

#include <app-prog.hpp>

//-----------------------------------------------------------------------------

namespace mode
{
    class mode;
}

namespace dev
{
    class input;
}

namespace wrl
{
    class world;
}

namespace ogl
{
    class uniform;
}

//-----------------------------------------------------------------------------

class demo : public app::prog
{
    // Configuration.

    int key_edit;
    int key_play;
    int key_info;

    int tracker_head_sensor;
    int tracker_hand_sensor;

    // Entity state.

    wrl::world *world;

    // Editor mode.

    mode::mode *edit;
    mode::mode *play;
    mode::mode *info;
    mode::mode *curr;

    void goto_mode(mode::mode *);

    // Renderer uniforms.

    ogl::uniform *uniform_light_position;
    ogl::uniform *uniform_light_theta_cos;
    ogl::uniform *uniform_light_theta;
    ogl::uniform *uniform_view_matrix;
    ogl::uniform *uniform_view_inverse;
    ogl::uniform *uniform_view_position;
    ogl::uniform *uniform_time;
    ogl::uniform *uniform_color_max;
    ogl::uniform *uniform_reflection_cubemap_size;
    ogl::uniform *uniform_irradiance_cubemap_size;
    ogl::uniform *uniform_spherical_harmonic_order;
    ogl::uniform *uniform_XYZRGB;
    ogl::uniform *uniform_perez[5];
    ogl::uniform *uniform_zenith_luminance;

    void init_uniforms();
    void free_uniforms();
    void prep_uniforms() const;
    
    // Demo state.

    dev::input *input;

    double attr_sign;
    double attr_curr;
    double attr_rate;
    double attr_time;
    bool   attr_mode;
    bool   attr_stop;

    void attr_on();
    void attr_off();
    void attr_step(double);
    void attr_next();
    void attr_prev();
    void attr_ins();
    void attr_del();

    // Event handlers

    bool process_key  (app::event *);
    bool process_input(app::event *);
    bool process_timer(app::event *);

public:

    demo(const std::string&);
   ~demo();

    bool process_event(app::event *);

    ogl::range prep(int, const app::frustum * const *);
    void       lite(int, const app::frustum * const *);
    void       draw(int, const app::frustum *);

    void next();
    void prev();
};

//-----------------------------------------------------------------------------

#endif
