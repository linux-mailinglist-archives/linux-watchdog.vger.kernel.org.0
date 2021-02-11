Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D066318777
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Feb 2021 10:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBKJxr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Feb 2021 04:53:47 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:41860 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhBKJun (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Feb 2021 04:50:43 -0500
Received: by mail-lf1-f46.google.com with SMTP id d24so7209478lfs.8;
        Thu, 11 Feb 2021 01:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=znM62LdaK161ZnCyEZoLn126psE687kCEgju9qI/rkc=;
        b=ry6dOv7nxIKxfal06h/eGg9cJmeiWeKx7lY+FtJ0s7YjN2uCvKb1a78ypyBLUKdrEn
         AXmpbcIckrZiDltEYyyv9lgv5f2EDXOM4qAUM6Fnho58gfbOxmQa/Zp9iyDporoeDXzH
         F9ledEgMdXxxgXOu32djx34qedKmXS6ZsjWh/idczEv/Ms63NFssPEjdAI03kOCxwCK/
         7w7B5ZO9eCDQePp7mfS7t7CoxFck1CwEYX1sQ9id/eyeYSYZlsihxrQ0uZTAxF3qsQfM
         CFu0RcAgAcFu85zWSFjq7smdUVnNh/Gw2lLZwuQbOyvQoZH5ovnVtW05B2rY1YPOTzPj
         khMQ==
X-Gm-Message-State: AOAM533RfovjpzY48AxW7mL43r96xwJ8fnwGC5OnmfAeuqhMBbkz3w1/
        JBBlVANQhr4yjt7ltSczvwM=
X-Google-Smtp-Source: ABdhPJx2o58k4UK0UXLTBhO5Q6P0xw5axzi0/3L8dptxm28nXQD78vJpk2JzNuMQ0hY/r+LftBY1fQ==
X-Received: by 2002:a05:6512:224b:: with SMTP id i11mr3567066lfu.652.1613036992502;
        Thu, 11 Feb 2021 01:49:52 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id v129sm596742lfa.104.2021.02.11.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 01:49:51 -0800 (PST)
Date:   Thu, 11 Feb 2021 11:49:45 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 5/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <f40a1c110efb6f9daf1fc48f40daf2b691445ae3.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---

No changes. (Ack added)

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 667d03852191..0bc076cb1815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15339,16 +15339,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
