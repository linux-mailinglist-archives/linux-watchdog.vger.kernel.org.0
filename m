Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EFF2ECA8B
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jan 2021 07:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbhAGGhx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jan 2021 01:37:53 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:34237 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbhAGGhx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jan 2021 01:37:53 -0500
Received: by mail-lf1-f49.google.com with SMTP id o19so12223966lfo.1;
        Wed, 06 Jan 2021 22:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=eugQ6sBmsnErNR+lYgl7iFDp5HtAPo4b3aA9DfPqt+s=;
        b=mNwtFTMCl1xizO5O+RPx7fM5ZXVtXkS1reTXwpxUprep7JY7aqLoviT2bTUyslhap5
         zy+9lLYGmJ9vxYBJp8KgSx13E6XrMvu2SYxCCUka8ZZDZHTEmWHSstYHvmpD7Qj3uUro
         iOstd1o0VE8Bzay2owFIDNSq27LrJ/iWLnkZN0WdyrtKkvAZ3vdGOWIqn8CIflaRVz3p
         /E9+MaA05Cbo1WyAPAuCxSumyr2hO9uykcCWrU7VSSPM9rvzm6dGcR6wieyGLHzfeyJM
         y1LCDNrFfZ4ryJci6pF4CHP7h14R7G4/szfFihCitTkE6i4NBd0+LfueXbYMC7VvSzfJ
         vZhw==
X-Gm-Message-State: AOAM531wkp5m3x3Jkj3zW9FjcdaWnWpHrC5iHLEzj9cUW4Fsk+B7t+UU
        qbdsgz+NB5aYKi6lm2/x8+c=
X-Google-Smtp-Source: ABdhPJyXrX4vEvOHyQMS2ciT6sAzN1vrJY7FdCRzKtCqvSzFgr4W4E8Qk2+BjmzQ4SmtbyKSq/5zFA==
X-Received: by 2002:a19:c7cb:: with SMTP id x194mr3375847lff.426.1610001430714;
        Wed, 06 Jan 2021 22:37:10 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id v14sm924248lfe.270.2021.01.06.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 22:37:09 -0800 (PST)
Date:   Thu, 7 Jan 2021 08:37:03 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured with
 BD71828
Message-ID: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If config for BD70528 watchdog is enabled when BD71828 or BD71815
are used the RTC module will issue call to BD70528 watchdog with
NULL data. Ignore this call and don't crash.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/watchdog/bd70528_wdt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
index 0170b37e6674..fde242b8a4a6 100644
--- a/drivers/watchdog/bd70528_wdt.c
+++ b/drivers/watchdog/bd70528_wdt.c
@@ -49,6 +49,21 @@ int bd70528_wdt_set(struct rohm_regmap_dev *data, int enable, int *old_state)
 	u8 wd_ctrl_arr[3] = { WD_CTRL_MAGIC1, WD_CTRL_MAGIC2, 0 };
 	u8 *wd_ctrl = &wd_ctrl_arr[2];
 
+	/*
+	 * BD71828 and BD71815 use same RTC driver as BD70528.
+	 * BD71815 and BD71828 do not need MFD data as they do not share
+	 * RTC counter with watchdog. The BD70528 watchdog should not be
+	 * compiled in with BD71815 or BD71828 and the stub implementation
+	 * for the bd70528_wdt_set should be provided instead.
+	 *
+	 * If one compiles this watchdog with BD71828 or BD71815 - the call
+	 * from RTC may get here and the data pointer is NULL. In that case,
+	 * warn and go out.
+	 */
+	if (!data) {
+		pr_warn("BD70528_WATCHDOG misconfigured\n");
+		return 0;
+	}
 	ret = regmap_read(bd70528->chip.regmap, BD70528_REG_WDT_CTRL, &tmp);
 	if (ret)
 		return ret;

base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
