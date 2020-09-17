Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A5726D59E
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Sep 2020 10:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgIQIGi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 04:06:38 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44821 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgIQIGg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 04:06:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id d15so1150895lfq.11;
        Thu, 17 Sep 2020 01:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z2cMPrnQf5Z9BUMQYWdci5L6icLIhq49YJLAXZRSXl0=;
        b=kUrvj2ln/LJPCG8zTbIvcsKQvsnbtdlg0xseXAwcrITiIyn0qFPo9xVUMp/00H70MM
         dfLkJF+FzLyfieUqS0nsXw1LPCdgOFSlx8gYXp9msnTkdSsttbGPdD1uwpC2CP7nzPGE
         GVA1Y3glkFKK9W2KrnOWbocWZiLFShfCU0pT7ONK6WZhsyMiW6WoTs0Si27IlIUplnXf
         tt/1HH7d5Xkbt+NIq3ImDGUus8JHXzXnbrBcR2CIpyvKUbMRlLUkQGNZ/nAY/kkbtat+
         pkoNLTk4RQnTI94RoerT1Zhnn1E7/ja670c5VHiT5Dmf4eJsijqvPPU0Tz58o6xxsDza
         dgXQ==
X-Gm-Message-State: AOAM530twc3LrLo8UONqbZY7n2753ZnutIXwvoB2PYxY1EIYvVZy5scF
        QJ+dnEyYNrat6o5mj0Jag9Q=
X-Google-Smtp-Source: ABdhPJzX5oLzb4C53YfeJYtuZP0zd8DG+nEsuvOi+XpsvP5f5D4FioGJS5r7XaMIWwa+3LG/o71vGg==
X-Received: by 2002:ac2:4301:: with SMTP id l1mr8104366lfh.389.1600329843054;
        Thu, 17 Sep 2020 01:04:03 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id t2sm5089852lff.150.2020.09.17.01.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:04:01 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:03:54 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v1 6/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <358f571158d344196dc56b2eab7fcd802a236d69.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5cfab015bd6..630a23fc84f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14956,16 +14956,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
2.21.0


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
