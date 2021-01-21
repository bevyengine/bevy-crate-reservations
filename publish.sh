# add crates here (they will automatically have "bevy_" prefixed). ex: "hello" will become the "bevy_hello" crate
crates=(
)

rm -rf crates
mkdir crates

for crate in "${crates[@]}"
do
  cp -r template crates/bevy_$crate
  sed -i "s/_CRATE/_$crate/g" crates/bevy_$crate/Cargo.toml
done

cd crates
for crate in *
do
  echo "Publishing ${crate}"
  (cd $crate; cargo publish --allow-dirty)
  echo $crate >> ../reserved_crates
  sleep 15
done
cd ..
