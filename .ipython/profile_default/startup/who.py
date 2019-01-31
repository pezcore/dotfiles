import numpy as np

def human_readable_size(size, fmt):
    for unit in ['','kB','MB','GB','TB']:
        if size < 1024.0:
            break
        size /= 1024.0
    return f"{size:{fmt}} {unit}"

def woo(vardict=None, sort=False):

    if vardict is None:
        vardict = globals()
    elif not isinstance(vardict, dict):
        vardict = vars(vardict)

    d_realnames = {
        x : y for x, y in vardict.items() if isinstance(y, np.ndarray)
    }

    namelen = max(max(map(len, d_realnames.keys())), 4)
    shapelen = max(map(lambda x: len(str(x.shape)), d_realnames.values()))
    total_len = 55 + namelen + shapelen

    print(
        f"{'dtype':<7} {'name':{namelen}} {'shape':{shapelen}} "
        f"{'flags':<7} {'id':<14} {'data_pointer':<14} {'nbytes':12} "
        "human_nbytes\n",
        "=" * total_len, sep=""
    )

    it = sorted(d_realnames.items()) if sort else d_realnames.items()
    for x, y in it:
        flags = ''.join([
            "C" if y.flags.c_contiguous else " ",
            "F" if y.flags.f_contiguous else " ",
            "O" if y.flags.owndata else " ",
            "W" if y.flags.writeable else " ",
            "A" if y.flags.aligned else " ",
            "X" if y.flags.writebackifcopy else " "])
        print(
            f"{y.dtype.str:7} {x:{namelen}} {str(y.shape):{shapelen}} "
            f"{flags:7} 0X{id(y):12X} 0X{y.ctypes.data:12X} {y.nbytes:<12}",
            human_readable_size(y.nbytes, "<6.2f")
        )
