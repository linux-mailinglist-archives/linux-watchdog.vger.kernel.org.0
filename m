Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D17E1AF7
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Oct 2019 14:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390427AbfJWMmP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Oct 2019 08:42:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46397 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389887AbfJWMmP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Oct 2019 08:42:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so20905706ljl.13;
        Wed, 23 Oct 2019 05:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=kQcNlSjXQd9kUXGNlIQxjvubKLwEBgtwHBAUWhoJSUo=;
        b=RLwZOE4I9m8jfKeHOzrw1/MTSF29HoL3SdyPRi7cL+3lpzp17iEpxmrM1nEEQlCQWS
         rEUOszMLaFKknu4qElVzpANJgTtviAiDq5xfGtQUwHxSWpZhiwFwmmywXMR3tpfnfrMo
         sJvdn0WVViK9DIq2TgImBgPcqD6pjbl8BVY4JNkN1kRY1/ugi21YyIoqMeKuKjcosBHV
         aCozKnpLmO2nxc0Ad8YPDIJMKlreFi4v99mFm3Ho3d7ZQwC02RABk7UBi9t/CQ+0PJcq
         3hx9pjMluXdYW1TyptgpKx61LbxcZnKOimbJMQMBVH5jLmT+6ZQrguaeCIqWtbaBkJop
         a/yQ==
X-Gm-Message-State: APjAAAWjJcnBiNXOh2f3qfzy88hf2K1qhh++4qMlvj/JEAQK4EGcZy5c
        /h+euj8yRFEM+/qoRb5uhq4=
X-Google-Smtp-Source: APXvYqx0/8+u+gdKO6hPWbAni56ZxUpm0GD4YFDTDuu/OepdORNRBC+v14ZTlSNfLqzJtLtwglJysQ==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr15766019ljk.124.1571834532558;
        Wed, 23 Oct 2019 05:42:12 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id x26sm5134522lfq.89.2019.10.23.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 05:42:11 -0700 (PDT)
Date:   Wed, 23 Oct 2019 15:41:59 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: bd70528: Add MODULE_ALIAS to allow module auto
 loading
Message-ID: <20191023124159.GA3490@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The bd70528 watchdog driver is probed by MFD driver. Add MODULE_ALIAS
in order to allow udev to load the module when MFD sub-device cell for
watchdog is added.

Fixes: bbc88a0ec9f37 ("watchdog: bd70528: Initial support for ROHM BD70528 watchdog block")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

I'm not really sure if this is a bug-fix or feature but I guess the
Fixes tag won't harm, right?

 drivers/watchdog/bd70528_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
index b0152fef4fc7..bc60e036627a 100644
--- a/drivers/watchdog/bd70528_wdt.c
+++ b/drivers/watchdog/bd70528_wdt.c
@@ -288,3 +288,4 @@ module_platform_driver(bd70528_wdt);
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("BD70528 watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:bd70528-wdt");
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
