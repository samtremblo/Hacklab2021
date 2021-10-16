import math


SPEED_OF_SOUND = 0.34
ONE_OVER_SPEED_OF_SOUND = 1 / SPEED_OF_SOUND


def gain_from_distance(distance):
    """
    Calculate gain from distance
    :param distance:
    :return:
    """

    return math.log(distance_to_attenuation(distance)) * 20


def variable_delay(distance, factor):
    """
    Calculate delay from distance
    :param distance:
    :param factor:
    :return:
    """

    return math.pow(distance * ONE_OVER_SPEED_OF_SOUND, factor * 0.01)


def get_distance_freq(distance):
    """
    Calculate low pass cut-off
    Simulates air absorption based on distance.
    :param distance:
    :return:
    """

    ms = distance * ONE_OVER_SPEED_OF_SOUND
    hz = 1.0 - (ms * 0.00034002)
    hz = 100.0 + (hz * hz * 19900.0)
    return hz


def distance_to_attenuation(distance):
    """
    A very crude distance to attenuation conversion.
    (we use the abs of the number you give us.)
    :param distance: Absolute distance in meters.
    :return:
    """

    d = abs(distance)
    if d <= 1.0:
        return 1.0
    attenuation = 1.0 / d
    return attenuation


def xyz_to_aed(xyz):
    """
    Converts XYZ to AED.
    :param xyz: list of three floats
    :return: tuple of three floats
    """

    x = xyz[0]
    y = xyz[1]
    z = xyz[2]

    distance = math.sqrt((x * x) + (y * y) + (z * z))
    azimuth = math.atan2(z, x) - math.pi / 2
    # put in range of [-pi, pi]
    if azimuth > math.pi:
        azimuth -= 2 * math.pi
    elif azimuth < -math.pi:
        azimuth += 2 * math.pi
    if distance > 0.0000001:
        elevation = math.asin(y / distance)
    else:
        elevation = 0.0

    return math.degrees(-azimuth), math.degrees(elevation), distance
