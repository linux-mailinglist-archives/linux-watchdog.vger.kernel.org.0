Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C503F5B11
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Aug 2021 11:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbhHXJaH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Aug 2021 05:30:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51962 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235642AbhHXJaF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Aug 2021 05:30:05 -0400
X-UUID: 7e43988e7f59449eaada16ee93508e5c-20210824
X-UUID: 7e43988e7f59449eaada16ee93508e5c-20210824
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 19402614; Tue, 24 Aug 2021 17:29:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 17:29:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 17:29:15 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [v3,04/12] pinctrl: mediatek: moore: check if pin_desc is valid before use
Date:   Tue, 24 Aug 2021 17:29:03 +0800
Message-ID: <20210824092904.25439-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Certain SoC are missing the middle part gpios in consecutive pins,
it's better to check if mtk_pin_desc is a valid pin for the extensibility

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Sean Wang <sean.wang@mediatek.com>

---
v3: added an Acked-by tag.
v2: applied the comment suggested by reviewers:
    - for the pins not ballout, we can fill .name in struct mtk_pin_desc
      as NULL and return -ENOTSUPP in gpio/pinconf ops.
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 3a4a23c40a71..ad3b67163973 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -60,6 +60,8 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		int pin = grp->pins[i];
 
 		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+		if (!desc->name)
+			return -ENOTSUPP;
 
 		mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
 				 pin_modes[i]);
@@ -76,6 +78,8 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
 				hw->soc->gpio_m);
@@ -89,6 +93,8 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	/* hardware would take 0 as input direction */
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !input);
@@ -103,6 +109,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -218,6 +226,8 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int cfg, err = 0;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
 		param = pinconf_to_config_param(configs[cfg]);
@@ -435,6 +445,8 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	int value, err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
 	if (err)
@@ -449,6 +461,10 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	if (!desc->name) {
+		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
+		return;
+	}
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
@@ -490,6 +506,8 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	u32 debounce;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	if (!hw->eint ||
 	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-- 
2.29.2

