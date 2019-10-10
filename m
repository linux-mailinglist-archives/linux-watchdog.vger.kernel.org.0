Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DADD20A1
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2019 08:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732856AbfJJGHs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Oct 2019 02:07:48 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43000 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJJGHs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Oct 2019 02:07:48 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so3405070lfg.9;
        Wed, 09 Oct 2019 23:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GYwpl+dJNMNoXcqNJFFxQgmx1yNVNLIbdWMuM8XH/a0=;
        b=ekNISIm84MiFipvdd8pp5OrxXwE3qgr0PytWDBaWFGlJuf0WfJqbq7Nwa4zk+5A7cV
         gRZp0XbA/q7IMJKsjE8oWLcP9xrhih4iOQSmzKlyef44Vq4rjoXagYz/VM9cYo+QY/C0
         1cPeg8qdN/7zYEKvJXNbJ14mbdJXslkUCx/7ISbAk5wgymAytiQG37ajsEfqCyRW282u
         8dQ+joUEbyeJ7X4LAno6FZAo6QmhJy7t75mMlULRNCK3ZvaG3+sDiFcBlA0TicHe4Lgi
         D7igaIebuGDLAoUFyCI0sErK8xzLlND5BuDlDIPUjk2gI0FOZ+FvLQje17cxQ91CrogO
         DelQ==
X-Gm-Message-State: APjAAAXixSCYjJMonwx1mxR2YHtFt8lSrzGMZSdMemiYqoW1F0HWDPtQ
        izwuZWnWdV1rxjR5w6MJgPo=
X-Google-Smtp-Source: APXvYqz2V7USWc2sG27n/LR7ANjruXPbL1AKm7rjryZYn5k1t8ncB1nNwCuCIs/bQ43h+jqoIzVJiQ==
X-Received: by 2002:a19:4f0e:: with SMTP id d14mr4567119lfb.177.1570687665921;
        Wed, 09 Oct 2019 23:07:45 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id q66sm919806ljq.101.2019.10.09.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 23:07:45 -0700 (PDT)
Date:   Thu, 10 Oct 2019 09:07:33 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jiri Kosina <trivial@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wdt: bd70528: Trivial function documentation fix
Message-ID: <20191010060733.GA9979@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The function documentation for the exported  ROHM BD70528 WDG control
functions used old argument names. Fix the names.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/watchdog/bd70528_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.c
index b0152fef4fc7..439f9920978a 100644
--- a/drivers/watchdog/bd70528_wdt.c
+++ b/drivers/watchdog/bd70528_wdt.c
@@ -97,7 +97,7 @@ EXPORT_SYMBOL(bd70528_wdt_set);
 /**
  * bd70528_wdt_lock - take WDT lock
  *
- * @bd70528:	device data for the PMIC instance we want to operate on
+ * @data:	device data for the PMIC instance we want to operate on
  *
  * Lock WDT for arming/disarming in order to avoid race condition caused
  * by WDT state changes initiated by WDT and RTC drivers.
@@ -114,7 +114,7 @@ EXPORT_SYMBOL(bd70528_wdt_lock);
 /**
  * bd70528_wdt_unlock - unlock WDT lock
  *
- * @bd70528:	device data for the PMIC instance we want to operate on
+ * @data:	device data for the PMIC instance we want to operate on
  *
  * Unlock WDT lock which has previously been taken by call to
  * bd70528_wdt_lock.
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
