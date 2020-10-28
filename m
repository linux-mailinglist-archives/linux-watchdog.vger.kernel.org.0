Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19B029DB0F
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 00:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbgJ1XnG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 19:43:06 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:43961 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733098AbgJ1Xdg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 19:33:36 -0400
Received: by mail-ej1-f66.google.com with SMTP id k3so1290160ejj.10;
        Wed, 28 Oct 2020 16:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hlw+558qpBpj8ZAjXi3IcNQaKJ2jxrNS3pQGBSKAH4Q=;
        b=in7/3f82JcmPcF2kz5eRc5IuO0OFbcD1NK1aRtypbLnXIz0yZ0ThJbAvXP6NAkpsNV
         Y9pLYiw0kwxXB9S/fKd+tmwdUHiQb5ZgkaUUC6fzuCIaKNNHamvc45nuAV+VCzmWPz9P
         lvemf7ICYWw3BXhHrPIKJAKM8vydO96fqwumcmr/vwrotsd0DEfvNKQITkuIsq3eBrMb
         bG2g/dljeItxxpC5xtTyEKkW1iSmOJCyCPHOj1SXHZeV1/JO79VaVHx8vQoWMmlbtW4X
         RWimOjAHUFy5ySDnvbEb+51whs21d3wrrOrnO3T2jnD2h5loam1KcitpwLnfTBeNlHw2
         Qa4w==
X-Gm-Message-State: AOAM532rt7RUsVyAoURhZrafMOMDVmsM0Vqk0WxbFU/frfPcP2+KMe3h
        Xd65W+nr9ghWRIIvXfLluZt+kyHepGd2iQ==
X-Google-Smtp-Source: ABdhPJxMNCE3kCRTItkoNG4C9NwL3LOP9z3ou/SBDT2ukapwr1VcXkiqplejyiF9C3g85Vo3sr8jIw==
X-Received: by 2002:a19:bed7:: with SMTP id o206mr2171759lff.360.1603878552431;
        Wed, 28 Oct 2020 02:49:12 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id m19sm473500lfl.38.2020.10.28.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 02:49:11 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:49:05 +0200
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
Subject: [PATCH v4 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <e94af0a5c71f4b38af81d7cc5e0d46b844dbbe5b.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
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
index e73636b75f29..2940fd439a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15108,16 +15108,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
2.21.3


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
