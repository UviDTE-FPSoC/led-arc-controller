import yaml
import os


class YamlDict(dict):
    """
    This class is a dict that can synchronize with a yaml file. When
    initializing it is loaded from a yaml class. Then the object can be used
    as a regular dictionary. To update the file with currect dict content call
    save_file function. To save to a different file call export function.
    """

    def __init__(self, file):
        """
        Load the dict content from the yaml file.

        Params
        ------
        - file (string): path of the yml file (example: "folder/test.yml")
        """
        self.file = file
        if os.path.isfile(file):
            with open(file) as f:
                # use super here to avoid unnecessary write
                loaded_object = yaml.safe_load(
                    f,
                )
                super(YamlDict, self).update(loaded_object or {})

    def save_file(self):
        """
        Save the dict content to the yml file passed during initialization.
        """
        with open(self.file, "w") as f:
            yaml.dump(self.copy(), f, default_flow_style=False)

    def export(self, file):
        """
        Export the dict content to a new file.

        Params
        ------
        - filename: yml file path as a string (example: "folder/test.yml")
        """
        file_folder = os.path.dirname(file)
        if not os.path.exists(file_folder):
            os.makedirs(file_folder)
        if not (os.path.isfile(file)):
            open(file, "a").close()
        with open(file, "w") as f:
            yaml.dump(self.copy(), f, default_flow_style=False)

    def __getitem__(self, key):
        """
        Overload getitem to support access to an item by passing a list
        I.e. dict["a","b","c"] instead of dict["a"]["b"]["c"]
        """
        if isinstance(key, list):
            subdict = self
            for k in key:
                subdict = dict.__getitem__(subdict, k)
            return subdict
        else:
            return dict.__getitem__(self, key)
