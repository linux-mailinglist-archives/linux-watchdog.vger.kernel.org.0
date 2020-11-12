Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FFA2B0036
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Nov 2020 08:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKLHNz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Nov 2020 02:13:55 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37532 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgKLHNy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Nov 2020 02:13:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id s30so6830134lfc.4;
        Wed, 11 Nov 2020 23:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Tpo4PGHFkbg8q5VpiQAUx+1sgUIwRhfOHQXgi9fu0w=;
        b=ZfDVcmsZ6sisE57+hZR49U4xDXpbxRpx6LA8/SbuoE/G3waliXsI2k2hkiCgbnYW8E
         go3iN3wpvOsuhMevK7cbnGBzEmpBtkChglIsjUEMU/BYpfLxBaFSgtcz+nRU/RSoC4IL
         Cg+qEvmcU7QFTN/bhNeA5hgcM9ZcMGAqurecN9tU3ubukMRBM36eb6owI5Npot+N1bKs
         3cdsvkEmDosj8U5eSyF4sF1hMjPJGV/HA3OwuPjPyjqz2xvtkr2WbmAfg0cIKcA7e/lc
         njmh+M09UzHaqW7wzubl4h75mAPPNvqCyQI+Y8jYZ2CJhtTSg+omg3C8doZUGTji5yL2
         0HQg==
X-Gm-Message-State: AOAM531dJJR2UA9HQTq+3/VQUYy45251bpQ/+qrkVLXOdLQW6qxbrb58
        zIrR4WhA5GpCkA5l7ImOVss=
X-Google-Smtp-Source: ABdhPJx0hH8XXIiRX8HPGBdUIl3cbi4hTxb788bDHArl9VK0Y40u0uzhWzSLD2ZWJ1BkLf0fYRHftg==
X-Received: by 2002:ac2:4836:: with SMTP id 22mr4379620lft.41.1605165232320;
        Wed, 11 Nov 2020 23:13:52 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z19sm364364lfd.128.2020.11.11.23.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:13:51 -0800 (PST)
Date:   Thu, 12 Nov 2020 09:13:45 +0200
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
Subject: [PATCH v6 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <53f2bb93767ede5719db907374444f4e465006c8.1605164323.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1605164323.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605164323.git.matti.vaittinen@fi.rohmeurope.com>
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
index b516bb34a8d5..0bd788a94376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15088,16 +15088,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
