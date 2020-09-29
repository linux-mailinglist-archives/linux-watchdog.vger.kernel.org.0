Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB35027BF0A
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 10:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgI2IRw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Sep 2020 04:17:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46818 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgI2IRv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Sep 2020 04:17:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id b22so4424963lfs.13;
        Tue, 29 Sep 2020 01:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z2cMPrnQf5Z9BUMQYWdci5L6icLIhq49YJLAXZRSXl0=;
        b=ojIA5V4QGX0i4CNS04m8SotsjZn4mxljmcXssaWN/0YHDzjYu5cvrv71jeo5blhAdN
         zpudWBvW7FC4xwWk5L7B+qRHiI42o89Ny0uDtm36aogD7y1cNHsPYYrZCEjfFPJokeiF
         vE9JMWn+y7ao17IBaZjBrp4V93Cg3ubeCIdVER2IiyaRRJLsPzTrcEE3pR6HkOP51hxw
         jbrTpuHmoxt4mWxjZhqZB8K0kWwC6UItuSfND2k0GpeTpn7LS3qMJRepLlLIF4AHjs6y
         vKx+2LRfSOsIqbOdhrViiwQyUdp3SkoNV9ncJXOx+x8lpMs0nigu7vYB0pCGZiu6qTcG
         jUIw==
X-Gm-Message-State: AOAM533z3OCmrALllTizBitLk8KuoSre5vrZel3KSY1XtJhAVY41ynzf
        HuYEFX34Y62oOemQiD8xwd4=
X-Google-Smtp-Source: ABdhPJyHNR55E4rSPl+IOgewnxKYkupeTBKiBvuirANjU2i7DA2BvJdl4CxAulqo/V13DP5/sVX06Q==
X-Received: by 2002:a19:8b56:: with SMTP id n83mr727271lfd.235.1601367469377;
        Tue, 29 Sep 2020 01:17:49 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id r7sm287958ljd.57.2020.09.29.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 01:17:48 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:17:36 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v3 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <4e81f30a0f2f1ddd6d9890da57e1dead51bd5847.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
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
