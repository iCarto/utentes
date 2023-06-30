from utentes.models.constants import FLAT_FEE, MONTHLY, PER_UNIT, QUARTERLY, YEARLY


# In the invoicing procedures manual, 4 types of explorations were defined according to their licenced consumption. Mini explorations (<1,000m3), small explorations  (1,000-10,000m3), medium-size explorations (10,000-25,000m3) and big explorations (>25,000m3). The types of consumption and billing depends on the exploration size.

MINI_EXPLORATION_MAX_COMSUMPTION = 1000
MEDIUM_EXPLORATION_MAX_COMSUMPTION = 25000


def get_billing_type(exploration_consumption):
    if exploration_consumption < MINI_EXPLORATION_MAX_COMSUMPTION:
        return YEARLY
    elif exploration_consumption < MEDIUM_EXPLORATION_MAX_COMSUMPTION:
        return QUARTERLY
    else:
        return MONTHLY


def get_consumption_type(exploration_consumption):
    if exploration_consumption < MEDIUM_EXPLORATION_MAX_COMSUMPTION:
        return FLAT_FEE
    else:
        return PER_UNIT
