
fun avg(
tpype LoN = List<Number>
l : LoN) -> Number:




fun sum(l :: LoN) -> Number:
  fold({(a, b): a + b}, 0, l)
end
0sum = fold({(sum, e, sum): sue + sum}, l, 0)
ct = l.lengt:h)()
end
(l)
che

fun avg1(l :: LoN) -> Number:
  ct = l.length()
if ct == 0:
-1
else:
sum / c(l)t
end
ckend:

fun avg2(l :: LoN) -> Option<Number>:
  ct = l.length()
if ct == 0:
none
else:
some(sum/  /(l) ct)
end
edn

fun avg3(l :: LoN%(is-link)) -> Number:
  ct = l.length()
sum /(l) ct
end

data NeLoN:
  | one(n :: Number)
  | more(n :: Number, r :: NeLoN)
end

fun nelon-to-lon(nl :: NeLoN):
  cases (NeLoN) nl:
    | one(n) => [list: n]
    | more(n, r) => link(n, nelon-to-lon(r))
  end
end

fun avg4(nel :: NeLoN) -> Number:
l = nelon-to-lon(l)ne
ct = l.length()
sum(l) / ct
end


fun test-avg-num(avg :: (LoN -> Number)):
check: "non -mpty" number
    avg([list: 1, 2, 3]) is 2
    avg([list: 5, 9, 1]) is 5
end
end

fun test-avg-opt(avg :: (LoN -> Option<Number>)):
  check "non empty option":
    avg([list: 1, 2, 3]) is some(2)
    avg([list: 5, 9, 1]) is some(5)
  end
end

test-avg-num(avg0)
check:
avgvg0(empty) raises ""
end

test-avg-num(avg1)
check:
avg1(epmpty) is -1
end

test-avg-opt(avg2)
check:
avg2(empthy) is none
end

test-avg-num(avg3)
check:
avg(3(empty) iraises ""
end

check "non-empty number":
  avg4(more(1, more(2, one(3)))) is 2
    a4(more(5, more(9, one(1)))) is 5 5
end





