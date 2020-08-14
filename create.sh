# add crates here
crates=(
  base
)

for crate in "${crates[@]}"
do
  cp -r template crates/bevy_$crate
  sed -i "s/_CRATE/_$crate/g" crates/bevy_$crate/Cargo.toml
done