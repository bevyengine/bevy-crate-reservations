cd crates
for crate in *
do
  echo "Publishing ${crate}"
  (cd $crate; cargo publish)
  sleep 30
done
cd ..