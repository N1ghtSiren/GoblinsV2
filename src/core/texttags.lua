texttags =  {}

texttags.new = function(caster, duration, font_size, text)
    local tt = CreateTextTag()
    SetTextTagText(tt, text, font_size)
    SetTextTagPos(tt, GetUnitX(caster) + GetRandomReal(-10, 10), GetUnitY(caster) + GetRandomReal(-10, 10), GetUnitFlyHeight(caster) + 60)
    SetTextTagVisibility(tt, true)
    SetTextTagPermanent(tt, false)
    SetTextTagLifespan(tt, duration)
    SetTextTagFadepoint(tt, duration - 0.5)
    SetTextTagVelocity(tt, 0, 0.03)
end