Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9873336FD
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 09:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhCJIJe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 03:09:34 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:38962 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbhCJIJN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 03:09:13 -0500
Received: by mail-lf1-f52.google.com with SMTP id 18so31935476lff.6;
        Wed, 10 Mar 2021 00:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=utscGuqXIGxjBAlNkCq9csSstrZuCLJzrPRz23S5lJ0=;
        b=LC3KcbwC7MM5M3li4QLSXFi0C3phyjYF3OoYPTfJP2RQcz/c+l60fD7aFo1mR7e+sF
         5TQUZnQHG9JI60E4tvxxXNiEldMcqsDrCn3otyTtR+0TvObEVvF8f9yfAAKRBYWYK3Ux
         nxJFOIxvoh4lyc0KXOyANKAS7y5flS+3UXMZC1sHTfU4c09e8eWDMyJkWds8eJIy67lO
         zSBUyNKY9IuOn/MvYHw0BoqjXEnWCUTHV/zOmD++XvBOD2tDdHueG59BA6OkvpRPQN/x
         tAWlBy5nSYvulXNcKufBoT+jzKk8/bc9zxs6oIUJpjyuq3ZqJLcAd0cX31MFZSyT9eHg
         5lQg==
X-Gm-Message-State: AOAM533t096529GQM2dX50G7UL4ZY+xjy1uMatHqwrTCKL2fGCMn7bYO
        T5hrfwqKTT+uuxjPaZW0YFQ=
X-Google-Smtp-Source: ABdhPJwyi/1eoMrUgywdHwsKgqWiYWgEus5qeBagsJ40BvLn5wfDQQIpTKYQ98oSUHbGFmzHLuVyKw==
X-Received: by 2002:a05:6512:31c1:: with SMTP id j1mr1384668lfe.313.1615363751473;
        Wed, 10 Mar 2021 00:09:11 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id v129sm2638791lfa.43.2021.03.10.00.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:09:11 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:09:04 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v9 5/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <162bfc4caabd26e412f798360809e1c11613bc9a.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
No changes from v8

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..10d5f706c8b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15456,16 +15456,20 @@ F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
+F:	drivers/mfd/rohm-bd9576.c
 F:	drivers/power/supply/bd70528-charger.c
 F:	drivers/regulator/bd70528-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
+F:	drivers/regulator/bd9576-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd70528_wdt.c
+F:	drivers/watchdog/bd9576_wdt.c
 F:	include/linux/mfd/rohm-bd70528.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
 
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
