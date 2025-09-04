# Obtener aplicaciónes `get-apps.sh`
Este script abre un `txt`, ignora comentarios, y establece todas las lineas en una sola, seperandolas con un solo espacio.

**Ejemplo de uso:**

Supongamos que tenemos `aplicaciones.txt`:
```
app
app2
```

Pos lo usamos así:
```bash
echo $(./get-apps.sh aplicaciones.txt)
```

Resultado:
```
app app2
```




---

# `debian13-apt-get-apps.sh`
Depende de `get-apps`. Básicamente hace lo mismo que `get-apps`, solo que añade este prefix `debian13-apt-[parametro].txt`

**Ejemplo de uso:**

Supongamos que tenemos `debian13-apt-chido.txt`:
```
fastfetch
nano
```

Se usaria asi:
```bash
sudo apt install $(./debian13-apt-get-apps.sh chido)
```

Resultado:
```bash
sudo apt install fastfetch nano
```




----

# `debian13-install-apps.sh`
Depende de `debian13-apt-get-apps.sh`, y pos es para hacer todo de manera mas avanzada, y con mas debug.

**Ejemplo de uso:**
```bash
./debian13-install-apps.sh essential-kde
```

Resultado:
```
# Archivos
- `debian13-apt-backup.txt`
- `debian13-apt-dev-java.txt`
- `debian13-apt-dev-multimedia.txt`
- `debian13-apt-dev-python.txt`
- `debian13-apt-drivers-amd-mesa.txt`
- `debian13-apt-essential-general.txt`
- `debian13-apt-essential-kde.txt`
- `debian13-apt-games.txt`
- `debian13-apt-remove-apps.txt`

# Aplicaciones fijas
`kmail kaddressbook konqueror goldendict-ng kasumi juk audacious dragonplayer sweeper idle-python3.13 xiterm+thai mozc-data mozc-server uim anthy`

# Actualizar y establecer x86 packages
Obj:1 http://deb.debian.org/debian trixie InRelease
Obj:2 http://deb.debian.org/debian trixie-updates InRelease
Obj:3 https://dl.winehq.org/wine-builds/debian trixie InRelease
Obj:4 https://packages.microsoft.com/debian/12/prod bookworm InRelease
Obj:5 http://deb.debian.org/debian trixie-backports InRelease
Obj:6 https://repo.waydro.id trixie InRelease
Obj:7 http://security.debian.org/debian-security trixie-security InRelease
Leyendo lista de paquetes...
Creando árbol de dependencias...
Leyendo la información de estado...
Todos los paquetes están actualizados.

# Aplicaciones seleccionadas
Paquetes: `breeze-gtk-theme adwaita-qt adwaita-qt6 libadwaitaqt6-dev libadwaitaqt1 breeze-gtk-theme oxygen-icon-theme arc-kde qt5-style-kvantum plasma-theme-oxygen kwin-decoration-oxygen`

Preciona enter continuar, o `Ctrl+C` para cancelar...
```