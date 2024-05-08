#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

sdg() {
  cat <<'EOF' | grep -E 'Goal .*?\.'
Goal 1: No Poverty. End poverty in all its forms everywhere
Goal 2: Zero hunger. End hunger, achieve food security and improved nutrition, and promote sustainable agriculture.
Goal 3: Good health and well-being. Ensure healthy lives and promote well-being for all at all ages.
Goal 4: Quality education. Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all.
Goal 5: Gender equality. Achieve gender equality and empower all women and girls.
Goal 6: Clean water and sanitation. Ensure availability and sustainable management of water and sanitation for all.
Goal 7: Affordable and clean energy. Ensure access to affordable, reliable, sustainable and modern energy for all.
Goal 8: Decent work and economic growth. Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all.
Goal 9: Industry, Innovation and Infrastructure. Build resilient infrastructure, promote inclusive and sustainable industrialization, and foster innovation.
Goal 10: Reduced inequality. Reduce inequality within and among countries.
Goal 11: Sustainable cities and communities. Make cities and human settlements inclusive, safe, resilient, and sustainable.
Goal 12: Responsible consumption and production. Ensure sustainable consumption and production patterns.
Goal 13: Climate action. Take urgent action to combat climate change and its impacts.
Goal 14: Life below water. Conserve and sustainably use the oceans, seas and marine resources for sustainable development.
Goal 15: Life on land. Protect, restore and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss.
Goal 16: Peace, justice and strong institutions. Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels.
Goal 17: Partnerships for the goals. Strengthen the means of implementation and revitalize the global partnership for sustainable development.

https://sdgs.un.org/goals
EOF
}

sdg "$@"
