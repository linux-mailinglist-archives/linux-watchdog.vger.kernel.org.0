Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CFDEADE
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 21:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbfD2T2l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 15:28:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43258 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbfD2T2k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 15:28:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id e67so5806255pfe.10;
        Mon, 29 Apr 2019 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zMXiwgjvtDUD1JgP0fZUvJHdTaY8BBg28l03u7zynPQ=;
        b=hwQR60+XW+Ex9w89lMRy4zW9zZcFcSxJn4uvM3BuMaZ5isPOc34dE8ty4bY0QIHKmE
         I1fT8OauHX+w5+Sr6thENSl+5HrnaY0gOzRosy0zH5DapmVKlkL6Kv3t9kXYLtCnSNwy
         VwX5RT2nbDKJb+e85RNe3Yi4pYbocy7SlXGCn0AvckDYIiralgKKyUY/MXb6348uUXyt
         WGLplWrUj/NPFjg791nHVtiP0DdV9MYP57Emu+eVDcIn+72JSw+zZT73hzij+HipTVMH
         h6Nhji0nZYZJBWTGWr7DGcnveCbIJbJsGEFmhJ2JMy1WYzFNdRMCnBfq2f8Fif0f6hXJ
         AeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=zMXiwgjvtDUD1JgP0fZUvJHdTaY8BBg28l03u7zynPQ=;
        b=UOX3cBH7g9A4okpRAiTs7e5LLQb9CeAmHgjR8Z7V5tEfShydx8DfM//DQ40rxmGGfH
         YCEN/eKXBRyzQWgNguuwoQx1h35Xh2wlvJ7YsNLgUiVhYPLD6gzM2RyToVjqAA9U55zH
         re0TQtTOJPBxhrX/lBAH+G0a0azgpQUrWrO5MIRPdjJmRFz/eTXt7YAHIqbf/7gRYLxp
         deaPNiUZF0dkeSErbW1LwGH7McIhVJBXx2oDZg+Tq6G2D+NEIoJR7j6cSKLPBkfnaVBz
         ZgloBCtovn3iNpN3BAuCUwkO+B8VhZI2W92jaHJXepsMdpkyn40ROtujj4hjbWnlYlKj
         WLTg==
X-Gm-Message-State: APjAAAUEzaEXZofoBrrfhlp+1CGhVhAY/Wibs9aQqtIN61rJiBfetWl1
        BmnCXx9ogYZga32JsejrDzM=
X-Google-Smtp-Source: APXvYqxjaUGeoKNm81722Fq7OOemlAEQb7+hjGDhjjlBWDPhCp5DnhOspN2+rtc6xDMG1Uq9UXeV9g==
X-Received: by 2002:a63:c54a:: with SMTP id g10mr37236700pgd.71.1556566119630;
        Mon, 29 Apr 2019 12:28:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20sm48495447pfn.84.2019.04.29.12.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:28:39 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] watchdog: npcm: Enable modular builds
Date:   Mon, 29 Apr 2019 12:28:30 -0700
Message-Id: <1556566111-31970-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
References: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Most of the NPCM7XX drivers can be built as modules.
The NPCM7XX watchdog driver code supports building it as
module, but its configuration option is set to bool.
Make itr tristate to actually support modular builds.
This improves consistency with other drivers for the
same platform and enables including the driver in multi-
platform configurations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c2d6934508ee..e5b30c4947d7 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -618,7 +618,7 @@ config COH901327_WATCHDOG
 	  compiled as a module.
 
 config NPCM7XX_WATCHDOG
-	bool "Nuvoton NPCM750 watchdog"
+	tristate "Nuvoton NPCM750 watchdog"
 	depends on ARCH_NPCM || COMPILE_TEST
 	default y if ARCH_NPCM7XX
 	select WATCHDOG_CORE
-- 
2.7.4

