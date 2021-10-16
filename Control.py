import logging

import bpy
from bpy.app.handlers import persistent
from mathutils import Vector, Matrix

from typing import TYPE_CHECKING, List
from pysatie.satie import Satie

from .utils import SoundUtils

satie: Satie = None


logger = logging.getLogger(__name__)

if TYPE_CHECKING:
    from bpy.types import PropertyGroup


def satie_instance_handler() -> None:
    synths: List = update_synth_list()
    if satie:
        for synth in synths:
            listener_name: str = synth.satie.listener
            listener: bpy.types.Object = bpy.data.objects[listener_name]
            translation: Matrix = synth.matrix_world @ listener.matrix_world.inverted_safe()
            aed: List = SoundUtils.xyz_to_aed(translation.translation)
            distance = aed[2]
            gain: float = SoundUtils.gain_from_distance(distance)
            satie.node_update(
                synth.name,
                aed[0],
                aed[1],
                gain,
                SoundUtils.variable_delay(distance, 100),
                SoundUtils.get_distance_freq(distance)
            )
            params: PropertyGroup = synth.SynthParameters.items()
            for param in params:
                satie.node_set(synth.name, param[0], param[1])


@persistent
def satie_instance_cb(scene: bpy.types.Scene) -> None:
    satie_instance_handler()


def update_synth_list() -> List:
    synths: List = bpy.satie_instances
    return synths


@persistent
def load_handler(dummy):
    for ob in bpy.data.objects:
        if ob.satie.enabled:
            bpy.context.view_layer.objects.active = bpy.data.objects[ob.name]
            logging.debug(f"Instantiating {ob.name}")
            bpy.ops.satie.create()
