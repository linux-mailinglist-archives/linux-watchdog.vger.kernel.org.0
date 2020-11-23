Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3AEB2C0008
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 07:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgKWGVk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 Nov 2020 01:21:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40865 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKWGVk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 Nov 2020 01:21:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id y10so1264864ljc.7;
        Sun, 22 Nov 2020 22:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Tpo4PGHFkbg8q5VpiQAUx+1sgUIwRhfOHQXgi9fu0w=;
        b=oH5HR63zpjvlU3N+146m/bwNxrbgQjaPtVXG83Nw9exWz99wg93MRg95hIePm/YL08
         /xR8WtxwvWglom6CcuIYWm3J6EmQyH14fPxMDzBrWgeT00h3u+yqDoXJnqo/lN5fsH9K
         o5CNup7jhZiWY1y+aWlU0bM40w387r1ezq3ohbNhHEdrcC9vQOXpBhS23GKa4GvOPUpL
         H0niFYk1BL5KkyhqVYVjkkQiQC3RtrwW94W8JkXxAizptK7yWOktpLElbzQOP7aIPrMd
         R5V9BYH1wA4kEHcxf8wxMH1L0hB4hE9MvvFPHDWlqya6zG//8hKLTout1yEeIUPhpe1T
         6rsw==
X-Gm-Message-State: AOAM5335+xRNHvZ/e8WRUwpmfkKdoWpBLWBIn6fYlUgXggaY8miRIUs5
        rlyOeCqj74fMuBtEOdxCIiY=
X-Google-Smtp-Source: ABdhPJw/2TXW38LJjoYIUYsjKqy67++jI7Dhc2+sOqKpj2zOjKoFNCyLhBHnLCrwfIVvmFSTFlU9oQ==
X-Received: by 2002:a2e:5705:: with SMTP id l5mr12212486ljb.93.1606112495942;
        Sun, 22 Nov 2020 22:21:35 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id j69sm1267481lfj.49.2020.11.22.22.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:21:35 -0800 (PST)
Date:   Mon, 23 Nov 2020 08:21:29 +0200
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
Subject: [PATCH RESEND v6 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF
 drivers
Message-ID: <53f2bb93767ede5719db907374444f4e465006c8.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
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
