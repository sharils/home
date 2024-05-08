#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ai() {
  if [ $# -eq 0 ]; then
    openai repl
    return
  fi
  case "$1" in

  add-type-annotations-for-this-python-code)
    shift && (
      echo 'Add type annotations for this Python code'
      cat "$@"
    ) | openai complete -
    return
    ;;

  fix-mypy-warnings-in-this-python-code)
    shift && (
      echo 'Fix mypy warnings in this Python code'
      cat "$@"
      mypy "$@"
    ) | openai complete -
    return
    ;;

  rewrite-these-tests-to-use-pytest-parametrized)
    shift && (
      echo 'Rewrite these tests to use pytest.parametrized'
      cat "$@"
    ) | openai complete -
    return
    ;;

  write-python-function-to-calculate-fibonacci-numbers)
    shift && (
      echo 'Write Python function to calculate Fibonacci numbers'
    ) | openai complete -
    return
    ;;

  write-unit-tests-for-this-python-module-named-fib)
    shift && (
      printf 'Write unit tests for this Python module named "fib":\n'
      cat "$@"
    ) | openai complete -
    return
    ;;

  # https://www.facebook.com/photo/?fbid=112335851759941&set=pcb.112341338426059
  crafting-business-canvas-models) shift && set -- "Generate a business canvas model for ${*:-an agriculture tech product that helps farmers increase their crop yield.}" ;;

  # https://www.facebook.com/photo/?fbid=112335928426600&set=pcb.112341338426059
  market-sizing) shift && set -- "Act as a Product Manager. Assume TAM is Total Addressable Market, SAM is Serviceable Available Market and SOM is Serviceable Obtainable Market. How should I go about estimating the TAM, SAM and SOM for ${*:-an Al-based online form builder tool?}? Please give examples of research sources I should check out." ;;

  # https://www.facebook.com/photo/?fbid=112336035093256&set=pcb.112341338426059
  expanding-product-lines) shift && set -- "I am a Product Manager of ${*:-an ed tech platform that helps students of any age learn how to code and start taking up freelance projects}. I am already monetizing this service well and now want to branch off to other areas. What adjacent product or services can I offer that leverages my strengths and can quickly turn a profit?" ;;

  # https://www.facebook.com/photo/?fbid=112336091759917&set=pcb.112341338426059
  aiding-product-ideation) shift && set -- "Suggest ${1:-3 tech product ideas} I could pursue in the ${2:-solar energy domain} that could turn a profit in ${3:-less than 2 years}. Describe the idea and also share how it will make money." ;;

  # https://www.facebook.com/photo/?fbid=112336188426574&set=pcb.112341338426059
  aligning-teams-with-a-1-pager-memo) shift && set -- "I am a Product Manager planning to build ${1:-a new mobile app that is like Uber for petrol}. It helps busy people ${2:-order fuel for their car on-demand and get a refill while they are at home or office}. Write a 1-pager that I can share with my engineering and design team to explain the product vision & the product components that will most likely be involved." ;;

  # https://www.facebook.com/photo/?fbid=112336248426568&set=pcb.112341338426059
  work-backwards-from-a-press-release-amazon) shift && set -- "Assume you’re building a ${1:-fitness app that recommends workout routines to a user based on their goals and habits}. You’re launching a new feature that will give users ${2:-virtual points for their personal milestones that they can redeem for gift cards}. Using Amazon’s Working Backwards model, write a press release for this product feature. Include some impressive metrics. Give it a catchy title." ;;

  # Training ChatGPT on the stategy framework first https://www.facebook.com/photo?fbid=112336305093229&set=pcb.112341338426059
  drafting-a-product-strategy-based-on-a-framework) shift && set -- "Gibson Biddle has a product strategy framework called the
DHM Model. D stands for delight (how does the product delight customers and add real value), H stands for hard-to-copy (what is an advantage that your product has that is hard to copy and compete with) and M stands for margin-enhancing (how will the product generate a profit and sustain the business). In short, the DHM model dims to answer: \"How will your product delight customers, in hard-to-copy, margin-enhancing ways?\".
Now, act as a Product Manager for ${*:-a web analytics tool like Google Analytics}. Give me a product strategy for this product using Biddle’s DHM model." ;;

  # https://www.facebook.com/photo/?fbid=112336381759888&set=pcb.112341338426059
  competitive-intelligence-summaries) shift && set -- "I’m developing ${1:-a SaaS product that helps restaurants directly sell to their consumers through branded websites & mobile apps without going to a marketplace}. We are serving the ${2:-US market for now}. We help users ${3:-build a personalized website with their branding, customize the menu, launch a white-labelled mobile app & run loyalty deals}. Our unique value prop is that we ${4:-auto-suggest seasonal push notification & email campaigns}. Can you write a competitive intelligence report comparing us to other players that I can share in an investor brief?" ;;

  # https://www.facebook.com/photo/?fbid=112336425093217&set=pcb.112341338426059
  questions-to-uncover-jobs-to-be-done) shift && set -- "Assume I’m a Product Manager for ${1:-a grocery delivery mobile app}. It will be serving the ${2:-Toronto GTA region only}. I want to conduct some consumer research to figure out my consumer's jobs-to-be-done. What personas should I target and then what questions should I be asking them to elicit their job-to-be-done. Take inspiration from the book \"Mom Test\"" ;;
  esac

  echo "$*" | openai complete -
}

ai "$@"
